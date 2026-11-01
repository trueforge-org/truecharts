{{/* Returns the name of the ValkeyCluster of the valkey dependency */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.valkey.operator.clusterName" (dict "rootCtx" $) }}
rootCtx: The root context of the chart.
*/}}
{{- define "tc.v1.common.lib.dependencies.valkey.operator.clusterName" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- printf "%s-valkey" (include "tc.v1.common.lib.chart.names.fullname" $rootCtx) -}}
{{- end -}}

{{/* Returns the details of the (headless) Service that the valkey-operator creates for a ValkeyCluster, as json */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.valkey.operator.service" (dict "rootCtx" $) | fromJson }}
rootCtx: The root context of the chart.

name: The name of the Service, the operator names it [valkey-<clusterName>] and it can not be changed.
port: The port of the Service, the operator always uses 6379.

This is the single source of the host and port of Valkey in operator mode.
The credentials, wait init container and notes all get them through [tc.v1.common.lib.dependencies.primaryService].
*/}}
{{- define "tc.v1.common.lib.dependencies.valkey.operator.service" -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $clusterName := include "tc.v1.common.lib.dependencies.valkey.operator.clusterName" (dict "rootCtx" $rootCtx) -}}
  {{- dict "name" (printf "valkey-%s" $clusterName) "port" "6379" | toJson -}}
{{- end -}}

{{/* Validates the operator settings of the valkey dependency */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.valkey.operator.validation" (dict "rootCtx" $rootCtx "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The [operator] settings of the valkey dependency.
*/}}
{{- define "tc.v1.common.lib.dependencies.valkey.operator.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $caller := "Valkey Operator" -}}

  {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" $caller) -}}

  {{- $validWorkloadTypes := (list "StatefulSet" "Deployment") -}}
  {{- $workloadType := $objectData.workloadType | default "StatefulSet" -}}
  {{- if not (mustHas $workloadType $validWorkloadTypes) -}}
    {{- fail (printf "%s - Expected [workloadType] to be one of [%s], but got [%v]" $caller (join ", " $validWorkloadTypes) $workloadType) -}}
  {{- end -}}

  {{- $shards := $objectData.shards -}}
  {{- if kindIs "invalid" $shards -}}
    {{- $shards = 1 -}}
  {{- end -}}
  {{- if not (regexMatch "^[1-9][0-9]*$" (toString $shards)) -}}
    {{- fail (printf "%s - Expected [shards] to be an integer greater than 0, but got [%v]" $caller $shards) -}}
  {{- end -}}

  {{- $replicas := $objectData.replicas -}}
  {{- if kindIs "invalid" $replicas -}}
    {{- $replicas = 0 -}}
  {{- end -}}
  {{- if not (regexMatch "^[0-9]+$" (toString $replicas)) -}}
    {{- fail (printf "%s - Expected [replicas] to be an integer greater than or equal to 0, but got [%v]" $caller $replicas) -}}
  {{- end -}}

  {{/* The operator rejects names that are too long, the limits are the ones of the CRD */}}
  {{- $clusterName := include "tc.v1.common.lib.dependencies.valkey.operator.clusterName" (dict "rootCtx" $rootCtx) -}}
  {{- $nodeSuffix := add (len (toString (sub ($shards | int64) 1))) (len (toString ($replicas | int64))) -}}
  {{- if eq $workloadType "StatefulSet" -}}
    {{- if gt (add (len $clusterName) $nodeSuffix) 43 -}}
      {{- fail (printf "%s - Expected the name [%s] of the ValkeyCluster, plus the digits of the highest shard and node index, to be at most 43 characters, but got [%v]. Use a shorter release name" $caller $clusterName (add (len $clusterName) $nodeSuffix)) -}}
    {{- end -}}
  {{- else -}}
    {{- if gt (len $clusterName) 56 -}}
      {{- fail (printf "%s - Expected the name [%s] of the ValkeyCluster to be at most 56 characters, but got [%v]. Use a shorter release name" $caller $clusterName (len $clusterName)) -}}
    {{- end -}}
    {{- if gt (add (len $clusterName) $nodeSuffix) 61 -}}
      {{- fail (printf "%s - Expected the name [%s] of the ValkeyCluster, plus the digits of the highest shard and node index, to be at most 61 characters, but got [%v]. Use a shorter release name" $caller $clusterName (add (len $clusterName) $nodeSuffix)) -}}
    {{- end -}}
  {{- end -}}

  {{- if hasKey $objectData "persistence" -}}
    {{- $persistence := $objectData.persistence -}}
    {{- if not (kindIs "map" $persistence) -}}
      {{- fail (printf "%s - Expected [persistence] to be a [map], but got [%s]" $caller (kindOf $persistence)) -}}
    {{- end -}}
    {{- if and $persistence.enabled (eq $workloadType "Deployment") -}}
      {{- fail (printf "%s - Expected [persistence.enabled] to be false when [workloadType] is [Deployment], persistence requires [StatefulSet]" $caller) -}}
    {{- end -}}
  {{- end -}}

  {{- if hasKey $objectData "podDisruptionBudget" -}}
    {{- $pdb := $objectData.podDisruptionBudget -}}
    {{- if not (kindIs "map" $pdb) -}}
      {{- fail (printf "%s - Expected [podDisruptionBudget] to be a [map], but got [%s]" $caller (kindOf $pdb)) -}}
    {{- end -}}
    {{- $validPdbModes := (list "Cluster" "Disabled") -}}
    {{- if and $pdb.mode (not (mustHas $pdb.mode $validPdbModes)) -}}
      {{- fail (printf "%s - Expected [podDisruptionBudget.mode] to be one of [%s], but got [%v]" $caller (join ", " $validPdbModes) $pdb.mode) -}}
    {{- end -}}
  {{- end -}}

  {{- if hasKey $objectData "networking" -}}
    {{- $networking := $objectData.networking -}}
    {{- if not (kindIs "map" $networking) -}}
      {{- fail (printf "%s - Expected [networking] to be a [map], but got [%s]" $caller (kindOf $networking)) -}}
    {{- end -}}
    {{/* The credentials, wait init container and notes do not speak TLS */}}
    {{- if hasKey $networking "tls" -}}
      {{- fail (printf "%s - [networking.tls] is not supported, the credentials and the wait init container connect without TLS" $caller) -}}
    {{- end -}}
    {{- with $networking.discovery -}}
      {{- $validEndpointTypes := (list "IP" "Hostname") -}}
      {{- if and .preferredEndpointType (not (mustHas .preferredEndpointType $validEndpointTypes)) -}}
        {{- fail (printf "%s - Expected [networking.discovery.preferredEndpointType] to be one of [%s], but got [%v]" $caller (join ", " $validEndpointTypes) .preferredEndpointType) -}}
      {{- end -}}
      {{- if and (eq .preferredEndpointType "Hostname") (ne $workloadType "StatefulSet") -}}
        {{- fail (printf "%s - Expected [workloadType] to be [StatefulSet] when [networking.discovery.preferredEndpointType] is [Hostname], but got [%v]" $caller $workloadType) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if and (hasKey $objectData "config") (not (kindIs "map" $objectData.config)) -}}
    {{- fail (printf "%s - Expected [config] to be a [map], but got [%s]" $caller (kindOf $objectData.config)) -}}
  {{- end -}}

  {{- if hasKey $objectData "users" -}}
    {{- if not (kindIs "slice" $objectData.users) -}}
      {{- fail (printf "%s - Expected [users] to be a [slice], but got [%s]" $caller (kindOf $objectData.users)) -}}
    {{- end -}}
    {{- $names := list -}}
    {{- range $user := $objectData.users -}}
      {{- if not (kindIs "map" $user) -}}
        {{- fail (printf "%s - Expected an item of [users] to be a [map], but got [%s]" $caller (kindOf $user)) -}}
      {{- end -}}
      {{- if not $user.name -}}
        {{- fail (printf "%s - Expected a non-empty [name] in every item of [users]" $caller) -}}
      {{- end -}}
      {{- if hasPrefix "_" $user.name -}}
        {{- fail (printf "%s - Expected the name of a user to not start with [_], as it is reserved for the operator, but got [%s]" $caller $user.name) -}}
      {{- end -}}
      {{- if mustHas $user.name $names -}}
        {{- fail (printf "%s - Expected the names of [users] to be unique, but [%s] is defined more than once" $caller $user.name) -}}
      {{- end -}}
      {{- $names = mustAppend $names $user.name -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
