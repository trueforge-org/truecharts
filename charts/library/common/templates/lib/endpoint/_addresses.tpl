{{/* Endpoint - addresses */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.endpoint.addresses" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}
rootCtx: The root context of the chart.
objectData: The object data of the service
*/}}

{{- define "tc.v1.common.lib.endpoint.addresses" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- if not $objectData.externalIP -}}
    {{- fail "EndpointSlice - Expected non-empty [externalIP]" -}}
  {{- end -}}

  {{- /* Keeps the newline before the next line */}}
  - ip: {{ tpl $objectData.externalIP $rootCtx }}
{{- end -}}
