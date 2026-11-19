{{/* Renders the Gateway objects required by the chart */}}
{{- define "tc.v1.common.spawner.gateways" -}}
  {{- include "tc.v1.common.lib.gateway.primaryValidation" (dict "rootCtx" $ "key" "gateway" "caller" "Gateway") -}}

  {{- /* Generate named gateways as required */ -}}
  {{- range $name, $gateway := .Values.gateway }}
    {{- if eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $gateway "name" $name "key" "gateway" "caller" "Gateway")) "true" -}}
      {{- include "tc.v1.common.lib.gateway.validation" (dict "objectData" $gateway "name" $name) -}}

      {{- $_ := set $ "ObjectValues" (dict "gateway" $gateway "gatewayName" $name) -}}
      {{- include "tc.v1.common.class.gateway" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "gateway" -}}
    {{- end }}
  {{- end }}
{{- end }}
