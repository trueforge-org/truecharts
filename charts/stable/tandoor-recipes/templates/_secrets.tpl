{{/* Define the secrets */}}
{{- define "recipes.secrets" -}}
{{- $secretKey := required "tandoor.secretKey must be set" .Values.tandoor.secretKey }}
enabled: true
data:
  SECRET_KEY: {{ $secretKey | quote }}
{{- end -}}
