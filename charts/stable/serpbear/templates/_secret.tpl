{{/* Define the secret */}}
{{- define "serpbear.secret" -}}

enabled: true
data:
  SECRET: {{ required "serpbear.secret must be set" .Values.serpbear.secret | quote }}
  {{- with .Values.serpbear.api_key }}
  APIKEY: {{ . }}
  {{- end }}
  USER: {{ .Values.serpbear.user }}
  PASSWORD: {{ .Values.serpbear.password }}
  SESSION_DURATION: {{ .Values.serpbear.session_duration | quote }}
  NEXT_PUBLIC_APP_URL: {{ .Values.serpbear.app_url }}
{{- end }}
