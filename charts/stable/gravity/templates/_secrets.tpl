{{/* Define the secrets */}}
{{- define "gravity.secret" -}}
gravity-secret:
  enabled: true
  data:
    ADMIN_TOKEN: {{ required "gravity.adminToken must be set" .Values.gravity.adminToken }}
{{- end -}}
