{{- define "tc.v1.common.class.traefik.middleware.forwardAuth" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $mw := $objectData.data -}}


  {{- if hasKey $mw "maxResponseBodySize" -}}
    {{- $sizeKind := kindOf $mw.maxResponseBodySize -}}
  {{- end -}}




  {{- if not $mw.address -}}
    {{- fail "Middleware (forward-auth) - Expected [address] to be set" -}}
  {{- end }}
  forwardAuth:
    address: {{ tpl $mw.address $rootCtx }}
    trustForwardHeader: {{ $mw.trustForwardHeader }}
    {{- if $mw.maxResponseBodySize }}
    maxResponseBodySize: {{ $mw.maxResponseBodySize | int }}
    {{- end }}

    {{- include "tc.v1.common.class.traefik.middleware.helper.string" (dict "key" "authResponseHeadersRegex" "value" $mw.authResponseHeadersRegex) | nindent 4 }}

    {{- if $mw.authResponseHeaders }}
    authResponseHeaders:
      {{- range $mw.authResponseHeaders }}
      - {{ . | quote }}
      {{- end }}
    {{- end -}}

    {{- if $mw.authRequestHeaders }}
    authRequestHeaders:
      {{- range $mw.authRequestHeaders }}
      - {{ . | quote }}
      {{- end }}
    {{- end -}}

    {{- if $mw.tls }}
    tls:
      insecureSkipVerify: {{ $mw.tls.insecureSkipVerify }}
    {{- end -}}
{{- end -}}
