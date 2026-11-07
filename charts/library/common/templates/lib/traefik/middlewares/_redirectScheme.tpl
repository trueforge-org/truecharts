{{- define "tc.v1.common.class.traefik.middleware.redirectScheme" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $mw := $objectData.data -}}
  {{- if not $mw.scheme -}}
    {{- fail "Middleware (redirect-scheme) - Expected [scheme] to be set" -}}
  {{- end -}}

  {{- /* Keeps the newline before the next line */}}
  redirectScheme:
    scheme: {{ $mw.scheme }}
    {{- include "tc.v1.common.class.traefik.middleware.helper.bool" (dict "key" "permanent" "value" $mw.permanent) | nindent 4 }}
{{- end -}}
