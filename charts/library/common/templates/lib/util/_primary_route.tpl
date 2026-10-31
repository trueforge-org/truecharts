{{/* Return the name of the primary route object */}}
{{- define "tc.v1.common.lib.util.route.primary" -}}
  {{- $rootCtx := . -}}
  {{- if hasKey . "rootCtx" -}}
    {{- $rootCtx = .rootCtx -}}
  {{- end -}}
  {{- $enabledroutees := list -}}
  {{- $result := "" -}}
  {{- range $name, $route := ($rootCtx.Values.route | default dict) -}}
    {{- if eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $route "name" $name "key" "route" "caller" "Route")) "true" -}}
      {{- $enabledroutees = mustAppend $enabledroutees $name -}}
      {{- if $route.primary -}}
        {{- $result = $name -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = $enabledroutees | sortAlpha | first -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}
