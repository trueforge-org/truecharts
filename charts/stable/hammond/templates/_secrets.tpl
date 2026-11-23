{{/* Define the secrets */}}
{{- define "hammond.secrets" -}}
enabled: true
data:
  JWT_SECRET: {{ required "hammond.jwtSecret must be set" .Values.hammond.jwtSecret | quote }}
{{- end -}}
