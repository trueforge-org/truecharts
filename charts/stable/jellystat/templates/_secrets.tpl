{{/* Define the secrets */}}
{{- define "jellystat.secrets" -}}
enabled: true
data:
  JWT_SECRET: {{ required "jellystat.jwtSecret must be set" .Values.jellystat.jwtSecret }}
{{- end -}}
