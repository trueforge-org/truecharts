{{/* Define the secrets */}}
{{- define "sheetable.secrets" -}}

enabled: true
data:
  API_SECRET: {{ required "sheetable.apiSecret must be set" .Values.sheetable.apiSecret | quote }}
{{- end -}}
