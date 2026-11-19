{{- define "tc.v1.common.class.traefik.middleware.ipAllowList" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $mw := $objectData.data -}}


  {{- /* Keeps the newline before the next line */}}
  ipAllowList:
    {{- if $mw.sourceRange }}
    sourceRange:
      {{- range $mw.sourceRange }}
      - {{ . | quote }}
      {{- end }}
    {{- end -}}

    {{- if $mw.ipStrategy }}
    ipStrategy:
      {{- include "tc.v1.common.class.traefik.middleware.helper.int" (dict "key" "depth" "value" $mw.ipStrategy.depth) | nindent 6 }}
      {{- if $mw.ipStrategy.excludedIPs }}
      excludedIPs:
        {{- range $mw.ipStrategy.excludedIPs }}
        - {{ . | quote }}
        {{- end }}
      {{- end -}}
    {{- end -}}
{{- end -}}
