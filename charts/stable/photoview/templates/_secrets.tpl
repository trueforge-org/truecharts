{{/* Define the secrets */}}
{{- define "photoview.secrets" -}}
enabled: true
data:
  PHOTOVIEW_POSTGRES_URL: {{ (printf "%s?client_encoding=utf8" (.Values.dependencies.postgresql.depconfig.creds.complete | trimAll "\"")) | quote }}
{{- end -}}
