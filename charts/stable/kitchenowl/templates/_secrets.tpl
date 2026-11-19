{{/* Define the secrets */}}
{{- define "kitchenowl.secrets" -}}
enabled: true
data:
  JWT_SECRET_KEY: {{ required "kitchenowl.jwtSecretKey must be set" .Values.kitchenowl.jwtSecretKey }}
{{- end -}}
