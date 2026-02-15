{{/* Return the name of the primary gateway object */}}
{{- define "tc.v1.common.lib.util.gateway.primary" -}}
  {{- $rootCtx := . -}}
  {{- if hasKey . "rootCtx" -}}
    {{- $rootCtx = .rootCtx -}}
  {{- end -}}
  {{- $gateways := $rootCtx.Values.gateway | default dict -}}

  {{- $enabledgateways := dict -}}
  {{- range $name, $gateway := $gateways -}}
    {{- if and (kindIs "map" $gateway) $gateway.enabled -}}
      {{- $_ := set $enabledgateways $name . -}}
    {{- end -}}
  {{- end -}}

  {{- $result := "" -}}
  {{- range $name, $gateway := $enabledgateways -}}
    {{- if and (hasKey $gateway "primary") $gateway.primary -}}
      {{- $result = $name -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = keys $enabledgateways | first -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}
