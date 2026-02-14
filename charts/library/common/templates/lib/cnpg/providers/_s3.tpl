{{- define "tc.v1.common.lib.cnpg.provider.s3.secret" -}}
{{- $creds := .creds }}
enabled: true
data:
  {{- if $creds.region }}
  REGION: {{ $creds.region | quote }}
  {{- end }}
  ACCESS_KEY_ID: {{ $creds.accessKey | default "" | quote }}
  ACCESS_SECRET_KEY: {{ $creds.secretKey | default "" | quote }}
{{- end -}}
