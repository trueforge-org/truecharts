{{/* Define the secrets */}}
{{- define "servas.secrets" -}}
enabled: true
data:
  APP_KEY: {{ required "servas.appKey must be set" .Values.servas.appKey | quote }}
{{- end -}}
