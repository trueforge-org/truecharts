{{- define "tc.v1.common.lib.cnpg.provider.s3.customCA.secret" -}}
{{- $creds := .creds }}
enabled: true
data:
  ca.crt: |-
{{ $creds.customCA | indent 4 }}
{{- end -}}
