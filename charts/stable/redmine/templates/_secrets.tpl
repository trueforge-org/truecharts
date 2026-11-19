{{/* Define the secrets */}}
{{- define "redmine.secrets" -}}
enabled: true
data:
  REDMINE_SECRET_KEY_BASE: {{ required "redmine.secretKeyBase must be set" .Values.redmine.secretKeyBase | quote }}
{{- end -}}
