{{/* Configmap Validation */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.configmap.validation" (dict "objectData" $objectData) -}}
objectData:
  labels: The labels of the configmap.
  annotations: The annotations of the configmap.
  data: The data of the configmap.
*/}}

{{- define "tc.v1.common.lib.configmap.validation" -}}
  {{- $objectData := .objectData -}}

  {{- if and (not $objectData.data) (not $objectData.binaryData) -}}
    {{- fail "ConfigMap - Expected non-empty [data] or [binaryData]" -}}
  {{- end -}}

  {{- if $objectData.data -}}
    {{- if not (kindIs "map" $objectData.data) -}}
      {{- fail (printf "ConfigMap - Expected [data] to be a dictionary, but got [%v]" (kindOf $objectData.data)) -}}
    {{- end -}}
  {{- end -}}

  {{- if $objectData.binaryData -}}
    {{- if not (kindIs "map" $objectData.binaryData) -}}
      {{- fail (printf "ConfigMap - Expected [binaryData] to be a dictionary, but got [%v]" (kindOf $objectData.binaryData)) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}

{{/* Configmap From Folder Validation */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.configmap.fromFolder.validation" (dict "rootCtx" $ "basePath" $basePath) -}}
rootCtx: The root context of the chart.
basePath: The base path to search for folders.
*/}}

{{- define "tc.v1.common.lib.configmap.fromFolder.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $basePath := required "If you're using `configMapsFromFolder` you need to specify a `basePath` key" (trimSuffix "/" .basePath) -}}
  {{- $filteredPaths := $rootCtx.Files.Glob (printf "%s/**" $basePath) -}}
  {{- $folders := dict -}}

  {{- range $path, $_ := $filteredPaths -}}
    {{- $_ := set $folders (dir $path) "" -}}
  {{- end -}}
  {{- $folders = keys $folders | uniq | sortAlpha -}}

  {{- if empty $folders -}}
    {{- fail (printf "No usable files found in the folder %s" $basePath) }}
  {{- end -}}
{{- end -}}
