{{- define "tc.v1.common.lib.service.integration.traefik" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $_ := set $objectData "integrations" ($objectData.integrations | default dict) -}}
  {{- $traefik := $objectData.integrations.traefik -}}

  {{- if $traefik.enabled -}}
    {{- $forceTLS := $traefik.forceTLS | default false -}}
    {{- $hasSingleHTTPSPort := false -}}

    {{- if and (not $forceTLS) (eq (len $objectData.ports) 1) -}}
      {{- range $portName, $port := $objectData.ports -}}
        {{- if and $port.enabled (eq (tpl ($port.protocol | default "") $rootCtx) "https") -}}
          {{- $hasSingleHTTPSPort = true -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- if or $hasSingleHTTPSPort $forceTLS -}}
      {{- $_ := set $objectData.annotations "traefik.ingress.kubernetes.io/service.serversscheme" "https" -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
