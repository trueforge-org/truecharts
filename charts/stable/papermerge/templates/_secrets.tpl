{{/* Define the secrets */}}
{{- define "papermerge.secrets" -}}
enabled: true
data:
  PAPERMERGE__SECURITY__SECRET_KEY: {{ required "papermerge.secretKey must be set" .Values.papermerge.secretKey | quote }}
{{- end -}}
