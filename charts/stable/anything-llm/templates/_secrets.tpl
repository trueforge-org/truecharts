{{/* Define the secrets */}}
{{- define "anythinglmm.secrets" -}}
enabled: true
data:
  JWT_SECRET: {{ required "anythingLlm.jwtSecret must be set" .Values.anythingLlm.jwtSecret }}
{{- end -}}
