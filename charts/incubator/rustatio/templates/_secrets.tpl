{{/* Define the secrets */}}
{{- define "rustatio.secrets" -}}
enabled: true
data:
  AUTH_TOKEN: {{ .Values.rustatio.authToken | quote }}
{{- end -}}
