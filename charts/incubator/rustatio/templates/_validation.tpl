{{/* Validation */}}
{{- define "rustatio.validation" -}}
  {{- if or (not .Values.rustatio.authToken) (eq .Values.rustatio.authToken "CHANGE_ME") -}}
    {{- fail "Rustatio requires auth token. Set rustatio.authToken to a unique value." -}}
  {{- end -}}

  {{- if not .Values.persistence.data.enabled -}}
    {{- fail "Rustatio requires persistence.data.enabled" -}}
  {{- end -}}
{{- end -}}
