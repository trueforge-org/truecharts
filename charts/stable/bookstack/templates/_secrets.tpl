{{/* Define the secrets */}}
{{- define "bookstack.secrets" -}}
enabled: true
data:
  APP_KEY: {{ required "bookstack.appKey must be set" .Values.bookstack.appKey }}
{{- end -}}
