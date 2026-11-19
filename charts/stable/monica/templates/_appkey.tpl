{{/* Renders the appkey secret from values */}}
{{- define "monica.appkey" -}}
enabled: true
data:
  appkey: {{ required "monica.appKey must be set" .Values.monica.appKey }}
{{- end -}}
