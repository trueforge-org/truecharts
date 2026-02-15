{{/*
Return the primary gatewayClass object name
*/}}
{{- define "tc.v1.common.lib.util.gatewayclass.primary" -}}
  {{- $result := "" -}}
  {{- range $name, $gatewayClass := .Values.gatewayClass -}}
    {{- if and (hasKey $gatewayClass "primary") $gatewayClass.primary -}}
      {{- $result = $name -}}
    {{- end -}}
  {{- end -}}

  {{- if not $result -}}
    {{- $result = "main" -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}
