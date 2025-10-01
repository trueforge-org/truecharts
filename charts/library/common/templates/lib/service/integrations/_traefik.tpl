{{- define "tc.v1.common.lib.service.integration.traefik" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $_ := set $objectData "integrations" ($objectData.integrations | default dict) -}}
  {{- $traefik := $objectData.integrations.traefik -}}

  {{- if $traefik.enabled -}}
    {{- include "tc.v1.common.lib.service.integration.traefik.validate" (dict "objectData" $objectData) -}}

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

    {{/* Add the ServersTransport annotation. */}}
    {{- $_ := set $objectData.annotations
      "traefik.ingress.kubernetes.io/service.serverstransport"
      (printf "%s-%s-serverstransport@kubernetescrd"
        (include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Service"))
        $objectData.name) -}}

  {{- end -}}

{{- end -}}

{{- define "tc.v1.common.lib.service.integration.traefik.validate" -}}
  {{- $objectData := .objectData -}}

  {{- $traefik := $objectData.integrations.traefik -}}

  {{- if not (kindIs "slice" ($traefik.rootCAs | default list)) -}}
    {{- fail (printf "Service - Expected [integrations.traefik.rootCAs] to be a [slice], but got [%s]" (kindOf $traefik.rootCAs)) -}}
  {{- end -}}

  {{- range $i, $ca := ($traefik.rootCAs | default list) -}}
    {{- if not (kindIs "string" $ca) -}}
      {{- fail (printf "Service - Expected [integrations.traefik.rootCAs[%d]] to be a [string], but got [%s]" $i (kindOf $ca)) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
