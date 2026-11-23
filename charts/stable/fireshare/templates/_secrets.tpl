{{/* Define the secrets */}}
{{- define "fireshare.secrets" -}}
enabled: true
data:
  SECRET_KEY: {{ required "fireshare.secretKey must be set" .Values.fireshare.secretKey }}
{{- end -}}
