{{/* Define the secrets */}}
{{- define "fireflyiii.secrets" -}}
enabled: true
data:
  STATIC_CRON_TOKEN: {{ required "fireflyiii.cronToken must be set" .Values.fireflyiii.cronToken }}
  APP_KEY: {{ required "fireflyiii.appKey must be set" .Values.fireflyiii.appKey }}
{{- end -}}
