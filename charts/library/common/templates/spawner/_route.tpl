{{/* Renders the Route objects required by the chart */}}
{{- define "tc.v1.common.spawner.routes" -}}
  {{- include "tc.v1.common.lib.gateway.primaryValidation" (dict "rootCtx" $ "key" "route" "caller" "Route") -}}
  {{- $hasIngressEnabled := (include "tc.v1.common.lib.ingress.hasPrimary" $ | fromJson).hasEnabled -}}
  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $ -}}

  {{/* Validate all routes first, the TLS plan looks at all of them */}}
  {{- range $name, $route := .Values.route }}
    {{- $enabled := include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $route "name" $name "key" "route" "caller" "Route") -}}

    {{- if and (ne $enabled "true") (kindIs "map" $route) $route.required (not $hasIngressEnabled) -}}
      {{- fail (printf "Route - Expected route [%s] to be enabled or at least one ingress to be enabled. This chart is designed to work only with ingress or route enabled." $name) -}}
    {{- end -}}

    {{- if eq $enabled "true" -}}
      {{- $fullName := include "tc.v1.common.lib.route.getFullName" (dict "rootCtx" $ "objectData" $route "name" $name) -}}
      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $fullName "length" 253) -}}
      {{- include "tc.v1.common.lib.route.validation" (dict "rootCtx" $ "objectData" $route "routeKind" ($route.kind | default "HTTPRoute") "name" $name) -}}

      {{- if (include "tc.v1.common.lib.route.listeners" (dict "rootCtx" $ "objectData" $route "fullName" $fullname) | fromYaml).listeners -}}
        {{- $gatewayRef := include "tc.v1.common.lib.route.gatewayRef" (dict "rootCtx" $ "objectData" $route "fullName" $fullName) | fromYaml -}}
        {{- include "tc.v1.common.lib.route.listenerValidation" (dict "rootCtx" $ "objectData" $route "gatewayRef" $gatewayRef "name" $name) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- $plan := include "tc.v1.common.lib.route.tlsPlan" (dict "rootCtx" $) | fromYaml -}}
  {{- $stopped := include "tc.v1.common.lib.util.stopAll" $ -}}

  {{- /* Generate named routes as required */ -}}
  {{- range $name, $route := .Values.route }}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $route "name" $name "key" "route" "caller" "Route")) "true" -}}
      {{- continue -}}
    {{- end -}}

    {{- $routeValues := $route -}}
    {{- $routeKind := $routeValues.kind | default "HTTPRoute" -}}
    {{- $fullName := include "tc.v1.common.lib.route.getFullName" (dict "rootCtx" $ "objectData" $routeValues "name" $name) -}}
    {{- $integrations := $routeValues.integrations | default dict -}}
    {{- $traefik := $integrations.traefik | default dict -}}
    {{- $envoy := $integrations.envoy | default dict -}}

    {{- if and $traefik.enabled $envoy.enabled -}}
      {{- fail (printf "Route - Expected only one of [integrations.traefik, integrations.envoy] on [route.%s], a route has one gateway provider" $name) -}}
    {{- end -}}
    {{- if and (or $traefik.enabled $envoy.enabled) (not (mustHas $routeKind (list "HTTPRoute" "GRPCRoute"))) -}}
      {{- fail (printf "Route - [route.%s.integrations.traefik] and [route.%s.integrations.envoy] are only supported by kinds [HTTPRoute, GRPCRoute], but got [%s]" $name $name $routeKind) -}}
    {{- end -}}

    {{- $routeFilters := list -}}
    {{- $extraRules := list -}}
    {{- $middlewares := list -}}
    {{- $policies := dict -}}
    {{- if $traefik.enabled -}}
      {{- $data := include "tc.v1.common.lib.route.integration.traefik" (dict "rootCtx" $ "objectData" $routeValues "fullName" $fullName "routeKind" $routeKind "name" $name) | fromYaml -}}
      {{- $routeFilters = $data.filters | default list -}}
      {{- $middlewares = $data.middlewares | default list -}}
      {{- $extraRules = $data.extraRules | default list -}}
    {{- else if $envoy.enabled -}}
      {{- $data := include "tc.v1.common.lib.route.integration.envoy" (dict "rootCtx" $ "objectData" $routeValues "routeKind" $routeKind "name" $name) | fromYaml -}}
      {{- $extraRules = $data.extraRules | default list -}}
      {{- $policies = dict "SecurityPolicy" $data.securityPolicy "EnvoyExtensionPolicy" $data.extensionPolicy "BackendTrafficPolicy" $data.backendTrafficPolicy -}}
    {{- end -}}

    {{/* When Stop All is set, take the route away from the gateway. Certificates stay, same as an ingress */}}
    {{- if not $stopped -}}
      {{- $_ := set $ "ObjectValues" (dict "route" $routeValues "routeFullName" $fullName
            "listenerSetNames" (get $plan.routeParents $name) "routeFilters" $routeFilters "extraRules" $extraRules) -}}
      {{- include "tc.v1.common.class.route" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "route" -}}

      {{- range $middleware := $middlewares -}}
        {{- $objectData := mustMerge (dict "namespace" $routeValues.namespace "labels" (mustDeepCopy ($routeValues.labels | default dict)) "shortName" $name) $middleware -}}
        {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $objectData.name "length" 253) -}}
        {{- include "tc.v1.common.class.traefik.middleware" (dict "rootCtx" $ "objectData" $objectData) | nindent 0 -}}
      {{- end -}}

      {{- range $kind, $spec := $policies -}}
        {{- if $spec -}}
          {{- include "tc.v1.common.class.envoy.policy" (dict "rootCtx" $ "objectData" (dict
                "name" $fullName "kind" $kind "namespace" $routeValues.namespace "shortName" $name
                "labels" (mustDeepCopy ($routeValues.labels | default dict)) "targetKind" $routeKind "spec" $spec)) | nindent 0 -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end }}

  {{- if not $stopped -}}
    {{- range $key, $set := $plan.listenerSets -}}
      {{- $annotations := dict -}}
      {{- with $set.issuer -}}
        {{- $_ := set $annotations "cert-manager.io/cluster-issuer" . -}}
        {{- $_ := set $annotations "cert-manager.io/private-key-rotation-policy" "Always" -}}
      {{- end -}}
      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $set.name "length" 253) -}}
      {{- include "tc.v1.common.class.listenerset" (dict "rootCtx" $ "objectData" (dict
            "name" $set.name "namespace" $set.namespace "shortName" $set.name
            "labels" $set.labels "annotations" $annotations
            "gatewayRef" $set.gatewayRef "port" $set.port "listeners" $set.listeners)) | nindent 0 -}}
    {{- end -}}
  {{- end -}}

  {{- range $certName, $certObjData := $plan.certificates -}}
    {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $certName) -}}
    {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $certObjData "caller" "Route (certificateIssuer)") -}}
    {{- include "tc.v1.common.lib.certificate.validation" (dict "rootCtx" $ "objectData" $certObjData) -}}

    {{/* Create the certificate with the certData */}}
    {{- include "tc.v1.common.class.certificate" (dict "rootCtx" $ "objectData" $certObjData) -}}
  {{- end -}}
{{- end }}
