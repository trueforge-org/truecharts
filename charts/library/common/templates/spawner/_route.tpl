{{/* Renders the Route objects required by the chart */}}
{{- define "tc.v1.common.spawner.routes" -}}
  {{- include "tc.v1.common.lib.gateway.primaryValidation" (dict "rootCtx" $ "key" "route" "caller" "Route") -}}

  {{- /* Generate named routes as required */ -}}
  {{- range $name, $route := .Values.route }}
    {{- if eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $route "name" $name "key" "route" "caller" "Route")) "true" -}}
      {{- $routeValues := $route -}}

      {{/* set defaults */}}
      {{- if and (not $routeValues.nameOverride) (ne $name (include "tc.v1.common.lib.util.route.primary" $)) -}}
        {{- $_ := set $routeValues "nameOverride" $name -}}
      {{- end -}}

      {{- include "tc.v1.common.lib.route.validation" (dict "objectData" $routeValues "routeKind" ($routeValues.kind | default "HTTPRoute") "name" $name) -}}

      {{- $_ := set $ "ObjectValues" (dict "route" $routeValues) -}}
      {{- include "tc.v1.common.class.route" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "route" -}}
    {{- end }}
  {{- end }}
{{- end }}
