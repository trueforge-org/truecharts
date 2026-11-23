{{/* Define the secrets */}}
{{- define "ollama.secrets" -}}
enabled: true
data:
  WEBUI_SECRET_KEY: {{ required "ollama.webuiSecretKey must be set" .Values.ollama.webuiSecretKey }}
{{- end -}}
