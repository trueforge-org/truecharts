{{/*
Return the primary gatewayClass object name
*/}}
{{- define "tc.v1.common.lib.util.gatewayclass.primary" -}}
  {{- $result := "" -}}
  {{- range $name, $gatewayClass := .Values.gatewayClass -}}
    {{- if kindIs "map" $gatewayClass -}}
      {{- if and (hasKey $gatewayClass "primary") $gatewayClass.primary -}}
        {{- $result = $name -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = "main" -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}

{{/*
Generate the full name for a gatewayClass object
Usage: include "tc.v1.common.lib.util.gatewayclass.getFullName" (dict "rootCtx" $ "gatewayClass" $gatewayClassValues)
*/}}
{{- define "tc.v1.common.lib.util.gatewayclass.getFullName" -}}
  {{- $fullName := include "tc.v1.common.lib.chart.names.fullname" .rootCtx -}}
  {{- if and (hasKey .gatewayClass "nameOverride") .gatewayClass.nameOverride -}}
    {{- $fullName = printf "%v-%v" $fullName .gatewayClass.nameOverride -}}
  {{- end -}}
  {{- $fullName -}}
{{- end -}}
