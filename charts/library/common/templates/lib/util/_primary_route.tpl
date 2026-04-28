{{/* Return the name of the primary route object */}}
{{- define "tc.v1.common.lib.util.route.primary" -}}
  {{- $rootCtx := . -}}
  {{- if hasKey . "rootCtx" -}}
    {{- $rootCtx = .rootCtx -}}
  {{- end -}}
  {{- $routees := $rootCtx.Values.route | default dict -}}

  {{- $enabledroutees := dict -}}
  {{- range $name, $route := $routees -}}
    {{- if and (kindIs "map" $route) $route.enabled -}}
      {{- $_ := set $enabledroutees $name . -}}
    {{- end -}}
  {{- end -}}

  {{- $result := "" -}}
  {{- range $name, $route := $enabledroutees -}}
    {{- if and (hasKey $route "primary") $route.primary -}}
      {{- $result = $name -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = keys $enabledroutees | first -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}
