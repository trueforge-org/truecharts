{{/* Define the secrets */}}
{{- define "ctfd.secrets" -}}
enabled: true
data:
  SECRET_KEY: {{ required "ctfd.secretKey must be set" .Values.ctfd.secretKey }}
{{- end -}}
