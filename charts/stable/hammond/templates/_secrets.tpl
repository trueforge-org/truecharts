{{/* Define the secrets */}}
{{- define "hammond.secrets" -}}
{{- $secretName := printf "%s-secrets" (include "tc.v1.common.lib.chart.names.fullname" .) }}
{{- $hammondprevious := lookup "v1" "Secret" .Release.Namespace $secretName }}
{{- $jwt_secret := randAlphaNum 32 }}
{{/* Secret data is base64 encoded, but common renders it as stringData, so decode it first */}}
{{- $previous := dig "data" "JWT_SECRET" "" $hammondprevious | b64dec }}
{{/* Older versions re-encoded the value on every upgrade; replace it once it has grown */}}
{{- if and $previous (le (len $previous) 64) }}
  {{- $jwt_secret = $previous }}
{{- end }}
enabled: true
data:
  JWT_SECRET: {{ $jwt_secret | quote }}

{{- end -}}
