{{/* Define the secrets */}}
{{- define "baserow.secrets" -}}
enabled: true
data:
  SECRET_KEY: {{ required "baserow.secretKey must be set" .Values.baserow.secretKey }}
{{- end -}}
