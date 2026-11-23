{{/* Define the secrets */}}
{{- define "audiobookshelf.secrets" -}}
enabled: true
data:
  TOKEN_SECRET: {{ required "audiobookshelf.tokenSecret must be set" .Values.audiobookshelf.tokenSecret }}
{{- end -}}
