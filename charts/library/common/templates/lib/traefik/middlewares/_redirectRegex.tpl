{{- define "tc.v1.common.class.traefik.middleware.redirectRegex" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $mw := $objectData.data -}}
  {{- if not $mw.regex -}}
    {{- fail "Middleware (redirect-regex) - Expected [regex] to be set" -}}
  {{- end -}}
  {{- if not $mw.replacement -}}
    {{- fail "Middleware (redirect-regex) - Expected [replacement] to be set" -}}
  {{- end -}}

  {{- /* Keeps the newline before the next line */}}
  redirectRegex:
    regex: {{ $mw.regex | quote }}
    replacement: {{ $mw.replacement | quote }}
    {{- include "tc.v1.common.class.traefik.middleware.helper.bool" (dict "key" "permanent" "value" $mw.permanent) | nindent 4 }}
{{- end -}}
