{{/* Define the secrets */}}
{{- define "tagspaces.secret" -}}
{{- $key := required "tagspaces.key must be set" .Values.tagspaces.key }}

tagspaces-secret:
  enabled: true
  data:
    KEY: {{ $key | quote }}
{{- end -}}
