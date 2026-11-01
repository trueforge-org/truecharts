{{/* ListenerSet Spawner */}}
{{/* Call this template:
{{ include "tc.v1.common.spawner.listenerSet" $ -}}
*/}}

{{- define "tc.v1.common.spawner.listenerSet" -}}
  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $ -}}

  {{- range $name, $listenerSet := .Values.listenerSet -}}
    {{- if not (kindIs "map" $listenerSet) -}}{{- continue -}}{{- end -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $listenerSet
                    "name" $name "caller" "ListenerSet"
                    "key" "listenerSet")) -}}

    {{- if eq $enabled "true" -}}

      {{/* Create a copy of the listener set */}}
      {{- $objectData := (mustDeepCopy $listenerSet) -}}

      {{- $objectName := $name -}}

      {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                "rootCtx" $ "objectData" $objectData
                "name" $name "caller" "ListenerSet"
                "key" "listenerSet")) -}}

      {{- if eq $expandName "true" -}}
        {{- $objectName = (printf "%s-%s" $fullname $name) -}}
      {{- end -}}

      {{- include "tc.v1.common.lib.util.metaListToDict" (dict "objectData" $objectData) -}}

      {{/* Perform validations */}}
      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $objectName) -}}
      {{- include "tc.v1.common.lib.gateway.validation" (dict "objectData" $objectData "name" $name "caller" "ListenerSet" "key" "listenerSet") -}}
      {{- include "tc.v1.common.lib.listenerSet.validation" (dict "rootCtx" $ "objectData" $objectData "name" $name) -}}
      {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" "ListenerSet") -}}

      {{/* Set the name of the listener set */}}
      {{- $_ := set $objectData "name" $objectName -}}
      {{- $_ := set $objectData "shortName" $name -}}

      {{/* Call class to create the object */}}
      {{- include "tc.v1.common.class.listenerSet" (dict "rootCtx" $ "objectData" $objectData) -}}

    {{- end -}}

  {{- end -}}

{{- end -}}
