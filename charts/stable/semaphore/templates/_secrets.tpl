{{/* Define the secrets */}}
{{- define "semaphore.secrets" -}}
enabled: true
data:
  SEMAPHORE_ACCESS_KEY_ENCRYPTION: {{ required "semaphore.accessKeyEncryption must be set" .Values.semaphore.accessKeyEncryption | quote }}
{{- end -}}
