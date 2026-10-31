{{/* Configmap From Folder Spawner */}}
{{/* Call this template:
{{ include "tc.v1.common.spawner.configmapFromFolder" $ -}}
*/}}

{{- define "tc.v1.common.spawner.configmapFromFolder" -}}
  {{- $rootCtx := $ -}}
  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $ -}}

  {{- $configMapsFromFolder := $rootCtx.Values.configMapsFromFolder | default dict -}}
  {{- $configMapsFromFolderEnabled := dig "enabled" false $configMapsFromFolder -}}

  {{- if $configMapsFromFolderEnabled -}}
    {{/* Perform validations before rendering */}}
    {{- include "tc.v1.common.lib.configmap.fromFolder.validation" (dict "rootCtx" $ "basePath" ($configMapsFromFolder.basePath | default "" )) -}}

    {{/* Collect folder contents */}}
    {{- $collected := include "tc.v1.common.lib.util.files.collectFromFolder" (
        dict
        "rootCtx" $rootCtx
        "basePath" $configMapsFromFolder.basePath
        "overrides" ($configMapsFromFolder.configMapsOverrides | default dict)
      ) | fromYaml
    -}}

    {{/* Iterate collected folders */}}
    {{- range $folder, $entry := $collected -}}
      {{- $objectData := dict -}}

      {{/* Set name */}}
      {{- $objectName := $folder -}}
      {{- if $entry.forceRename -}}
        {{- $objectName = $entry.forceRename -}}
      {{- else -}}
        {{- $objectName = (printf "%s-%s" $fullname $folder) -}}
      {{- end -}}

      {{/* Perform validations */}} {{/* Configmaps have a max name length of 253 */}}
      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $objectName "length" 253) -}}

      {{/* Set the name and other properties */}}
      {{- $_ := set $objectData "name" $objectName -}}
      {{- $_ := set $objectData "shortName" $folder -}}
      {{- $_ := set $objectData "labels" $entry.labels -}}
      {{- $_ := set $objectData "annotations" $entry.annotations -}}
      
      {{/* Set text and binary data separately */}}
      {{- if $entry.text -}}
        {{- $_ := set $objectData "data" $entry.text -}}
      {{- end -}}
      {{- if $entry.binary -}}
        {{- $_ := set $objectData "binaryData" $entry.binary -}}
      {{- end -}}

      {{/* Include metadata validation */}}
      {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" "ConfigMap") -}}

      {{/* Call class to create the object */}}
      {{- include "tc.v1.common.class.configmap" (dict "rootCtx" $ "objectData" $objectData) -}}

    {{- end -}}

  {{- end -}}

{{- end -}}
