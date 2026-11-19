{{/* Define the secrets */}}
{{- define "watcharr.secrets" -}}
{{- $secretKey := required "watcharr.jwtSecret must be set" .Values.watcharr.jwtSecret }}
enabled: true
data:
  JWT_SECRET: {{ $secretKey | quote }}
{{- end -}}
