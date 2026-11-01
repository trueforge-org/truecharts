{{/* Merges the enabled dependencies into the chart values, except the ones in operator mode */}}
{{/* Call this template:
{{ include "tc.v1.common.values.dependencies" (dict "rootCtx" $ "mergedValues" $mergedValues "commonValues" $commonValues) }}
rootCtx: The root context of the chart.
mergedValues: The merged values of the chart. Dependency objects are added to it, in place.
commonValues: The (untouched) default values of the common library. Used to classify keys and seed defaults.

A dependency is a complete chart values structure under [dependencies.$name].
Its objects are merged into the collections of the chart (workload, service, persistence, ...)
under the name [$name-$object], the same way a chart values.yaml would be.
The structure under [dependencies.$name] is normalized in place (defaults, primaries),
so templates like [.Values.dependencies.$name.service.main.ports.main.port] keep working.
*/}}
{{- define "tc.v1.common.values.dependencies" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $mergedValues := .mergedValues -}}
  {{- $commonValues := .commonValues -}}

  {{- $dependencies := $mergedValues.dependencies -}}
  {{- if kindIs "invalid" $dependencies -}}
    {{- $dependencies = dict -}}
  {{- end -}}

  {{- if not (kindIs "map" $dependencies) -}}
    {{- fail (printf "Dependencies - Expected [dependencies] to be a [map], but got [%s]" (kindOf $dependencies)) -}}
  {{- end -}}

  {{- range $depName, $depValues := $dependencies -}}
    {{- if not (kindIs "map" $depValues) -}}
      {{- fail (printf "Dependencies - Expected [dependencies.%s] to be a [map], but got [%s]" $depName (kindOf $depValues)) -}}
    {{- end -}}

    {{/* The name is used as a prefix of object names, so it must be a valid DNS label */}}
    {{- if not (regexMatch "^[a-z0-9]([a-z0-9-]*[a-z0-9])?$" $depName) -}}
      {{- fail (printf "Dependencies - Expected the name of dependency [%s] to be lowercase alphanumeric characters or [-], starting and ending with an alphanumeric character" $depName) -}}
    {{- end -}}

    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $rootCtx "objectData" $depValues
                    "name" $depName "caller" "Dependencies"
                    "key" "dependencies")) -}}

    {{/* Validates the mode, and makes the default explicit */}}
    {{- $mode := (include "tc.v1.common.lib.dependencies.mode" (dict "objectData" $depValues "depName" $depName)) -}}
    {{- $_ := set $depValues "mode" $mode -}}

    {{/* The dependencies in operator mode are provided by an operator, so their objects are not merged into the chart. They are still normalized, for the credentials, wait and notes */}}
    {{- if eq $enabled "true" -}}
      {{- include "tc.v1.common.values.dependencies.merge" (dict
            "rootCtx" $rootCtx "mergedValues" $mergedValues "commonValues" $commonValues
            "depName" $depName "depValues" $depValues "standalone" (eq $mode "standalone")) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Merges a single dependency into the chart values */}}
{{/* In operator mode ([standalone: false]) the dependency is only normalized in place, nothing is added to the chart */}}
{{- define "tc.v1.common.values.dependencies.merge" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $mergedValues := .mergedValues -}}
  {{- $commonValues := .commonValues -}}
  {{- $depName := .depName -}}
  {{- $dep := .depValues -}}
  {{- $standalone := .standalone -}}

  {{/* Keys that control the dependency itself and are never merged */}}
  {{/* The objects of the addons are added to the collections of the dependency instead */}}
  {{- $controlKeys := (list "enabled" "mode" "depconfig" "operator" "addons") -}}
  {{/* Release wide settings, the ones of the chart apply to the whole release */}}
  {{- $ignoredKeys := (list "global" "chartContext" "notes" "fallbackDefaults" "TZ" "namespace" "diagnosticMode" "containerOptions" "common") -}}
  {{/* Features that can not be scoped to a dependency */}}
  {{- $unsupportedKeys := (list "dependencies" "configMapsFromFolder" "extraTpl" "mariadb" "mongodb" "clickhouse" "solr" "ingressMiddlewares" "volumeClaimTemplates") -}}
  {{/* Defaults that are applied to the workloads of the dependency, instead of the whole release */}}
  {{- $scopedKeys := (list "securityContext" "podOptions" "resources") -}}
  {{/* Collections whose objects do not have an [enabled] key */}}
  {{- $noEnabledCollections := (list "credentials") -}}
  {{/* Collections with primary objects */}}
  {{- $primaryCollections := (list "workload" "service" "serviceAccount" "rbac" "ingress" "certificate" "gatewayClass" "gateway" "route" "networkpolicy" "metrics" "cnpg") -}}
  {{/* Objects that are explicitly set to primary, they are the primary objects of the release. Keyed by [$collection.$object] */}}
  {{- $releasePrimaries := dict -}}

  {{/* Classify the keys of the dependency */}}
  {{- $collections := dict -}}
  {{- $images := dict -}}
  {{- range $key, $value := $dep -}}
    {{- if or (has $key $controlKeys) (has $key $ignoredKeys) (has $key $scopedKeys) -}}
      {{- continue -}}
    {{- end -}}

    {{- if has $key $unsupportedKeys -}}
      {{- fail (printf "Dependencies - Key [%s] is not supported in dependency [%s]" $key $depName) -}}
    {{- end -}}

    {{- if eq $key "image" -}}
      {{- $_ := set $images $key (printf "%sImage" $depName) -}}
    {{- else if and (hasSuffix "Image" $key) (kindIs "map" $value) -}}
      {{- $_ := set $images $key (printf "%s%sImage" $depName (title (trimSuffix "Image" $key))) -}}
    {{- else if and (hasKey $commonValues $key) (kindIs "map" (get $commonValues $key)) -}}
      {{- if not (kindIs "map" $value) -}}
        {{- fail (printf "Dependencies - Expected [%s] in dependency [%s] to be a [map], but got [%s]" $key $depName (kindOf $value)) -}}
      {{- end -}}
      {{- $_ := set $collections $key $value -}}
    {{- end -}}
    {{/* Any other key is specific to the dependency and stays available under [.Values.dependencies.$name.$key] */}}
  {{- end -}}

  {{/* Images are stored on the root as [$nameImage], [$nameFooImage] */}}
  {{- range $key, $newKey := $images -}}
    {{- if not $standalone -}}{{- continue -}}{{- end -}}
    {{- if hasKey $mergedValues $newKey -}}
      {{- fail (printf "Dependencies - Image [%s] of dependency [%s] conflicts with the existing key [%s]" $key $depName $newKey) -}}
    {{- end -}}
    {{- $_ := set $mergedValues $newKey (mustDeepCopy (get $dep $key)) -}}
  {{- end -}}

  {{/* Objects inherit the defaults of common, the same way the objects of a chart do (eg [workload.main], [service.main]) */}}
  {{- range $collName, $objects := $collections -}}
    {{- $defaults := get $commonValues $collName -}}
    {{- range $objName, $obj := $objects -}}
      {{- if not (kindIs "map" $obj) -}}
        {{- fail (printf "Dependencies - Expected [%s.%s] in dependency [%s] to be a [map], but got [%s]" $collName $objName $depName (kindOf $obj)) -}}
      {{- end -}}

      {{- $default := get $defaults $objName -}}
      {{/* Objects targeting all pods (eg emptyDirs) are already applied to the dependency by the chart */}}
      {{- if and (kindIs "map" $default) (not $default.targetSelectAll) -}}
        {{/* Enabled, targets, primaries and dbWait are resolved within the dependency */}}
        {{- $obj = mustMergeOverwrite (mustDeepCopy (omit $default "enabled" "targetSelector" "primary" "dbWait")) $obj -}}
        {{- $_ := set $objects $objName $obj -}}
      {{- end -}}

      {{- if and (not (has $collName $noEnabledCollections)) (not (hasKey $obj "enabled")) -}}
        {{- $_ := set $obj "enabled" true -}}
      {{- end -}}

      {{/* Must be recorded before the primaries are resolved, as that marks objects as primary too */}}
      {{- if and (hasKey $obj "primary") (kindIs "bool" $obj.primary) $obj.primary -}}
        {{- $_ := set $releasePrimaries (printf "%s.%s" $collName $objName) true -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Addons add containers and objects to the dependency, so they are applied after the defaults and before the primaries are resolved */}}
  {{/* They are not applied in operator mode, as the workloads of the dependency are not deployed */}}
  {{- if $standalone -}}
    {{- include "tc.v1.common.values.dependencies.addons" (dict
          "rootCtx" $rootCtx "mergedValues" $mergedValues "commonValues" $commonValues
          "depName" $depName "dep" $dep "collections" $collections) -}}
  {{- end -}}

  {{/* Scoped defaults */}}
  {{- $depSecurityContext := dict -}}
  {{- if kindIs "map" $dep.securityContext -}}
    {{- $depSecurityContext = $dep.securityContext -}}
  {{- end -}}
  {{- $depPodOptions := dict -}}
  {{- if kindIs "map" $dep.podOptions -}}
    {{- $depPodOptions = (omit $dep.podOptions "defaultAffinity" "defaultSpread") -}}
  {{- end -}}
  {{- $depResources := dict -}}
  {{- if kindIs "map" $dep.resources -}}
    {{- $depResources = $dep.resources -}}
  {{- end -}}

  {{- $hasMainPort := false -}}
  {{- if kindIs "map" $collections.service -}}
    {{- with (get $collections.service "main") -}}
      {{- if kindIs "map" .ports -}}
        {{- if kindIs "map" (get .ports "main") -}}
          {{- $hasMainPort = true -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- range $wlName, $wl := ($collections.workload | default dict) -}}
    {{- if not (kindIs "map" $wl.podSpec) -}}
      {{- $_ := set $wl "podSpec" dict -}}
    {{- end -}}
    {{- $podSpec := $wl.podSpec -}}

    {{/* Dependencies do not wait for the databases of the chart */}}
    {{- if not (hasKey $wl "dbWait") -}}
      {{- $_ := set $wl "dbWait" false -}}
    {{- end -}}

    {{- if kindIs "map" $depSecurityContext.pod -}}
      {{- $_ := set $podSpec "securityContext" (mustMergeOverwrite (mustDeepCopy $depSecurityContext.pod) ($podSpec.securityContext | default dict)) -}}
    {{- end -}}

    {{- range $optName, $optValue := $depPodOptions -}}
      {{- if and (not (hasKey $podSpec $optName)) (not (kindIs "invalid" $optValue)) -}}
        {{- $_ := set $podSpec $optName (mustDeepCopy $optValue) -}}
      {{- end -}}
    {{- end -}}

    {{- range $kind := (list "containers" "initContainers") -}}
      {{- $containers := get $podSpec $kind -}}
      {{- if kindIs "map" $containers -}}
        {{- range $cName, $c := $containers -}}
          {{- if not (kindIs "map" $c) -}}
            {{- fail (printf "Dependencies - Expected [workload.%s.podSpec.%s.%s] in dependency [%s] to be a [map], but got [%s]" $wlName $kind $cName $depName (kindOf $c)) -}}
          {{- end -}}

          {{- if not (hasKey $c "enabled") -}}
            {{- $_ := set $c "enabled" true -}}
          {{- end -}}

          {{- if kindIs "map" $depSecurityContext.container -}}
            {{- $_ := set $c "securityContext" (mustMergeOverwrite (mustDeepCopy $depSecurityContext.container) ($c.securityContext | default dict)) -}}
          {{- end -}}

          {{- if $depResources -}}
            {{- $_ := set $c "resources" (mustMergeOverwrite (mustDeepCopy $depResources) ($c.resources | default dict)) -}}
          {{- end -}}

          {{/* The default probes of common point to [service.main.ports.main] of the chart, point them to the dependency instead */}}
          {{- if kindIs "map" $c.probes -}}
            {{- range $probeName, $probe := $c.probes -}}
              {{- if kindIs "map" $probe -}}
                {{- range $probeKey := (list "type" "port") -}}
                  {{- $probeValue := get $probe $probeKey -}}
                  {{- if and (kindIs "string" $probeValue) (contains ".Values.service.main.ports.main" $probeValue) -}}
                    {{- if $hasMainPort -}}
                      {{- $_ := set $probe $probeKey (replace ".Values.service.main.ports.main" (printf ".Values.dependencies.%s.service.main.ports.main" $depName) $probeValue) -}}
                    {{- else -}}
                      {{/* Without a port to point to, the default probes are disabled */}}
                      {{- $_ := unset $probe $probeKey -}}
                      {{- $_ := set $probe "enabled" false -}}
                    {{- end -}}
                  {{- end -}}
                {{- end -}}
              {{- end -}}
            {{- end -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Resolve the primary objects of the dependency, they are the default targets of its other objects */}}
  {{- range $svcName, $svc := ($collections.service | default dict) -}}
    {{- if kindIs "map" $svc.ports -}}
      {{- range $portName, $port := $svc.ports -}}
        {{- if not (kindIs "map" $port) -}}
          {{- fail (printf "Dependencies - Expected [service.%s.ports.%s] in dependency [%s] to be a [map], but got [%s]" $svcName $portName $depName (kindOf $port)) -}}
        {{- end -}}
        {{/* Ports of a dependency default to enabled, the same as its containers */}}
        {{- if not (hasKey $port "enabled") -}}
          {{- $_ := set $port "enabled" true -}}
        {{- end -}}
      {{- end -}}

      {{- with (include "tc.v1.common.values.dependencies.primary" (dict "objects" $svc.ports "kind" "port" "depName" $depName)) -}}
        {{- $_ := set (get $svc.ports .) "primary" true -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- $primaryWorkload := (include "tc.v1.common.values.dependencies.primary" (dict "objects" $collections.workload "kind" "workload" "depName" $depName)) -}}
  {{- $primaryService := (include "tc.v1.common.values.dependencies.primary" (dict "objects" $collections.service "kind" "service" "depName" $depName)) -}}
  {{- $primaryServiceAccount := (include "tc.v1.common.values.dependencies.primary" (dict "objects" $collections.serviceAccount "kind" "serviceAccount" "depName" $depName)) -}}
  {{- $primaryContainer := "" -}}
  {{- $primaryPort := "" -}}

  {{/* Every workload needs a primary container */}}
  {{- range $wlName, $wl := ($collections.workload | default dict) -}}
    {{- $container := (include "tc.v1.common.values.dependencies.primary" (dict "objects" $wl.podSpec.containers "kind" "container" "depName" $depName)) -}}
    {{- if $container -}}
      {{- $_ := set (get $wl.podSpec.containers $container) "primary" true -}}
    {{- end -}}
    {{- if eq $wlName $primaryWorkload -}}
      {{- $_ := set $wl "primary" true -}}
      {{- $primaryContainer = $container -}}
    {{- end -}}
  {{- end -}}

  {{- if $primaryService -}}
    {{- $svc := get $collections.service $primaryService -}}
    {{- $_ := set $svc "primary" true -}}
    {{- $primaryPort = (include "tc.v1.common.values.dependencies.primary" (dict "objects" $svc.ports "kind" "port" "depName" $depName)) -}}
    {{- if $primaryPort -}}
      {{- $_ := set (get $svc.ports $primaryPort) "primary" true -}}
    {{- end -}}
  {{- end -}}

  {{- if $primaryServiceAccount -}}
    {{- $_ := set (get $collections.serviceAccount $primaryServiceAccount) "primary" true -}}
  {{- end -}}

  {{/* Add prefixed copies of the objects to the collections of the chart */}}
  {{- range $collName, $objects := $collections -}}
    {{- if not $standalone -}}{{- continue -}}{{- end -}}
    {{- if not (kindIs "map" (get $mergedValues $collName)) -}}
      {{- $_ := set $mergedValues $collName dict -}}
    {{- end -}}
    {{- $target := get $mergedValues $collName -}}

    {{- range $objName, $obj := $objects -}}
      {{- $newName := printf "%s-%s" $depName $objName -}}
      {{- if hasKey $target $newName -}}
        {{- fail (printf "Dependencies - Object [%s.%s] of dependency [%s] conflicts with the existing object [%s.%s]" $collName $objName $depName $collName $newName) -}}
      {{- end -}}

      {{- $copy := mustDeepCopy $obj -}}

      {{/* Mark the object as part of the dependency, validations and primary lookups skip marked objects that are not primary */}}
      {{- $_ := set $copy "dependency" $depName -}}

      {{/* Objects of a dependency are only the primary objects of the release, when they explicitly set [primary: true] */}}
      {{- if or (has $collName $primaryCollections) (hasKey $copy "primary") -}}
        {{- $_ := set $copy "primary" (hasKey $releasePrimaries (printf "%s.%s" $collName $objName)) -}}
      {{- end -}}

      {{- include "tc.v1.common.values.dependencies.rewrite" (dict
            "depName" $depName "collName" $collName "objName" $objName "object" $copy
            "collections" $collections "images" $images
            "primaryWorkload" $primaryWorkload "primaryContainer" $primaryContainer
            "primaryService" $primaryService "primaryPort" $primaryPort
            "primaryServiceAccount" $primaryServiceAccount) -}}

      {{- $_ := set $target $newName $copy -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Returns the name of the primary object of a collection within a dependency */}}
{{/* Explicit [primary], else the only object, else [main] */}}
{{- define "tc.v1.common.values.dependencies.primary" -}}
  {{- $objects := .objects -}}
  {{- $kind := .kind -}}
  {{- $depName := .depName -}}

  {{- $candidates := list -}}
  {{- $primaries := list -}}
  {{- if kindIs "map" $objects -}}
    {{- range $name, $obj := $objects -}}
      {{- if not (kindIs "map" $obj) -}}
        {{- continue -}}
      {{- end -}}
      {{- if and (kindIs "bool" $obj.enabled) (not $obj.enabled) -}}
        {{- continue -}}
      {{- end -}}
      {{- $candidates = append $candidates $name -}}
      {{- if and (hasKey $obj "primary") $obj.primary -}}
        {{- $primaries = append $primaries $name -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if gt (len $primaries) 1 -}}
    {{- fail (printf "Dependencies - Expected at most one primary %s in dependency [%s], but got [%s]" $kind $depName (join ", " $primaries)) -}}
  {{- end -}}

  {{- if eq (len $primaries) 1 -}}
    {{- first $primaries -}}
  {{- else if eq (len $candidates) 1 -}}
    {{- first $candidates -}}
  {{- else if has "main" $candidates -}}
    {{- print "main" -}}
  {{- end -}}
{{- end -}}

{{/* Returns the prefixed name, if the dependency defines the referenced object. Otherwise the name as is. */}}
{{- define "tc.v1.common.values.dependencies.ref" -}}
  {{- $collections := .collections -}}
  {{- $depName := .depName -}}
  {{- $coll := .coll -}}
  {{- $name := .name -}}

  {{- $result := $name -}}
  {{- if kindIs "string" $name -}}
    {{- $objects := get $collections $coll -}}
    {{- if and (kindIs "map" $objects) (hasKey $objects $name) -}}
      {{- $result = printf "%s-%s" $depName $name -}}
    {{- end -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}

{{/* Prefixes a reference to a configmap/secret, unless its name is not expanded */}}
{{- define "tc.v1.common.values.dependencies.objectRef" -}}
  {{- $ref := .ref -}}
  {{- $key := .key | default "name" -}}

  {{- $expand := true -}}
  {{- if and (hasKey $ref "expandObjectName") (kindIs "bool" $ref.expandObjectName) -}}
    {{- $expand = $ref.expandObjectName -}}
  {{- end -}}

  {{- $name := get $ref $key -}}
  {{- if and $expand (kindIs "string" $name) (not (contains "{{" $name)) -}}
    {{- $_ := set $ref $key (include "tc.v1.common.values.dependencies.ref" (dict "collections" .collections "depName" .depName "coll" .coll "name" $name)) -}}
  {{- end -}}
{{- end -}}

{{/* Returns the list of all workloads of the dependency, prefixed */}}
{{- define "tc.v1.common.values.dependencies.allWorkloads" -}}
  {{- $depName := .depName -}}
  {{- $workloads := list -}}
  {{- range $wlName, $wl := (.collections.workload | default dict) -}}
    {{- $workloads = append $workloads (printf "%s-%s" $depName $wlName) -}}
  {{- end -}}
  {{- $workloads | toJson -}}
{{- end -}}

{{/* Rewrites the references of an object to the (prefixed) objects of the dependency and sets its default targets */}}
{{- define "tc.v1.common.values.dependencies.rewrite" -}}
  {{- $depName := .depName -}}
  {{- $collName := .collName -}}
  {{- $obj := .object -}}
  {{- $collections := .collections -}}
  {{- $images := .images -}}
  {{- $location := printf "%s.%s" $collName .objName -}}
  {{- $refCtx := (dict "collections" $collections "depName" $depName) -}}

  {{- $defaultWorkload := "" -}}
  {{- if .primaryWorkload -}}
    {{- $defaultWorkload = printf "%s-%s" $depName .primaryWorkload -}}
  {{- end -}}
  {{- $defaultService := "" -}}
  {{- if .primaryService -}}
    {{- $defaultService = printf "%s-%s" $depName .primaryService -}}
  {{- end -}}
  {{- $defaultServiceAccount := "" -}}
  {{- if .primaryServiceAccount -}}
    {{- $defaultServiceAccount = printf "%s-%s" $depName .primaryServiceAccount -}}
  {{- end -}}
  {{- $primaryContainer := .primaryContainer -}}
  {{- $primaryPort := .primaryPort -}}

  {{- if eq $collName "workload" -}}
    {{- range $kind := (list "containers" "initContainers") -}}
      {{- $containers := get $obj.podSpec $kind -}}
      {{- if kindIs "map" $containers -}}
        {{- range $cName, $c := $containers -}}
          {{/* Images of the dependency are renamed on the root */}}
          {{- $selector := $c.imageSelector | default "image" -}}
          {{- if hasKey $images $selector -}}
            {{- $_ := set $c "imageSelector" (get $images $selector) -}}
          {{- else if eq $selector "image" -}}
            {{/* A dependency never falls back to the main image of the chart */}}
            {{- fail (printf "Dependencies - Expected [image] to be defined in dependency [%s], as [%s.podSpec.%s.%s] uses it as [imageSelector]" $depName $location $kind $cName) -}}
          {{- end -}}

          {{/* References to configmaps/secrets of the dependency */}}
          {{- if kindIs "map" $c.env -}}
            {{- range $envName, $envValue := $c.env -}}
              {{- if kindIs "map" $envValue -}}
                {{- range $refKey := (list "configMapKeyRef" "secretKeyRef") -}}
                  {{- $ref := get $envValue $refKey -}}
                  {{- if kindIs "map" $ref -}}
                    {{- $refColl := ternary "secret" "configmap" (eq $refKey "secretKeyRef") -}}
                    {{- include "tc.v1.common.values.dependencies.objectRef" (merge (dict "ref" $ref "coll" $refColl) $refCtx) -}}
                  {{- end -}}
                {{- end -}}
              {{- end -}}
            {{- end -}}
          {{- end -}}

          {{- if kindIs "slice" $c.envFrom -}}
            {{- range $envFrom := $c.envFrom -}}
              {{- if kindIs "map" $envFrom -}}
                {{- range $refKey := (list "configMapRef" "secretRef") -}}
                  {{- $ref := get $envFrom $refKey -}}
                  {{- if kindIs "map" $ref -}}
                    {{- $refColl := ternary "secret" "configmap" (eq $refKey "secretRef") -}}
                    {{- include "tc.v1.common.values.dependencies.objectRef" (merge (dict "ref" $ref "coll" $refColl) $refCtx) -}}
                  {{- end -}}
                {{- end -}}
              {{- end -}}
            {{- end -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "service" -}}
    {{/* Ports target containers, which are not prefixed */}}
    {{- if kindIs "string" $obj.targetSelector -}}
      {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "workload" "name" $obj.targetSelector) $refCtx)) -}}
    {{- else if not (hasKey $obj "targetSelector") -}}
      {{- if $defaultWorkload -}}
        {{- $_ := set $obj "targetSelector" $defaultWorkload -}}
      {{- else if $collections.workload -}}
        {{- fail (printf "Dependencies - Expected [targetSelector] on [%s] in dependency [%s], as no primary workload could be determined" $location $depName) -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "persistence" -}}
    {{- if not $obj.targetSelectAll -}}
      {{- if kindIs "map" $obj.targetSelector -}}
        {{- $newSelector := dict -}}
        {{- range $wlName, $containers := $obj.targetSelector -}}
          {{- $_ := set $newSelector (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "workload" "name" $wlName) $refCtx)) $containers -}}
        {{- end -}}
        {{- $_ := set $obj "targetSelector" $newSelector -}}
      {{- else if not (hasKey $obj "targetSelector") -}}
        {{- if and $defaultWorkload $primaryContainer -}}
          {{- $_ := set $obj "targetSelector" (dict $defaultWorkload (dict $primaryContainer dict)) -}}
        {{- else -}}
          {{- fail (printf "Dependencies - Expected [targetSelector] or [targetSelectAll] on [%s] in dependency [%s], as no primary workload and container could be determined" $location $depName) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- if has $obj.type (list "configmap" "secret") -}}
      {{- include "tc.v1.common.values.dependencies.objectRef" (merge (dict "ref" $obj "coll" $obj.type "key" "objectName") $refCtx) -}}
    {{- end -}}

    {{- if kindIs "slice" $obj.volsync -}}
      {{- range $volsync := $obj.volsync -}}
        {{- if and (kindIs "map" $volsync) (kindIs "string" $volsync.credentials) -}}
          {{- $_ := set $volsync "credentials" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "credentials" "name" $volsync.credentials) $refCtx)) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if has $collName (list "serviceAccount" "imagePullSecret") -}}
    {{- if not $obj.targetSelectAll -}}
      {{- if kindIs "slice" $obj.targetSelector -}}
        {{- $newSelector := list -}}
        {{- range $wlName := $obj.targetSelector -}}
          {{- $newSelector = append $newSelector (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "workload" "name" $wlName) $refCtx)) -}}
        {{- end -}}
        {{- $_ := set $obj "targetSelector" $newSelector -}}
      {{- else if not (hasKey $obj "targetSelector") -}}
        {{- if $defaultWorkload -}}
          {{- $_ := set $obj "targetSelector" (list $defaultWorkload) -}}
        {{- else -}}
          {{- fail (printf "Dependencies - Expected [targetSelector] or [targetSelectAll] on [%s] in dependency [%s], as no primary workload could be determined" $location $depName) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "rbac" -}}
    {{- if not $obj.allServiceAccounts -}}
      {{- if kindIs "slice" $obj.serviceAccounts -}}
        {{- $newSelector := list -}}
        {{- range $saName := $obj.serviceAccounts -}}
          {{- $newSelector = append $newSelector (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "serviceAccount" "name" $saName) $refCtx)) -}}
        {{- end -}}
        {{- $_ := set $obj "serviceAccounts" $newSelector -}}
      {{- else if not (hasKey $obj "serviceAccounts") -}}
        {{- if $defaultServiceAccount -}}
          {{- $_ := set $obj "serviceAccounts" (list $defaultServiceAccount) -}}
        {{- else -}}
          {{- fail (printf "Dependencies - Expected [serviceAccounts] or [allServiceAccounts] on [%s] in dependency [%s], as no primary serviceAccount could be determined" $location $depName) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "ingress" -}}
    {{- if kindIs "map" $obj.targetSelector -}}
      {{- $newSelector := dict -}}
      {{- range $svcName, $port := $obj.targetSelector -}}
        {{- $_ := set $newSelector (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "service" "name" $svcName) $refCtx)) $port -}}
      {{- end -}}
      {{- $_ := set $obj "targetSelector" $newSelector -}}
    {{- else if not (hasKey $obj "targetSelector") -}}
      {{- if and $defaultService $primaryPort -}}
        {{- $_ := set $obj "targetSelector" (dict $defaultService $primaryPort) -}}
      {{- else -}}
        {{- fail (printf "Dependencies - Expected [targetSelector] on [%s] in dependency [%s], as no primary service and port could be determined" $location $depName) -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "route" -}}
    {{- if kindIs "string" $obj.listenerSet -}}
      {{- $_ := set $obj "listenerSet" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "listenerSet" "name" $obj.listenerSet) $refCtx)) -}}
    {{- end -}}

    {{- if kindIs "string" $obj.targetSelector -}}
      {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "gateway" "name" $obj.targetSelector) $refCtx)) -}}
    {{- end -}}

    {{- if kindIs "slice" $obj.parentRefs -}}
      {{- range $parentRef := $obj.parentRefs -}}
        {{- if and (kindIs "map" $parentRef) (kindIs "string" $parentRef.targetSelector) -}}
          {{- $_ := set $parentRef "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "gateway" "name" $parentRef.targetSelector) $refCtx)) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{/* Backends default to the primary service of the dependency, instead of the primary service of the release */}}
    {{- $noPrimaryService := printf "Dependencies - Expected a [targetSelector] or [name] on the backendRefs of [%s] in dependency [%s], as no primary service could be determined" $location $depName -}}
    {{- if not $obj.rules -}}
      {{- if not $defaultService -}}
        {{- fail $noPrimaryService -}}
      {{- end -}}
      {{- $_ := set $obj "rules" (list (dict "backendRefs" (list (dict "targetSelector" $defaultService)))) -}}
    {{- else -}}
      {{- range $rule := $obj.rules -}}
        {{- if not (kindIs "map" $rule) -}}
          {{- continue -}}
        {{- end -}}
        {{- if and (not $rule.backendRefs) (not $rule.filters) -}}
          {{- if not $defaultService -}}
            {{- fail $noPrimaryService -}}
          {{- end -}}
          {{- $_ := set $rule "backendRefs" (list (dict "targetSelector" $defaultService)) -}}
        {{- else if kindIs "slice" $rule.backendRefs -}}
          {{- range $backend := $rule.backendRefs -}}
            {{- if not (kindIs "map" $backend) -}}
              {{- continue -}}
            {{- end -}}
            {{- if kindIs "string" $backend.targetSelector -}}
              {{- $_ := set $backend "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "service" "name" $backend.targetSelector) $refCtx)) -}}
            {{- else if not $backend.name -}}
              {{- if not $defaultService -}}
                {{- fail $noPrimaryService -}}
              {{- end -}}
              {{- $_ := set $backend "targetSelector" $defaultService -}}
            {{- end -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "listenerSet" -}}
    {{- if kindIs "string" $obj.targetSelector -}}
      {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "gateway" "name" $obj.targetSelector) $refCtx)) -}}
    {{- end -}}

  {{- else if eq $collName "gateway" -}}
    {{- if kindIs "string" $obj.targetSelector -}}
      {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "gatewayClass" "name" $obj.targetSelector) $refCtx)) -}}
    {{- end -}}

  {{- else if has $collName (list "hpa" "vpa") -}}
    {{- if and (kindIs "slice" $obj.targetSelector) (gt (len $obj.targetSelector) 0) -}}
      {{- $newSelector := list -}}
      {{- range $wlName := $obj.targetSelector -}}
        {{- $newSelector = append $newSelector (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "workload" "name" $wlName) $refCtx)) -}}
      {{- end -}}
      {{- $_ := set $obj "targetSelector" $newSelector -}}
    {{- else if or (not (hasKey $obj "targetSelector")) (kindIs "slice" $obj.targetSelector) -}}
      {{/* Without a selector, all workloads of the dependency are targeted, instead of all workloads of the release */}}
      {{- $allWorkloads := (include "tc.v1.common.values.dependencies.allWorkloads" $refCtx | fromJsonArray) -}}
      {{- if not $allWorkloads -}}
        {{- fail (printf "Dependencies - Expected [targetSelector] on [%s] in dependency [%s], as the dependency has no workloads" $location $depName) -}}
      {{- end -}}
      {{- $_ := set $obj "targetSelector" $allWorkloads -}}
    {{- end -}}

  {{- else if eq $collName "podDisruptionBudget" -}}
    {{- if not $obj.customLabels -}}
      {{- if kindIs "string" $obj.targetSelector -}}
        {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "workload" "name" $obj.targetSelector) $refCtx)) -}}
      {{- else if not (hasKey $obj "targetSelector") -}}
        {{- if $defaultWorkload -}}
          {{- $_ := set $obj "targetSelector" $defaultWorkload -}}
        {{- else -}}
          {{- fail (printf "Dependencies - Expected [targetSelector] or [customLabels] on [%s] in dependency [%s], as no primary workload could be determined" $location $depName) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "networkpolicy" -}}
    {{- if not (or $obj.podSelector $obj.targetAllPods) -}}
      {{- if kindIs "string" $obj.targetSelector -}}
        {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "workload" "name" $obj.targetSelector) $refCtx)) -}}
      {{- else if not (hasKey $obj "targetSelector") -}}
        {{- if $defaultWorkload -}}
          {{- $_ := set $obj "targetSelector" $defaultWorkload -}}
        {{- else -}}
          {{- fail (printf "Dependencies - Expected [targetSelector], [podSelector] or [targetAllPods] on [%s] in dependency [%s], as no primary workload could be determined" $location $depName) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "metrics" -}}
    {{- if not $obj.selector -}}
      {{- $refColl := "service" -}}
      {{- $default := $defaultService -}}
      {{- if eq ($obj.type | default "") "podmonitor" -}}
        {{- $refColl = "workload" -}}
        {{- $default = $defaultWorkload -}}
      {{- end -}}

      {{- if kindIs "string" $obj.targetSelector -}}
        {{- $_ := set $obj "targetSelector" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" $refColl "name" $obj.targetSelector) $refCtx)) -}}
      {{- else if not (hasKey $obj "targetSelector") -}}
        {{- if $default -}}
          {{- $_ := set $obj "targetSelector" $default -}}
        {{- else -}}
          {{- fail (printf "Dependencies - Expected [targetSelector] or [selector] on [%s] in dependency [%s], as no primary %s could be determined" $location $depName $refColl) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

  {{- else if eq $collName "cnpg" -}}
    {{- range $section := (list "backups" "recovery") -}}
      {{- $data := get $obj $section -}}
      {{- if and (kindIs "map" $data) (kindIs "string" $data.credentials) -}}
        {{- $_ := set $data "credentials" (include "tc.v1.common.values.dependencies.ref" (merge (dict "coll" "credentials" "name" $data.credentials) $refCtx)) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
