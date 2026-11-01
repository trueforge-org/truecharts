{{/* ValkeyCluster Class (valkey-operator) */}}
{{/* Call this template:
{{ include "tc.v1.common.class.valkey.cluster" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData:
  name: The name of the ValkeyCluster.
  shortName: The name of the dependency (valkey).
  image: The image of the Valkey nodes.
  shards: The number of shards (primaries).
  replicas: The number of replicas per shard.
  workloadType: The workload of every node (StatefulSet or Deployment).
  config: The valkey.conf directives.
  resources: The resources of the Valkey containers.
  persistence: The (optional) persistence of the nodes.
  exporter: The metrics exporter sidecar.
  users: The (additional) users of the cluster. The default user is always managed.
  labels: Additional labels of the ValkeyCluster.
  annotations: Additional annotations of the ValkeyCluster.
  Anything else (scheduling, containers, ...) is passed to the spec as is, see the docs for the full list.
*/}}
{{- define "tc.v1.common.class.valkey.cluster" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" "Valkey Operator") -}}

  {{/* Metadata */}}
  {{- $labels := mustMerge (mustDeepCopy ($objectData.labels | default dict)) (include "tc.v1.common.lib.metadata.allLabels" $rootCtx | fromYaml) -}}
  {{- $annotations := mustMerge (mustDeepCopy ($objectData.annotations | default dict)) (include "tc.v1.common.lib.metadata.allAnnotations" $rootCtx | fromYaml) -}}

  {{/* Spec */}}
  {{- $spec := dict "image" $objectData.image -}}
  {{- $_ := set $spec "shards" (int64 ($objectData.shards | default 1)) -}}
  {{- $_ := set $spec "replicas" (int64 ($objectData.replicas | default 0)) -}}
  {{- $_ := set $spec "workloadType" ($objectData.workloadType | default "StatefulSet") -}}

  {{/* Keys that are passed to the spec as they are */}}
  {{- range $key := (list "scheduling" "containers" "serviceAccountName" "terminationGracePeriodSeconds" "podDisruptionBudget") -}}
    {{- with (get $objectData $key) -}}
      {{- $_ := set $spec $key . -}}
    {{- end -}}
  {{- end -}}

  {{/* Only labels and annotations that are set, so an empty podMetadata is not rendered */}}
  {{- $podMetadata := dict -}}
  {{- range $key := (list "labels" "annotations") -}}
    {{- with (get ($objectData.podMetadata | default dict) $key) -}}
      {{- $_ := set $podMetadata $key . -}}
    {{- end -}}
  {{- end -}}
  {{- with $podMetadata -}}
    {{- $_ := set $spec "podMetadata" . -}}
  {{- end -}}

  {{/* Secrets are referenced by name only */}}
  {{- $pullSecrets := list -}}
  {{- range $secret := ($objectData.imagePullSecrets | default list) -}}
    {{- if kindIs "map" $secret -}}
      {{- $pullSecrets = mustAppend $pullSecrets $secret -}}
    {{- else -}}
      {{- $pullSecrets = mustAppend $pullSecrets (dict "name" $secret) -}}
    {{- end -}}
  {{- end -}}
  {{- with $pullSecrets -}}
    {{- $_ := set $spec "imagePullSecrets" . -}}
  {{- end -}}

  {{/* Resources, the same way as the other containers of the chart (excluding the extra resources) */}}
  {{- if not (kindIs "map" $objectData.resources) -}}
    {{- $_ := set $objectData "resources" dict -}}
  {{- end -}}
  {{- $_ := set $objectData.resources "excludeExtra" true -}}
  {{- $_ := set $spec "resources" (include "tc.v1.common.lib.container.resources" (dict "rootCtx" $rootCtx "objectData" $objectData) | fromYaml) -}}

  {{/* Config values are strings, booleans are written the way that Valkey expects */}}
  {{- if $objectData.config -}}
    {{- $config := dict -}}
    {{- range $key, $value := $objectData.config -}}
      {{- if kindIs "bool" $value -}}
        {{- $value = ternary "yes" "no" $value -}}
      {{- end -}}
      {{- $_ := set $config $key (tpl (toString $value) $rootCtx) -}}
    {{- end -}}
    {{- $_ := set $spec "config" $config -}}
  {{- end -}}

  {{/* Persistence */}}
  {{- $persistence := $objectData.persistence | default dict -}}
  {{- if $persistence.enabled -}}
    {{- $retain := $rootCtx.Values.global.fallbackDefaults.pvcRetain -}}
    {{- if kindIs "bool" $persistence.retain -}}
      {{- $retain = $persistence.retain -}}
    {{- end -}}
    {{- $specPersistence := dict
          "size" ($persistence.size | default $rootCtx.Values.global.fallbackDefaults.vctSize)
          "reclaimPolicy" (ternary "Retain" "Delete" (eq (toString $retain) "true")) -}}
    {{/* "-" requests a volume without a class, which the operator can not express, so the default class applies */}}
    {{- $storageClass := include "tc.v1.common.lib.storage.storageClassName" (dict "rootCtx" $rootCtx "objectData" $persistence) -}}
    {{- if and $storageClass (ne $storageClass "\"\"") -}}
      {{- $_ := set $specPersistence "storageClassName" $storageClass -}}
    {{- end -}}
    {{- $_ := set $spec "persistence" $specPersistence -}}
  {{- end -}}

  {{/* Exporter */}}
  {{- $objExporter := $objectData.exporter | default dict -}}
  {{- $exporter := dict -}}
  {{- range $key := (list "image" "args" "resources" "securityContext") -}}
    {{- with (get $objExporter $key) -}}
      {{- $_ := set $exporter $key . -}}
    {{- end -}}
  {{- end -}}
  {{- if kindIs "bool" $objExporter.enabled -}}
    {{- $_ := set $exporter "enabled" $objExporter.enabled -}}
  {{- end -}}
  {{- with $exporter -}}
    {{- $_ := set $spec "exporter" . -}}
  {{- end -}}

  {{/* Networking, TLS is not supported */}}
  {{- $objNetworking := $objectData.networking | default dict -}}
  {{- $networking := dict -}}
  {{- with $objNetworking.clusterDomain -}}
    {{- $_ := set $networking "clusterDomain" . -}}
  {{- end -}}
  {{- with $objNetworking.discovery -}}
    {{- if .preferredEndpointType -}}
      {{- $_ := set $networking "discovery" (dict "preferredEndpointType" .preferredEndpointType) -}}
    {{- end -}}
  {{- end -}}
  {{- with $networking -}}
    {{- $_ := set $spec "networking" . -}}
  {{- end -}}

  {{/* The pods run with the security context of the chart, the operator sets none and the volumes would not be writable */}}
  {{- $containerSecCtx := $rootCtx.Values.securityContext.container -}}
  {{- $podSecCtx := $rootCtx.Values.securityContext.pod -}}
  {{- $podSecurityContext := dict
        "runAsNonRoot" true
        "runAsUser" $containerSecCtx.runAsUser
        "runAsGroup" $containerSecCtx.runAsGroup
        "fsGroup" $podSecCtx.fsGroup
        "fsGroupChangePolicy" $podSecCtx.fsGroupChangePolicy -}}
  {{- $_ := set $spec "podSecurityContext" (mustMergeOverwrite $podSecurityContext ($objectData.podSecurityContext | default dict)) -}}

  {{/* Users, the default user is the one of the credentials of the dependency and is always managed */}}
  {{- $defaultUser := dict
        "name" "default"
        "passwordSecret" (dict "name" (printf "%s-valkeycreds" $rootCtx.Release.Name) "keys" (list "valkey-password"))
        "permissions" "+@all ~* &*" -}}
  {{- $users := list -}}
  {{- range $user := ($objectData.users | default list) -}}
    {{- if eq $user.name "default" -}}
      {{/* Allows to tweak the default user, while it keeps the password of the credentials unless it is set explicitly */}}
      {{- $defaultUser = mustMergeOverwrite $defaultUser (mustDeepCopy $user) -}}
    {{- else -}}
      {{- $users = mustAppend $users $user -}}
    {{- end -}}
  {{- end -}}
  {{- $_ := set $spec "users" (concat (list $defaultUser) $users) }}

---
apiVersion: valkey.io/v1alpha1
kind: ValkeyCluster
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Valkey Operator") }}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end }}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  {{- toYaml $spec | nindent 2 }}
{{- end -}}
