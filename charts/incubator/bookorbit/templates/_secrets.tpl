{{/* Define the secrets */}}
{{- define "bookorbit.secrets" -}}
{{- $secretName := (printf "%s-bookorbit-secrets" (include "tc.v1.common.lib.chart.names.fullname" $)) }}

{{- $jwtSecret := randAlphaNum 32 -}}
{{- $setupBootstrapToken := randAlphaNum 32 -}}
 {{- with lookup "v1" "Secret" .Release.Namespace $secretName -}}
   {{- $jwtSecret = index .data "JWT_SECRET" | b64dec -}}
   {{- $setupBootstrapToken = index .data "SETUP_BOOTSTRAP_TOKEN" | b64dec -}}
 {{- end }}
enabled: true
data:
  JWT_SECRET: {{ $jwtSecret }}
  SETUP_BOOTSTRAP_TOKEN: {{ $setupBootstrapToken }}
{{- end -}}
