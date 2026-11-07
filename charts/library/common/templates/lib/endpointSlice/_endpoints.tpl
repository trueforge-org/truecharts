{{/* EndpointSlice - endpoints */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.endpointslice.endpoints" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}
rootCtx: The root context of the chart.
objectData: The object data of the service
*/}}

{{- define "tc.v1.common.lib.endpointslice.endpoints" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- if not $objectData.externalIP -}}
    {{- fail "EndpointSlice - Expected non-empty [externalIP]" -}}
  {{- end -}}

  {{- /* Keeps the newline before the next line */}}
- addresses:
  - {{ tpl $objectData.externalIP $rootCtx }}
  conditions:
    ready: true
{{- end -}}
