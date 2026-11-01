{{/* Return the name of the primary gateway object */}}
{{- define "tc.v1.common.lib.util.gateway.primary" -}}
  {{- $rootCtx := . -}}
  {{- if hasKey . "rootCtx" -}}
    {{- $rootCtx = .rootCtx -}}
  {{- end -}}

  {{- $enabledgateways := list -}}
  {{- $result := "" -}}
  {{- range $name, $gateway := ($rootCtx.Values.gateway | default dict) -}}
    {{- if eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $gateway "name" $name "key" "gateway" "caller" "Gateway")) "true" -}}
      {{/* Gateways of dependencies are never the primary of the release */}}
      {{- if not $gateway.dependency -}}
        {{- $enabledgateways = mustAppend $enabledgateways $name -}}
      {{- end -}}
      {{- if $gateway.primary -}}
        {{- $result = $name -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = $enabledgateways | sortAlpha | first -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}

{{/* Generate the full name of a gateway, regardless of the order objects are rendered in
Usage: include "tc.v1.common.lib.util.gateway.getFullName" (dict "rootCtx" $ "name" $name)
*/}}
{{- define "tc.v1.common.lib.util.gateway.getFullName" -}}
  {{- $fullName := include "tc.v1.common.lib.chart.names.fullname" .rootCtx -}}
  {{- $gateway := get .rootCtx.Values.gateway .name -}}
  {{- if $gateway.nameOverride -}}
    {{- $fullName = printf "%v-%v" $fullName $gateway.nameOverride -}}
  {{- else if ne .name (include "tc.v1.common.lib.util.gateway.primary" (dict "rootCtx" .rootCtx)) -}}
    {{- $fullName = printf "%v-%v" $fullName .name -}}
  {{- end -}}
  {{- $fullName -}}
{{- end -}}
