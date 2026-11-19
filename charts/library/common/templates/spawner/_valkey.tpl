{{/* Renders the ValkeyCluster of the valkey dependency, when it is provided by the valkey-operator */}}
{{/* Call this template:
{{ include "tc.v1.common.spawner.valkey" $ }}
*/}}
{{- define "tc.v1.common.spawner.valkey" -}}

  {{- $dep := get ($.Values.dependencies | default dict) "valkey" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "valkey" "caller" "Dependencies"
                    "key" "dependencies")) -}}
    {{- $mode := (include "tc.v1.common.lib.dependencies.mode" (dict "objectData" $dep "depName" "valkey")) -}}

    {{/* In standalone mode the dependency is merged into the chart instead */}}
    {{- if and (eq $enabled "true") (eq $mode "operator") -}}
      {{- if and $dep.operator (not (kindIs "map" $dep.operator)) -}}
        {{- fail (printf "Valkey Operator - Expected [dependencies.valkey.operator] to be a [map], but got [%s]" (kindOf $dep.operator)) -}}
      {{- end -}}

      {{/* Create a copy */}}
      {{- $objectData := mustDeepCopy ($dep.operator | default dict) -}}

      {{/* The name of the Service the operator creates is derived from it, see [tc.v1.common.lib.dependencies.valkey.operator.service] */}}
      {{- $_ := set $objectData "name" (include "tc.v1.common.lib.dependencies.valkey.operator.clusterName" (dict "rootCtx" $)) -}}
      {{- $_ := set $objectData "shortName" "valkey" -}}

      {{/* The images are defined on the root of the values, the same image as the standalone mode by default */}}
      {{- $_ := set $objectData "image" (include "tc.v1.common.lib.dependencies.valkey.operator.image" (dict
            "rootCtx" $ "selector" ($objectData.imageSelector | default "valkeyImage") "key" "imageSelector")) -}}

      {{- if and $objectData.exporter (not (kindIs "map" $objectData.exporter)) -}}
        {{- fail (printf "Valkey Operator - Expected [dependencies.valkey.operator.exporter] to be a [map], but got [%s]" (kindOf $objectData.exporter)) -}}
      {{- end -}}
      {{- $exporter := $objectData.exporter | default dict -}}
      {{- $_ := set $exporter "image" (include "tc.v1.common.lib.dependencies.valkey.operator.image" (dict
            "rootCtx" $ "selector" ($exporter.imageSelector | default "valkeyExporterImage") "key" "exporter.imageSelector")) -}}
      {{- $_ := set $objectData "exporter" $exporter -}}

      {{- include "tc.v1.common.lib.dependencies.valkey.operator.validation" (dict "rootCtx" $ "objectData" $objectData) -}}

      {{/* Create the ValkeyCluster */}}
      {{- include "tc.v1.common.class.valkey.cluster" (dict "rootCtx" $ "objectData" $objectData) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
