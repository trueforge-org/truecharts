{{/* The root credentials, so they reach the container through a Secret instead of plain env
     strings on the Deployment. */}}
{{- define "minio.secrets" -}}
enabled: true
data:
  user: {{ .Values.minio.rootUser | quote }}
  password: {{ .Values.minio.rootPassword | quote }}
{{- end -}}
