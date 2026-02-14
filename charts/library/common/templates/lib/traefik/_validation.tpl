{{/* Middleware Validation */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.traefik.middleware.validation" (dict "objectData" $objectData) -}}
objectData:
  labels: The labels of the middleware.
  annotations: The annotations of the middleware.
  data: The data of the middleware.
*/}}

{{- define "tc.v1.common.lib.traefik.middleware.validation" -}}
  {{- $objectData := .objectData -}}

  {{- if not $objectData.type -}}
    {{- fail "Middleware - Expected [type] to be set" -}}
  {{- end -}}

  {{- if $objectData.data -}}
    {{- if not (kindIs "map" $objectData.data) -}}
      {{- fail (printf "Middleware - Expected [data] to be a dictionary, but got [%v]" (kindOf $objectData.data)) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}

{{/* ServersTransport Validation */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.traefik.serverstransport.validation" (dict "objectData" $objectData) -}}
objectData:
  labels: The labels of the ServersTransport.
  annotations: The annotations of the ServersTransport.
  data: The data of the ServersTransport.
*/}}

{{- define "tc.v1.common.lib.traefik.serverstransport.validation" -}}
  {{- $objectData := .objectData -}}

  {{- if $objectData.data -}}
    {{- if not (kindIs "map" $objectData.data) -}}
      {{- fail (printf "ServersTransport - Expected [data] to be a dictionary, but got [%v]" (kindOf $objectData.data)) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
