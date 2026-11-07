{{/* Renders the GatewayClass objects required by the chart */}}
{{- define "tc.v1.common.spawner.gatewayclasses" -}}
  {{- include "tc.v1.common.lib.gateway.primaryValidation" (dict "rootCtx" $ "key" "gatewayClass" "caller" "GatewayClass") -}}

  {{- /* Generate named gatewayclasses as required */ -}}
  {{- range $name, $gatewayClass := .Values.gatewayClass }}
    {{- if eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $gatewayClass "name" $name "key" "gatewayClass" "caller" "GatewayClass")) "true" -}}
      {{- $_ := set $ "ObjectValues" (dict "gatewayClass" $gatewayClass "gatewayClassName" $name) -}}
      {{- include "tc.v1.common.class.gatewayclass" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "gatewayClass" -}}
    {{- end }}
  {{- end }}
{{- end }}
