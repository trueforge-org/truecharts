{{/* EteSync superuser credentials and Django SECRET_KEY */}}
{{- define "etesync.secret" -}}
enabled: true
data:
  secret.txt: {{ required "etesync.secretKey must be set" .Values.etesync.secretKey }}
{{- end -}}
