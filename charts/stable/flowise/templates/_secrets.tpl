{{/* Define the secrets */}}
{{- define "flowise.secrets" -}}
enabled: true
data:
  FLOWISE_SECRETKEY_OVERWRITE: {{ required "flowise.secretKey must be set" .Values.flowise.secretKey }}
{{- end -}}
