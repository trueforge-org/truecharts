{{/* Call this template:
{{ include "tc.v1.common.lib.workload.components.strategyType" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}
rootCtx: The root context of the chart.
objectData:
  replicas: The number of replicas.
  strategy: The deployment strategy to use to replace existing pods with new ones.
*/}}
{{- define "tc.v1.common.lib.workload.components.strategyType" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $defaultStrategy := .defaultStrategy -}}
  {{- $resource := .resource -}}
  {{- $strategy := $objectData.strategy | default $defaultStrategy -}}

  {{- $replicas := 1 -}}
  {{- if hasKey $objectData "replicas" -}}
    {{- $replicas = $objectData.replicas -}}
  {{- end -}}
  {{- $replicas = $replicas | int -}}

  {{- $volsRWO := list -}}
  {{- $volsRWOP := list -}}
  {{- range $name, $persistence := $rootCtx.Values.persistence }}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                "rootCtx" $rootCtx "objectData" $persistence
                "name" $name "caller" "Volumes"
                "key" "persistence")) -}}

    {{- if (ne $enabled "true") -}}{{- continue -}}{{- end -}}

    {{/* A volume only limits the strategy of the workloads that mount it */}}
    {{- if not (include "tc.v1.common.lib.pod.volumes.isSelected" (dict "objectData" $objectData "persistence" $persistence)) -}}
      {{- continue -}}
    {{- end -}}

    {{- $type := ($persistence.type | default $rootCtx.Values.global.fallbackDefaults.persistenceType) -}}
    {{- $typesWithAccessMode := (list "pvc") -}}

    {{- if (mustHas $type $typesWithAccessMode) -}}
      {{- $modes := include "tc.v1.common.lib.pvc.accessModes" (dict "rootCtx" $rootCtx
          "objectData" $persistence "caller" "Volumes") | fromYamlArray
      -}}

      {{- if mustHas "ReadWriteOncePod" $modes -}}
        {{- $volsRWOP = mustAppend $volsRWOP $name -}}
      {{- else if eq (include "tc.v1.common.lib.pod.volumes.hasRWO" (dict "modes" $modes)) "true" -}}
        {{- $volsRWO = mustAppend $volsRWO $name -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* If there are any RWO vols, do some checks and add warnings */}}
  {{- $volsSingleAccess := concat $volsRWO $volsRWOP -}}
  {{- if gt (len $volsSingleAccess) 0 -}}
    {{/* RWO + replicas > 1 is a no-no */}}
    {{- if gt $replicas 1 -}}
      {{- include "add.warning" (dict "rootCtx" $rootCtx "warn" (printf
          "WARNING: The [accessModes] on volume(s) [%s] is set to [ReadWriteOnce] or [ReadWriteOncePod] with more than 1 replica. This is not stable" (join "," $volsSingleAccess)
        )) -}}
    {{/* DaemonSets and StatefulSets can have RWO with 1 replica under their supported strategies (OnDelete, RollingUpdate) */}}
    {{- else if and (eq $resource "Deployment") (ne $strategy "Recreate") -}}
      {{- $allowed := $rootCtx.Values.global.fallbackDefaults.allowRollingUpdateWithRWO -}}
      {{- if kindIs "bool" $objectData.allowRollingUpdateWithRWO -}}
        {{- $allowed = $objectData.allowRollingUpdateWithRWO -}}
      {{- end -}}

      {{/* A ReadWriteOncePod volume can't be used by the old and new pod at once, so this can never roll */}}
      {{- if $volsRWOP -}}
        {{- include "add.warning" (dict "rootCtx" $rootCtx "warn" (printf
          "WARNING: Volume(s) [%s] are set to [ReadWriteOncePod], which only allows one pod. Strategy [%s] of workload [%s] was changed to [Recreate]"
          (join "," $volsRWOP) $strategy $objectData.shortName
        )) -}}
        {{- $strategy = "Recreate" -}}
      {{- else if $allowed -}}
        {{- include "add.warning" (dict "rootCtx" $rootCtx "warn" (printf
          "WARNING: Workload [%s] uses strategy [%s] with [ReadWriteOnce] volume(s) [%s], because [allowRollingUpdateWithRWO] is set. Two pods use the same data during an update. The update gets stuck if the storage stays locked to the old pod, which can happen on the same node with storage like iSCSI"
          $objectData.shortName $strategy (join "," $volsRWO)
        )) -}}
      {{- else -}}
        {{- include "add.warning" (dict "rootCtx" $rootCtx "warn" (printf
          "WARNING: Strategy [%s] of workload [%s] was changed to [Recreate], because it has a single replica and [ReadWriteOnce] volume(s) [%s]. Set [allowRollingUpdateWithRWO] to keep it"
          $strategy $objectData.shortName (join "," $volsRWO)
        )) -}}
        {{- $strategy = "Recreate" -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Update strategy */}}
  {{- $_ := set $objectData "strategy" $strategy -}}
{{- end -}}
