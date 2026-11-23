{{/* Define the secrets */}}
{{- define "speedtest-tracker.secrets" -}}
{{- $key := required "speedtestTracker.appKey must be set" .Values.speedtestTracker.appKey }}
enabled: true
data:
  APP_KEY: {{ $key | quote }}
{{- end -}}
