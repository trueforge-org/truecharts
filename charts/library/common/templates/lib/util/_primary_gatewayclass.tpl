{{/* Return the name of the primary gatewayClass object */}}
{{- define "tc.v1.common.lib.util.gatewayclass.primary" -}}
  {{- $rootCtx := . -}}
  {{- if hasKey . "rootCtx" -}}
    {{- $rootCtx = .rootCtx -}}
  {{- end -}}

  {{- $enabledClasses := list -}}
  {{- $result := "" -}}
  {{- range $name, $gatewayClass := ($rootCtx.Values.gatewayClass | default dict) -}}
    {{- if eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $gatewayClass "name" $name "key" "gatewayClass" "caller" "GatewayClass")) "true" -}}
      {{/* GatewayClasses of dependencies are only the primary of the release when they are explicitly set to primary, never by fallback */}}
      {{- if not $gatewayClass.dependency -}}
        {{- $enabledClasses = mustAppend $enabledClasses $name -}}
      {{- end -}}
      {{- if $gatewayClass.primary -}}
        {{- $result = $name -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = $enabledClasses | sortAlpha | first -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}

{{/* Generate the full name of a gatewayClass, regardless of the order objects are rendered in
Usage: include "tc.v1.common.lib.util.gatewayclass.getFullName" (dict "rootCtx" $ "name" $name)
*/}}
{{- define "tc.v1.common.lib.util.gatewayclass.getFullName" -}}
  {{- $fullName := include "tc.v1.common.lib.chart.names.fullname" .rootCtx -}}
  {{- $gatewayClass := get .rootCtx.Values.gatewayClass .name -}}
  {{- if $gatewayClass.nameOverride -}}
    {{- $fullName = printf "%v-%v" $fullName $gatewayClass.nameOverride -}}
  {{- else if ne .name (include "tc.v1.common.lib.util.gatewayclass.primary" (dict "rootCtx" .rootCtx)) -}}
    {{- $fullName = printf "%v-%v" $fullName .name -}}
  {{- end -}}
  {{- $fullName -}}
{{- end -}}
