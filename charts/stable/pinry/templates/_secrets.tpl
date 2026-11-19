{{/* Define the secrets */}}
{{- define "pinry.secrets" -}}
enabled: true
data:
  SECRET_KEY: {{ required "pinry.secretKey must be set" .Values.pinry.secretKey | quote }}
{{- end -}}
