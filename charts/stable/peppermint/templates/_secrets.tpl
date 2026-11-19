{{/* Define the secrets */}}
{{- define "peppermint.secrets" -}}
enabled: true
data:
  SECRET: {{ required "peppermint.secretKey must be set" .Values.peppermint.secretKey | quote }}
{{- end -}}
