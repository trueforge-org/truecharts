{{/* Define the secrets */}}
{{- define "anonaddy.secrets" -}}
enabled: true
data:
  # Anonaddy requires APP_KEY to be in base 64 format presented in the container, so this b64enc here is intentional
  # https://github.com/anonaddy/docker/blob/master/README.md#app
  APP_KEY: {{ printf "base64:%v" (required "anonaddy.appKey must be set" .Values.anonaddy.appKey | b64enc) }}
  # Anonaddy requires ANONADDY_SECRET to be a long string
  ANONADDY_SECRET: {{ required "anonaddy.secretKey must be set" .Values.anonaddy.secretKey }}
{{- end -}}
