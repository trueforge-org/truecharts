{{/* ExternalSecret Spawner */}}
{{/* Call this template:
{{ include "tc.v1.common.spawner.externalSecret" $ -}}
*/}}

{{- define "tc.v1.common.spawner.externalSecret" -}}
  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $ -}}

  {{- range $name, $externalSecret := .Values.externalSecret -}}
    {{- if not (kindIs "map" $externalSecret) -}}{{- continue -}}{{- end -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $externalSecret
                    "name" $name "caller" "ExternalSecret"
                    "key" "externalSecret")) -}}

    {{- if eq $enabled "true" -}}

      {{/* Create a copy of the external secret */}}
      {{- $objectData := (mustDeepCopy $externalSecret) -}}

      {{- $objectName := $name -}}

      {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                "rootCtx" $ "objectData" $objectData
                "name" $name "caller" "ExternalSecret"
                "key" "externalSecret")) -}}

      {{- if eq $expandName "true" -}}
        {{- $objectName = (printf "%s-%s" $fullname $name) -}}
      {{- end -}}

      {{- include "tc.v1.common.lib.util.metaListToDict" (dict "objectData" $objectData) -}}

      {{/* Perform validations */}} {{/* The created Secret has a max name length of 253 */}}
      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $objectName "length" 253) -}}
      {{- include "tc.v1.common.lib.externalSecret.validation" (dict "rootCtx" $ "objectData" $objectData "name" $name) -}}
      {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" "ExternalSecret") -}}

      {{/* Set the name of the external secret */}}
      {{- $_ := set $objectData "name" $objectName -}}
      {{- $_ := set $objectData "shortName" $name -}}

      {{/* Call class to create the object */}}
      {{- include "tc.v1.common.class.externalSecret" (dict "rootCtx" $ "objectData" $objectData) -}}

    {{- end -}}

  {{- end -}}

{{- end -}}
