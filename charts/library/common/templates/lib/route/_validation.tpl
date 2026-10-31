{{- define "tc.v1.common.lib.route.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $routeKind := .routeKind -}}
  {{- $name := .name -}}

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

{{/* Returns the name and port of a backendRef, resolving services of this chart */}}
{{- define "tc.v1.common.lib.route.backend" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $backend := .backend -}}
  {{- $routeName := .routeName -}}

  {{- $kind := $backend.kind | default "Service" -}}
  {{- $selector := $backend.targetSelector -}}
  {{- $name := $backend.name -}}
  {{- $port := $backend.port -}}

  {{/* Without a name, the backend is a service of this chart. Defaults to the primary service */}}
  {{- if and (not $name) (not $selector) -}}
    {{- $selector = include "tc.v1.common.lib.util.service.primary" (dict "rootCtx" $rootCtx) -}}
    {{- if not $selector -}}
      {{- fail (printf "Route - Expected [name] or [targetSelector] in a backendRef of route [%s], as there is no primary service" $routeName) -}}
    {{- end -}}
  {{- end -}}

  {{- if $selector -}}
    {{- $service := get $rootCtx.Values.service $selector -}}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $service "name" $selector "key" "service" "caller" "Route")) "true" -}}
      {{- fail (printf "Route - Expected [targetSelector] in a backendRef of route [%s] to reference an enabled service, got [%s]" $routeName $selector) -}}
    {{- end -}}

    {{/* Same naming as the service spawner */}}
    {{- $name = $selector -}}
    {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                    "rootCtx" $rootCtx "objectData" $service
                    "name" $selector "caller" "Route"
                    "key" "service")) -}}
    {{- if eq $expandName "true" -}}
      {{- $name = include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}
      {{- if not $service.primary -}}
        {{- $name = printf "%s-%s" $name $selector -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if not $port -}}
    {{- $portService := $backend.targetSelector | default (include "tc.v1.common.lib.util.service.primary" (dict "rootCtx" $rootCtx)) -}}
    {{- with (get $rootCtx.Values.service $portService) -}}
      {{- $portName := include "tc.v1.common.lib.util.service.ports.primary" (dict "svcValues" . "rootCtx" $rootCtx) -}}
      {{- if and $portName (hasKey .ports $portName) -}}
        {{- $port = (get .ports $portName).port -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if and (not $port) (eq $kind "Service") -}}
    {{- fail (printf "Route - Expected [port] in backendRef [%s] of route [%s]" $name $routeName) -}}
  {{- end -}}

  {{- dict "name" $name "port" (tpl (toString $port) $rootCtx | int) | toYaml -}}
{{- end -}}
