{{- define "tc.v1.common.class.traefik.middleware.stripPrefix" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $mw := $objectData.data -}}
  {{- if not $mw.prefix -}}
    {{- fail "Middleware (strip-prefix) - Expected [prefix] to be set" -}}
  {{- end -}}

  {{- /* Keeps the newline before the next line */}}
  stripPrefix:
    prefix:
      {{- range $mw.prefix }}
      - {{ . | quote }}
      {{- end -}}
    {{- include "tc.v1.common.class.traefik.middleware.helper.bool" (dict "key" "forceSlash" "value" $mw.forceSlash) | nindent 4 }}
{{- end -}}
