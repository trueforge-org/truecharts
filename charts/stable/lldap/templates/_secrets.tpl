{{/* Define the secrets */}}
{{- define "lldap.secrets" -}}
enabled: true
data:
  LLDAP_JWT_SECRET: {{ required "lldap.jwtSecret must be set" .Values.lldap.jwtSecret }}
{{- end -}}
