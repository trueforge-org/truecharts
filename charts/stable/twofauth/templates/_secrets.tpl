{{/* Define the secrets */}}
{{- define "twofauth.secret" -}}
  {{- $appKey := required "twofauth.appKey must be set" .Values.twofauth.appKey }}
enabled: true
data:
  APP_KEY: {{ $appKey | quote }}
{{- end -}}
