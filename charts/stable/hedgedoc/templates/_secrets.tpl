{{/* Define the secrets */}}
{{- define "hedgedoc.secrets" -}}
enabled: true
data:
  CMD_SESSION_SECRET: {{ required "hedgedoc.sessionSecret must be set" .Values.hedgedoc.sessionSecret }}
{{- end -}}
