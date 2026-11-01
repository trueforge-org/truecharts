{{/* Applies the addons of a dependency, defined under [dependencies.$name.addons] */}}
{{/* Call this template:
{{ include "tc.v1.common.values.dependencies.addons" (dict "rootCtx" $ "mergedValues" $mergedValues "commonValues" $commonValues "depName" $depName "dep" $dep "collections" $collections) }}
rootCtx: The root context of the chart.
mergedValues: The merged values of the chart.
commonValues: The (untouched) default values of the common library, the addons inherit their defaults.
depName: The name of the dependency.
dep: The values of the dependency.
collections: The object collections of the dependency. Collections the addons add objects to are added in place.

The addon templates of common work on a root context. They get a context scoped to the dependency instead,
sharing its collections, so the containers and objects of the addons are added to the dependency
and are merged into the chart the same way as the other objects of the dependency.
The addons of the chart are not inherited, so the same addon can be configured differently in each dependency.
*/}}
{{- define "tc.v1.common.values.dependencies.addons" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $mergedValues := .mergedValues -}}
  {{- $commonAddons := .commonValues.addons | default dict -}}
  {{- $depName := .depName -}}
  {{- $dep := .dep -}}
  {{- $collections := .collections -}}

  {{- $addons := $dep.addons -}}
  {{- if kindIs "invalid" $addons -}}
    {{- $addons = dict -}}
  {{- end -}}

  {{- if not (kindIs "map" $addons) -}}
    {{- fail (printf "Dependencies - Expected [dependencies.%s.addons] to be a [map], but got [%s]" $depName (kindOf $addons)) -}}
  {{- end -}}

  {{- $templates := (dict
        "codeserver" "tc.v1.common.addon.codeserver"
        "gluetun" "tc.v1.common.addon.gluetun"
        "netshoot" "tc.v1.common.addon.netshoot"
        "tailscale" "tc.v1.common.addon.tailscale") -}}

  {{- $enabledAddons := dict -}}
  {{- range $addonName, $addonValues := $addons -}}
    {{- if not (hasKey $templates $addonName) -}}
      {{- fail (printf "Dependencies - Addon [%s] is not supported in dependency [%s], expected one of [%s]" $addonName $depName (join ", " (keys $templates | sortAlpha))) -}}
    {{- end -}}

    {{- if not (kindIs "map" $addonValues) -}}
      {{- fail (printf "Dependencies - Expected [dependencies.%s.addons.%s] to be a [map], but got [%s]" $depName $addonName (kindOf $addonValues)) -}}
    {{- end -}}

    {{- $addon := mustMergeOverwrite (mustDeepCopy (get $commonAddons $addonName)) (mustDeepCopy $addonValues) -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $rootCtx "objectData" $addon
                    "name" $addonName "caller" "Dependencies"
                    "key" (printf "dependencies.%s.addons" $depName))) -}}

    {{- if eq $enabled "true" -}}
      {{- $_ := set $addon "enabled" true -}}
      {{/* Without a targetSelector, the addon targets the primary workload of the dependency, instead of the one named [main] */}}
      {{- if not $addonValues.targetSelector -}}
        {{- $_ := unset $addon "targetSelector" -}}
      {{- end -}}
      {{- $_ := set $enabledAddons $addonName $addon -}}
    {{- end -}}
  {{- end -}}

  {{- if $enabledAddons -}}
    {{/* The collections the addons add their objects to */}}
    {{- $scope := dict -}}
    {{- range $collName := (list "workload" "service" "ingress" "persistence" "secret") -}}
      {{- $objects := get $collections $collName -}}
      {{- if not (kindIs "map" $objects) -}}
        {{- $objects = dict -}}
      {{- end -}}
      {{- $_ := set $scope $collName $objects -}}
    {{- end -}}

    {{- $primaryWorkload := (include "tc.v1.common.values.dependencies.primary" (dict "objects" $scope.workload "kind" "workload" "depName" $depName)) -}}

    {{/* The objects of the addons must not change which objects are the primary ones of the dependency */}}
    {{- range $addonName, $addon := $enabledAddons -}}
      {{- if not $addon.targetSelector -}}
        {{- if not $primaryWorkload -}}
          {{- fail (printf "Dependencies - Expected [targetSelector] of addon [%s] in dependency [%s], as no primary workload could be determined" $addonName $depName) -}}
        {{- end -}}
        {{- $_ := set $addon "targetSelector" (list $primaryWorkload) -}}
      {{- end -}}

      {{- $targetSelector := $addon.targetSelector -}}
      {{- if not (kindIs "slice" $targetSelector) -}}
        {{- fail (printf "Dependencies - Expected [targetSelector] of addon [%s] in dependency [%s] to be a [slice], but got [%s]" $addonName $depName (kindOf $targetSelector)) -}}
      {{- end -}}

      {{- range $wlName := $targetSelector -}}
        {{- $wl := get $scope.workload $wlName -}}
        {{- if not (kindIs "map" $wl) -}}
          {{- fail (printf "Dependencies - Expected workload [%s], targeted by addon [%s], to be defined in dependency [%s]" $wlName $addonName $depName) -}}
        {{- end -}}

        {{- if not (kindIs "map" $wl.podSpec) -}}
          {{- $_ := set $wl "podSpec" dict -}}
        {{- end -}}
        {{- if not (kindIs "map" $wl.podSpec.containers) -}}
          {{- $_ := set $wl.podSpec "containers" dict -}}
        {{- end -}}

        {{- with (include "tc.v1.common.values.dependencies.primary" (dict "objects" $wl.podSpec.containers "kind" "container" "depName" $depName)) -}}
          {{- $_ := set (get $wl.podSpec.containers .) "primary" true -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- with (include "tc.v1.common.values.dependencies.primary" (dict "objects" $scope.service "kind" "service" "depName" $depName)) -}}
      {{- $_ := set (get $scope.service .) "primary" true -}}
    {{- end -}}

    {{/* Only the CIDRs of the chart context are available, which are the only ones used by the addons */}}
    {{- $chartContext := include "tc.v1.common.lib.util.chartcontext.cidrs" (dict "global" $mergedValues.global) | fromJson -}}

    {{- range $addonName, $addon := $enabledAddons -}}
      {{- $values := (dict "addons" (dict $addonName $addon) "chartContext" $chartContext) -}}
      {{- range $collName, $objects := $scope -}}
        {{- $_ := set $values $collName $objects -}}
      {{- end -}}

      {{/* [dependency] is set so addons do not set primaries */}}
      {{- include (get $templates $addonName) (dict "Values" $values "dependency" $depName) -}}

      {{/* Addons replace empty collections by new ones */}}
      {{- range $collName := (keys $scope) -}}
        {{- $_ := set $scope $collName (get $values $collName) -}}
      {{- end -}}
    {{- end -}}

    {{- range $collName, $objects := $scope -}}
      {{- if $objects -}}
        {{- $_ := set $collections $collName $objects -}}
        {{- $_ := set $dep $collName $objects -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
