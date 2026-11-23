{{/* Define the secrets */}}
{{- define "manyfold.secrets" -}}
enabled: true
data:
  SECRET_KEY_BASE: {{ required "manyfold.secretKeyBase must be set" .Values.manyfold.secretKeyBase }}
{{- end -}}
