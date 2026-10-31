{{/* Renders the Route objects required by the chart */}}
{{- define "tc.v1.common.spawner.routes" -}}
  {{- include "tc.v1.common.lib.gateway.primaryValidation" (dict "rootCtx" $ "key" "route" "caller" "Route") -}}
  {{- $hasIngressEnabled := (include "tc.v1.common.lib.ingress.hasPrimary" $ | fromJson).hasEnabled -}}

  {{- /* Generate named routes as required */ -}}
  {{- range $name, $route := .Values.route }}
    {{- $enabled := include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $route "name" $name "key" "route" "caller" "Route") -}}

    {{- if and (ne $enabled "true") (kindIs "map" $route) $route.required (not $hasIngressEnabled) -}}
      {{- fail (printf "Route - Expected route [%s] to be enabled or at least one ingress to be enabled. This chart is designed to work only with ingress or route enabled." $name) -}}
    {{- end -}}

    {{- if eq $enabled "true" -}}
      {{- $routeValues := $route -}}
      {{- $fullName := include "tc.v1.common.lib.route.getFullName" (dict "rootCtx" $ "objectData" $routeValues "name" $name) -}}

      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $fullName "length" 253) -}}
      {{- include "tc.v1.common.lib.route.validation" (dict "rootCtx" $ "objectData" $routeValues "routeKind" ($routeValues.kind | default "HTTPRoute") "name" $name) -}}

      {{- $listeners := (include "tc.v1.common.lib.route.listeners" (dict "rootCtx" $ "objectData" $routeValues "fullName" $fullName) | fromYaml).listeners -}}
      {{- $gatewayRef := dict -}}
      {{- if $listeners -}}
        {{- $gatewayRef = include "tc.v1.common.lib.route.gatewayRef" (dict "rootCtx" $ "objectData" $routeValues "fullName" $fullName) | fromYaml -}}
        {{- include "tc.v1.common.lib.route.listenerValidation" (dict "rootCtx" $ "objectData" $routeValues "gatewayRef" $gatewayRef "name" $name) -}}
      {{- end -}}

      {{/* When Stop All is set, take the route away from the gateway. Certificates stay, same as an ingress */}}
      {{- if not (include "tc.v1.common.lib.util.stopAll" $) -}}
        {{- $_ := set $ "ObjectValues" (dict "route" $routeValues "routeFullName" $fullName "hasListeners" (not (empty $listeners))) -}}
        {{- include "tc.v1.common.class.route" $ | nindent 0 -}}
        {{- $_ := unset $.ObjectValues "route" -}}

        {{- if $listeners -}}
          {{- $annotations := dict -}}
          {{- if include "tc.v1.common.lib.route.hasCertManager" (dict "objectData" $routeValues) -}}
            {{- $_ := set $annotations "cert-manager.io/cluster-issuer" $routeValues.integrations.certManager.certificateIssuer -}}
            {{- $_ := set $annotations "cert-manager.io/private-key-rotation-policy" "Always" -}}
          {{- end -}}
          {{- include "tc.v1.common.class.listenerset" (dict "rootCtx" $ "objectData" (dict
                "name" $fullName "namespace" $routeValues.namespace "shortName" $name
                "labels" (mustDeepCopy ($routeValues.labels | default dict)) "annotations" $annotations
                "gatewayRef" $gatewayRef "port" ($routeValues.listenerPort | default $.Values.global.fallbackDefaults.routeListenerPort) "listeners" $listeners)) | nindent 0 -}}
        {{- end -}}
      {{- end -}}

      {{- if not (include "tc.v1.common.lib.route.hasCertManager" (dict "objectData" $routeValues)) -}}
        {{- range $idx, $tlsData := $routeValues.tls -}}
          {{- if $tlsData.certificateIssuer -}}
            {{- $certName := printf "%s-tls-%d" $fullName ($idx | int) -}}

            {{- $certObjData := (dict
                "name" $certName "shortName" $name
                "hosts" $tlsData.hosts
                "certificateIssuer" $tlsData.certificateIssuer
            ) -}}

            {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $certName) -}}
            {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $certObjData "caller" "Route (certificateIssuer)") -}}
            {{- include "tc.v1.common.lib.certificate.validation" (dict "rootCtx" $ "objectData" $certObjData) -}}

            {{/* Create the certificate with the certData */}}
            {{- include "tc.v1.common.class.certificate" (dict "rootCtx" $ "objectData" $certObjData) -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end }}
  {{- end }}
{{- end }}
