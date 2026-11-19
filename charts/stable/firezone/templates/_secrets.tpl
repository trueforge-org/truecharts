{{/* Define the secrets */}}
{{- define "firezone.secrets" -}}
# firezone requires all these keys to be in base 64 | b64enc format presented in the container, so this b64enc here is intentional
# https://www.firezone.dev/docs/reference/env-vars#secrets-and-encryption
enabled: true
data:
  GUARDIAN_SECRET_KEY: {{ required "firezone.secrets.guardianSecretKey must be set" .Values.firezone.secrets.guardianSecretKey | b64enc }}
  DATABASE_ENCRYPTION_KEY: {{ required "firezone.secrets.databaseEncryptionKey must be set" .Values.firezone.secrets.databaseEncryptionKey | b64enc }}
  SECRET_KEY_BASE: {{ required "firezone.secrets.secretKeyBase must be set" .Values.firezone.secrets.secretKeyBase | b64enc }}
  LIVE_VIEW_SIGNING_SALT: {{ required "firezone.secrets.liveViewSigningSalt must be set" .Values.firezone.secrets.liveViewSigningSalt | b64enc }}
  COOKIE_SIGNING_SALT: {{ required "firezone.secrets.cookieSigningSalt must be set" .Values.firezone.secrets.cookieSigningSalt | b64enc }}
  COOKIE_ENCRYPTION_SALT: {{ required "firezone.secrets.cookieEncryptionSalt must be set" .Values.firezone.secrets.cookieEncryptionSalt | b64enc }}
{{- end -}}
