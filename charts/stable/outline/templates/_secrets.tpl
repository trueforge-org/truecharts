{{/* Define the secrets */}}
{{- define "outline.secrets" -}}
enabled: true
data:
  SECRET_KEY: {{ required "outline.secretKey must be set" .Values.outline.secretKey }}
  UTILS_SECRET: {{ required "outline.utilsSecret must be set" .Values.outline.utilsSecret }}
  REDIS_CUSTOM_URL: {{ .Values.dependencies.valkey.depconfig.creds.url | trimAll "\""  }}
{{- end -}}
