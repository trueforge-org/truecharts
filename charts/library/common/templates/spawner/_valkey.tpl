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

      {{/* The image defaults to the one of the dependency, so there is a single place to update it */}}
      {{- $image := $objectData.image -}}
      {{- if not $image -}}
        {{- if not (and (kindIs "map" $dep.image) $dep.image.repository $dep.image.tag) -}}
          {{- fail "Valkey Operator - Expected [dependencies.valkey.operator.image] or [dependencies.valkey.image.repository] and [dependencies.valkey.image.tag] to be set" -}}
        {{- end -}}
        {{- $image = printf "%s:%s" $dep.image.repository $dep.image.tag -}}
      {{- end -}}
      {{- $_ := set $objectData "image" $image -}}

      {{- include "tc.v1.common.lib.dependencies.valkey.operator.validation" (dict "rootCtx" $ "objectData" $objectData) -}}

      {{/* Create the ValkeyCluster */}}
      {{- include "tc.v1.common.class.valkey.cluster" (dict "rootCtx" $ "objectData" $objectData) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
