{{/* Define the secrets */}}
{{- define "teslamate.secrets" -}}
{{- $encryptionKey := required "teslamate.encryptionKey must be set" .Values.teslamate.encryptionKey }}
enabled: true
data:
  TESLAMATE_ENCRYPTION_KEY: {{ $encryptionKey | quote }}
{{- end -}}
