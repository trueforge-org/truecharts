{{/* Define the secrets */}}
{{- define "ferdi-server.secrets" -}}
enabled: true
data:
  APP_KEY: {{ required "ferdiServer.appKey must be set" .Values.ferdiServer.appKey }}
{{- end -}}
