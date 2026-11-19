{{/* Define the secrets */}}
{{- define "paperlessng.secrets" -}}
enabled: true
data:
  PAPERLESS_SECRET_KEY: {{ required "paperless.secretKey must be set" .Values.paperless.secretKey | quote }}
{{- end -}}
