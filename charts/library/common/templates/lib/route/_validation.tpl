{{- define "tc.v1.common.lib.route.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $routeKind := .routeKind -}}
  {{- $name := .name -}}

  {{- if $objectData.targetSelector -}}
    {{- if kindIs "map" $objectData.targetSelector -}}
      {{- $selectors := $objectData.targetSelector | keys | len -}}
      {{- if (gt $selectors 1) -}}
        {{- fail (printf "Route - Expected [route.%s.targetSelector] to have exactly one key, but got [%d]" $name $selectors) -}}
      {{- end -}}
      {{- range $k, $v := $objectData.targetSelector -}}
        {{- if not (and $v (kindIs "string" $v)) -}}
          {{- fail (printf "Route - Expected [route.%s.targetSelector.%s] to be a non-empty [string]" $name $k) -}}
        {{- end -}}
      {{- end -}}
    {{- else if not (kindIs "string" $objectData.targetSelector) -}}
      {{- fail (printf "Route - Expected [route.%s.targetSelector] to be a [string] or a [map], but got [%s]" $name (kindOf $objectData.targetSelector)) -}}
    {{- else if $objectData.gateway -}}
      {{- fail (printf "Route - Expected only one of [gateway, targetSelector] to select the gateway of [route.%s]. Use the map form of [targetSelector] to select a service" $name) -}}
    {{- end -}}
  {{- end -}}

  {{- range $host := $objectData.hostnames -}}
    {{- $tplHost := tpl $host $rootCtx -}}
    {{- if or (hasPrefix "http://" $tplHost) (hasPrefix "https://" $tplHost) (contains ":" $tplHost) -}}
      {{- fail (printf "Route - Expected [route.%s.hostnames] to only contain hostnames, without a scheme or port, but got [%s]" $name $tplHost) -}}
    {{- end -}}
  {{- end -}}

  {{/* The others depend on the gateway provider. Dropping them could expose what they protect */}}
  {{- $validIntegrations := (list "certManager" "envoy" "homepage" "traefik") -}}
  {{- range $key := (keys ($objectData.integrations | default dict) | sortAlpha) -}}
    {{- if not (mustHas $key $validIntegrations) -}}
      {{- fail (printf "Route - [route.%s.integrations.%s] is not supported, only [%s] are" $name $key (join ", " $validIntegrations)) -}}
    {{- end -}}
  {{- end -}}

  {{- $integrations := $objectData.integrations | default dict -}}
  {{- if and $integrations.homepage $integrations.homepage.enabled -}}
    {{/* Homepage only discovers HTTPRoutes */}}
    {{- if ne $routeKind "HTTPRoute" -}}
      {{- fail (printf "Route - [route.%s.integrations.homepage] is only supported by kind [HTTPRoute], but got [%s]" $name $routeKind) -}}
    {{- end -}}
    {{- if and (not $objectData.hostnames) (not $integrations.homepage.href) -}}
      {{- fail (printf "Route - Expected non-empty [route.%s.hostnames] or [integrations.homepage.href] with [integrations.homepage]" $name) -}}
    {{- end -}}
  {{- end -}}

  {{- if include "tc.v1.common.lib.route.hasCertManager" (dict "objectData" $objectData) -}}
    {{- $issuer := $objectData.integrations.certManager.certificateIssuer -}}
    {{- if not $issuer -}}
      {{- fail "Route - Expected a non-empty [integrations.certManager.certificateIssuer]" -}}
    {{- end -}}
    {{- if not (kindIs "string" $issuer) -}}
      {{- fail (printf "Route - Expected [integrations.certManager.certificateIssuer] to be a [string], but got [%s]" (kindOf $issuer)) -}}
    {{- end -}}
    {{- if not $objectData.hostnames -}}
      {{- fail (printf "Route - Expected non-empty [route.%s.hostnames] with [integrations.certManager]" $name) -}}
    {{- end -}}
  {{- end -}}

  {{- range $t := $objectData.tls -}}
    {{- if not $t.hosts -}}
      {{- fail "Route - Expected non-empty [tls.hosts]" -}}
    {{- end -}}
    {{- if not (kindIs "slice" $t.hosts) -}}
      {{- fail (printf "Route - Expected [tls.hosts] to be a [slice], but got [%s]" (kindOf $t.hosts)) -}}
    {{- end -}}

    {{- $certOptions := (list "secretName" "certificateIssuer" "clusterCertificate") -}}
    {{- $optsSet := list -}}
    {{- range $opt := $certOptions -}}
      {{- if (get $t $opt) -}}
        {{- $optsSet = mustAppend $optsSet $opt -}}
      {{- end -}}
    {{- end -}}
    {{- if ne ($optsSet | len) 1 -}}
      {{- fail (printf "Route - Expected exactly one of [%s] to be set in [tls], but got [%s]" (join ", " $certOptions) (join ", " $optsSet)) -}}
    {{- end -}}
  {{- end -}}

  {{- $validKinds := (list "GRPCRoute" "HTTPRoute" "TCPRoute" "TLSRoute" "UDPRoute") -}}
  {{- if not (mustHas $routeKind $validKinds) -}}
    {{- fail (printf "Not a valid route kind (%s)" $routeKind) -}}
  {{- end -}}

  {{- if $objectData.hostnames -}}
    {{- if mustHas $routeKind (list "TCPRoute" "UDPRoute") -}}
      {{- fail (printf "Route - [route.%s.hostnames] is not supported by kind [%s]" $name $routeKind) -}}
    {{- end -}}
  {{- else if eq $routeKind "TLSRoute" -}}
    {{- fail (printf "Route - Expected non-empty [route.%s.hostnames] on kind [TLSRoute]" $name) -}}
  {{- end -}}

  {{/* A field the kind does not have must fail, as dropping it changes what the route matches */}}
  {{- $ruleFields := (list "backendRefs" "name") -}}
  {{- if eq $routeKind "HTTPRoute" -}}
    {{- $ruleFields = concat $ruleFields (list "matches" "filters" "timeouts" "retry" "sessionPersistence") -}}
  {{- else if eq $routeKind "GRPCRoute" -}}
    {{- $ruleFields = concat $ruleFields (list "matches" "filters" "sessionPersistence") -}}
  {{- end -}}

  {{- $backendFields := (list "targetSelector" "group" "kind" "name" "namespace" "port" "weight") -}}
  {{- if mustHas $routeKind (list "HTTPRoute" "GRPCRoute") -}}
    {{- $backendFields = mustAppend $backendFields "filters" -}}
  {{- end -}}

  {{- range $idx, $rule := $objectData.rules -}}
    {{- range $key := (keys $rule | sortAlpha) -}}
      {{- if not (mustHas $key $ruleFields) -}}
        {{- fail (printf "Route - [route.%s.rules.%d.%s] is not supported by kind [%s]" $name $idx $key $routeKind) -}}
      {{- end -}}
    {{- end -}}

    {{- if and (not $rule.backendRefs) (mustHas $routeKind (list "TCPRoute" "TLSRoute" "UDPRoute")) (hasKey $rule "backendRefs") -}}
      {{- fail (printf "Route - Expected non-empty [route.%s.rules.%d.backendRefs] on kind [%s]" $name $idx $routeKind) -}}
    {{- end -}}

    {{- range $backendIdx, $backend := $rule.backendRefs -}}
      {{- range $key := (keys $backend | sortAlpha) -}}
        {{- if not (mustHas $key $backendFields) -}}
          {{- fail (printf "Route - [route.%s.rules.%d.backendRefs.%d.%s] is not supported by kind [%s]" $name $idx $backendIdx $key $routeKind) -}}
        {{- end -}}
      {{- end -}}

      {{- if and $backend.targetSelector $backend.name -}}
        {{- fail (printf "Route - Expected only one of [targetSelector, name] in [route.%s.rules.%d.backendRefs.%d]" $name $idx $backendIdx) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Validates what is needed to put the TLS of a route on a ListenerSet */}}
{{- define "tc.v1.common.lib.route.listenerValidation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $gatewayRef := .gatewayRef -}}
  {{- $name := .name -}}

  {{- $routeKind := $objectData.kind | default "HTTPRoute" -}}
  {{- if not (mustHas $routeKind (list "HTTPRoute" "GRPCRoute")) -}}
    {{- fail (printf "Route - [route.%s] uses TLS through a ListenerSet, which is only supported by kinds [HTTPRoute, GRPCRoute], but got [%s]" $name $routeKind) -}}
  {{- end -}}

  {{- if not $gatewayRef.name -}}
    {{- fail (printf "Route - Expected [gateway] or a [targetSelector] string on [route.%s], as TLS needs a gateway to attach a ListenerSet to" $name) -}}
  {{- end -}}

  {{- $api := "gateway.networking.k8s.io/v1/ListenerSet" -}}
  {{- if not ($rootCtx.Capabilities.APIVersions.Has $api) -}}
    {{- fail (printf "Route - [route.%s] uses TLS, but API [%s] was not found. Install Gateway API v1.5 or newer. When rendering without access to a cluster, pass it with [--api-versions]" $name $api) -}}
  {{- end -}}

  {{/* A gateway accepts no ListenerSets by default. Only the ones in this chart can be checked */}}
  {{- with $gatewayRef.selector -}}
    {{- $from := "None" -}}
    {{- $allowed := (get $rootCtx.Values.gateway .).allowedListeners -}}
    {{- if and $allowed $allowed.namespaces $allowed.namespaces.from -}}
      {{- $from = $allowed.namespaces.from -}}
    {{- end -}}
    {{- if eq $from "None" -}}
      {{- fail (printf "Route - Expected [gateway.%s.allowedListeners.namespaces.from] to allow ListenerSets, as [route.%s] uses TLS" . $name) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Returns the name and port of a backendRef, resolving services of this chart */}}
{{- define "tc.v1.common.lib.route.backend" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $backend := .backend -}}
  {{- $routeName := .routeName -}}

  {{- $kind := $backend.kind | default "Service" -}}
  {{- $name := $backend.name -}}
  {{- $port := $backend.port -}}

  {{/* A selector is a service name, or a map of service name to port name */}}
  {{- $selector := $backend.targetSelector -}}
  {{- if and (not $selector) (not $name) -}}
    {{- $selector = .defaultSelector -}}
  {{- end -}}
  {{- $svcName := "" -}}
  {{- $portName := "" -}}
  {{- if kindIs "map" $selector -}}
    {{- $svcName = $selector | keys | mustFirst -}}
    {{- $portName = get $selector $svcName -}}
  {{- else if $selector -}}
    {{- $svcName = $selector -}}
  {{- end -}}

  {{/* Without a name, the backend is a service of this chart. Defaults to the primary service */}}
  {{- $primarySvc := include "tc.v1.common.lib.util.service.primary" (dict "rootCtx" $rootCtx) -}}
  {{- if and (not $name) (not $svcName) -}}
    {{- $svcName = $primarySvc -}}
    {{- if not $svcName -}}
      {{- fail (printf "Route - Expected [name] or [targetSelector] in a backendRef of route [%s], as there is no primary service" $routeName) -}}
    {{- end -}}
  {{- end -}}

  {{- if $svcName -}}
    {{- $service := get $rootCtx.Values.service $svcName -}}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $service "name" $svcName "key" "service" "caller" "Route")) "true" -}}
      {{- fail (printf "Route - Expected [targetSelector] in a backendRef of route [%s] to reference an enabled service, got [%s]" $routeName $svcName) -}}
    {{- end -}}

    {{/* Same naming as the service spawner */}}
    {{- $name = $svcName -}}
    {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                    "rootCtx" $rootCtx "objectData" $service
                    "name" $svcName "caller" "Route"
                    "key" "service")) -}}
    {{- if eq $expandName "true" -}}
      {{- $name = include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}
      {{- if not $service.primary -}}
        {{- $name = printf "%s-%s" $name $svcName -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- $protocol := "http" -}}
  {{- with (get $rootCtx.Values.service ($svcName | default $primarySvc)) -}}
    {{- if or (not $port) $svcName -}}
      {{- $selectedPort := $portName -}}
      {{- if $portName -}}
        {{- $portData := get .ports $portName -}}
        {{- if not $portData -}}
          {{- fail (printf "Route - Expected targeted service [%s] of route [%s] to have port [%s]" $svcName $routeName $portName) -}}
        {{- end -}}
        {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $portData "name" $portName "key" "service" "caller" "Route")) "true" -}}
          {{- fail (printf "Route - Expected targeted service port [%s] of route [%s] to be enabled" $portName $routeName) -}}
        {{- end -}}
      {{- else -}}
        {{- $selectedPort = include "tc.v1.common.lib.util.service.ports.primary" (dict "svcValues" . "rootCtx" $rootCtx) -}}
      {{- end -}}
      {{- if and $selectedPort (hasKey .ports $selectedPort) -}}
        {{- $portData := get .ports $selectedPort -}}
        {{- if not $port -}}
          {{- $port = $portData.port -}}
        {{- end -}}
        {{- if eq $portData.protocol "https" -}}
          {{- $protocol = "https" -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if and (not $port) (eq $kind "Service") -}}
    {{- fail (printf "Route - Expected [port] in backendRef [%s] of route [%s]" $name $routeName) -}}
  {{- end -}}

  {{- dict "name" $name "port" (tpl (toString $port) $rootCtx | int) "protocol" $protocol | toYaml -}}
{{- end -}}
