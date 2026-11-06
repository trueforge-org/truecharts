{{/* Custom CSI */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.storage.customCSI" (dict "rootCtx" $ "objectData" $objectData) }}

rootCtx: The root context of the chart.
objectData:
  name: The name of the PV, the default of the volume handle.
  static:
    driver: The name of the driver.
    volumeHandle: The handle of the volume in the driver.
    volumeAttributes: The attributes of the volume in the driver.
*/}}
{{- define "tc.v1.common.lib.storage.customCSI" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData }}
csi:
  driver: {{ $objectData.static.driver }}
  volumeHandle: {{ tpl ($objectData.static.volumeHandle | default $objectData.name) $rootCtx }}
  {{- with $objectData.static.volumeAttributes }}
  volumeAttributes:
    {{- range $k, $v := . }}
    {{ $k }}: {{ tpl $v $rootCtx | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Validate custom CSI */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.storage.customCSI.validation" (dict "objectData" $objectData) }}

objectData:
  static:
    driver: The name of the driver.
    provisioner: The provisioner of the PV.
*/}}
{{- define "tc.v1.common.lib.storage.customCSI.validation" -}}
  {{- $objectData := .objectData -}}

  {{- $required := (list "driver" "provisioner") -}}
  {{- range $item := $required -}}
    {{- if not (get $objectData.static $item) -}}
      {{- fail (printf "Custom CSI - Expected [%v] to be non-empty" $item) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
