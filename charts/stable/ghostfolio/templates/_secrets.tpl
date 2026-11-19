{{/* Define the secrets */}}
{{- define "ghostfolio.secrets" -}}
enabled: true
data:
  ACCESS_TOKEN_SALT: {{ required "ghostfolio.accessTokenSalt must be set" .Values.ghostfolio.accessTokenSalt }}
  JWT_SECRET_KEY: {{ required "ghostfolio.jwtSecretKey must be set" .Values.ghostfolio.jwtSecretKey }}
  DATABASE_URL: {{ (printf "%s?client_encoding=utf8" (.Values.cnpg.main.creds.std | trimAll "\"")) | quote }}
{{- end -}}
