{{- define "linkwarden.secrets" -}}
enabled: true
data:
  NEXTAUTH_SECRET: {{ required "linkwarden.nextauthSecret must be set" .Values.linkwarden.nextauthSecret }}
{{- end -}}
