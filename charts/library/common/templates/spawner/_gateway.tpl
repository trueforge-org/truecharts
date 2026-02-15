{{/* Renders the Gateway objects required by the chart */}}
{{- define "tc.v1.common.spawner.gateways" -}}
  {{- /* Generate named gateways as required */ -}}
  {{- range $name, $gateway := .Values.gateway }}
    {{- if $gateway.enabled -}}
      {{- $gatewayValues := $gateway -}}

      {{/* set defaults */}}
      {{- if and (not $gatewayValues.nameOverride) (ne $name (include "tc.v1.common.lib.util.gateway.primary" $)) -}}
        {{- $_ := set $gatewayValues "nameOverride" $name -}}
      {{- end -}}

      {{- $_ := set $ "ObjectValues" (dict "gateway" $gatewayValues) -}}
      {{- include "tc.v1.common.class.gateway" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "gateway" -}}
    {{- end }}
  {{- end }}
{{- end }}
