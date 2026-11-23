{{/* Define the secrets */}}
{{- define "nocodb.secrets" -}}
enabled: true
data:
  NC_AUTH_JWT_SECRET: {{ required "nocodb.authJwtSecret must be set" .Values.nocodb.authJwtSecret }}
{{- end -}}
