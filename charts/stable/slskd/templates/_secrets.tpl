{{/* Define the secrets */}}
{{- define "slskd.secrets" -}}
{{- $jwtKey := required "slskd.jwtKey must be set" .Values.slskd.jwtKey -}}
enabled: true
data:
  SLSKD_JWT_KEY: {{ $jwtKey | quote }}
{{- end -}}
