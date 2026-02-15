{{/* Renders the GatewayClass objects required by the chart */}}
{{- define "tc.v1.common.spawner.gatewayclasses" -}}
  {{- /* Generate named gatewayclasses as required */ -}}
  {{- range $name, $gatewayClass := .Values.gatewayClass }}
    {{- if $gatewayClass.enabled -}}
      {{- $gatewayClassValues := $gatewayClass -}}

      {{/* set defaults */}}
      {{- if and (not $gatewayClassValues.nameOverride) (ne $name (include "tc.v1.common.lib.util.gatewayclass.primary" $)) -}}
        {{- $_ := set $gatewayClassValues "nameOverride" $name -}}
      {{- end -}}

      {{- $_ := set $ "ObjectValues" (dict "gatewayClass" $gatewayClassValues) -}}
      {{- include "tc.v1.common.class.gatewayclass" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "gatewayClass" -}}
    {{- end }}
  {{- end }}
{{- end }}
