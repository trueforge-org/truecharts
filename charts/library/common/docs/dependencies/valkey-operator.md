---
title: Valkey Operator
---

## Appears in

- `.Values.dependencies.valkey.operator`

---

## `operator`

Settings of the `ValkeyCluster` of the [valkey-operator](https://github.com/valkey-io/valkey-operator), used when `mode` is `operator`. The credentials stay in `depconfig`. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `shards`

Number of shards (primaries) of the cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.shards` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `1` |
| Range | 1 to … |

---

## `replicas`

Number of replicas per shard.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.replicas` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `0` |
| Range | 0 to … |

---

## `imageSelector`

Image of the nodes, the name of an image on the root of the values. Defaults to `valkeyImage`, the image of the standalone mode.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"valkeyImage"` |

---

## `workloadType`

Workload of every node. Can not be changed after creation. `Deployment` does not support persistence.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.workloadType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"StatefulSet"` |
| Allowed values | `"StatefulSet"`, `"Deployment"` |

---

## `config`

Valkey configuration directives (valkey.conf), eg `maxmemory-policy: allkeys-lru`. Booleans are written as `yes` and `no`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.config` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `{}` |

---

## `config.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.config.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

Resources of the Valkey containers. Defaults to the `resources` of the chart.

See [Resources](/truecharts-common/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `persistence`

Persistence of the nodes. Requires `workloadType: StatefulSet`, and can not be added or removed after creation.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": true, "size": "", "storageClass": "", "retain": false}` |

---

## `persistence.enabled`

Whether the nodes have a volume.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `persistence.size`

Size of the volume of every node. Defaults to `global.fallbackDefaults.vctSize`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.size` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `persistence.storageClass`

Storage class of the volumes. Defaults to `global.fallbackDefaults.storageClass`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.storageClass` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `persistence.retain`

Whether the volumes are retained when a node is deleted. Defaults to `global.fallbackDefaults.pvcRetain`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.retain` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `exporter`

Metrics exporter sidecar of every pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
enabled: true
imageSelector: valkeyExporterImage
args: []
resources: {}
securityContext: {}
```

---

## `exporter.enabled`

Whether the exporter sidecar runs.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `exporter.imageSelector`

Image of the exporter, the name of an image on the root of the values.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"valkeyExporterImage"` |

---

## `exporter.args`

Command-line arguments of the exporter.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.args` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `exporter.resources`

Resources of the exporter container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `exporter.resources.limits`

Maximum amount of each resource the container can use, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.limits.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.limits.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.requests`

Minimum amount of each resource the container needs, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.requests` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.requests.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.requests.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.claims`

Dynamic resource claims of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.claims` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.claims[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.claims[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.claims[].name`

Name of the claim the container uses.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.claims[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.resources.claims[].request`

Name of the request within the claim. Uses every request of the claim when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources.claims[].request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext`

Security context of the exporter container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `exporter.securityContext.allowPrivilegeEscalation`

Whether the process can gain more privileges than its parent process.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.allowPrivilegeEscalation` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.appArmorProfile`

AppArmor profile of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.appArmorProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `exporter.securityContext.appArmorProfile.localhostProfile`

Name of the profile loaded on the node, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.capabilities`

Linux capabilities added to or dropped from the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.capabilities` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.capabilities.add`

Linux capabilities added to the container (for example `NET_ADMIN`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.capabilities.drop`

Linux capabilities dropped from the container (for example `ALL`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.capabilities.drop` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.privileged`

Whether the container runs in privileged mode.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.privileged` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.procMount`

Type of the proc mount of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.procMount` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Default"`, `"Unmasked"` |

---

## `exporter.securityContext.readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.readOnlyRootFilesystem` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.runAsGroup`

Group ID of the first process of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.runAsNonRoot`

Whether the container must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.runAsUser`

User ID of the first process of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seLinuxOptions`

SELinux options of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seccompProfile`

Seccomp profile of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `exporter.securityContext.seccompProfile.localhostProfile`

Path of the profile on the node, relative to the kubelet seccomp directory, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.windowsOptions`

Windows specific options of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.windowsOptions.hostProcess`

Whether the container runs as a HostProcess container, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exporter.securityContext.windowsOptions.runAsUserName`

User name the first process of the container runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduling`

Scheduling of the pods: `tolerations`, `nodeSelector`, `affinity`, `topologySpreadConstraints`, `priorityClassName`, `node` and `zone` (spreading and pinning).

See [Valkey Operator Scheduling](/truecharts-common/dependencies/valkey-scheduling) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `podDisruptionBudget`

PodDisruptionBudget managed by the operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podDisruptionBudget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"mode": "Cluster"}` |

---

## `podDisruptionBudget.mode`

`Cluster` creates one budget (`maxUnavailable: 1`) for all pods, `Disabled` creates none.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podDisruptionBudget.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Cluster"` |
| Allowed values | `"Cluster"`, `"Disabled"` |

---

## `podMetadata`

Labels and annotations added to every pod. The operator rejects the keys it sets itself.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podMetadata` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"labels": {}, "annotations": {}}` |

---

## `podMetadata.labels`

Labels of the pods.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podMetadata.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `podMetadata.annotations`

Annotations of the pods.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podMetadata.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `imagePullSecrets`

Secrets used to pull the images. An item is a name, or an object with a `name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imagePullSecrets` |
| Type | `list of string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `imagePullSecrets[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imagePullSecrets[]` |
| Type | `string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `imagePullSecrets[].name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imagePullSecrets[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext`

Overrides of the security context of the pods. Defaults to the `securityContext` of the chart (`runAsUser`, `runAsGroup`, `fsGroup`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `podSecurityContext.appArmorProfile`

AppArmor profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.appArmorProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `podSecurityContext.appArmorProfile.localhostProfile`

Name of the profile loaded on the node, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.fsGroupChangePolicy`

Whether the ownership of the volumes is changed on mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.fsGroupChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"OnRootMismatch"`, `"Always"` |

---

## `podSecurityContext.runAsGroup`

Group ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.runAsNonRoot`

Whether the containers of the pod must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.runAsUser`

User ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seLinuxChangePolicy`

How the SELinux labels of the volumes are changed.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seLinuxChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Recursive"`, `"MountOption"` |

---

## `podSecurityContext.seLinuxOptions`

SELinux options of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seccompProfile`

Seccomp profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `podSecurityContext.seccompProfile.localhostProfile`

Path of the profile on the node, relative to the kubelet seccomp directory, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.supplementalGroups`

Additional group IDs of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.supplementalGroups` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.supplementalGroupsPolicy`

How the supplemental groups are computed, with the groups of the image.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.supplementalGroupsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Merge"`, `"Strict"` |

---

## `podSecurityContext.sysctls`

Namespaced sysctls set for the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.sysctls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.sysctls[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.sysctls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.sysctls[].name`

Name of the sysctl.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.sysctls[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.sysctls[].value`

Value of the sysctl.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.sysctls[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.windowsOptions`

Windows specific options of the pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.windowsOptions.hostProcess`

Whether the containers run as HostProcess containers, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext.windowsOptions.runAsUserName`

User name the first process of the containers runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `serviceAccountName`

Name of an existing ServiceAccount for the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.serviceAccountName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `terminationGracePeriodSeconds`

Grace period of the pods in seconds. The operator calculates it when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.terminationGracePeriodSeconds` |
| Type | `int or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |
| Range | 1 to … |

---

## `containers`

Patches of the containers of the pods (strategic merge patch, by name: `server` and `metrics-exporter`), or additional sidecar containers.

See [Valkey Operator Containers](/truecharts-common/dependencies/valkey-containers) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `networking`

Networking of the cluster. TLS is not supported, as the credentials and the wait init container connect without it.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"clusterDomain": "", "discovery": {"preferredEndpointType": ""}}` |

---

## `networking.clusterDomain`

Domain of the Kubernetes cluster. The operator uses `cluster.local` when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking.clusterDomain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `networking.discovery`

Discovery (in-cluster announce) of the nodes.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking.discovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"preferredEndpointType": ""}` |

---

## `networking.discovery.preferredEndpointType`

How the nodes announce themselves. The operator uses `IP` when unset, `Hostname` requires `workloadType: StatefulSet`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking.discovery.preferredEndpointType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |
| Allowed values | `""`, `"IP"`, `"Hostname"` |

---

## `users`

Additional users of the cluster, see the [valkey-operator docs](https://github.com/valkey-io/valkey-operator/blob/main/docs/valkeycluster.md#users). The `default` user always exists with the password of the credentials, an item named `default` overrides its settings.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `users[]`

A valkey ACL user, with its password, permissions and key access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].name`

Name of the user. Can not start with `_`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | `^[^_]` |
| Length | 1 to … |

---

## `users[].enabled`

Whether the user can authenticate. Users are enabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].passwordSecret`

Secret with the passwords of the user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].passwordSecret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].passwordSecret.name`

Name of the Secret with the passwords. Defaults to the users Secret of the cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].passwordSecret.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].passwordSecret.keys`

Keys of the Secret with the passwords, several keys allow rotation. Defaults to the name of the user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].passwordSecret.keys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].nopass`

Whether the user can authenticate without a password.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].nopass` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].resetpass`

Whether the ACL rules of the user are reset before the other settings are applied.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].resetpass` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].commands`

Commands the user can and can not run.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].commands` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].commands.allow`

Commands, or categories (`@category`), the user can run.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].commands.allow` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | See below |

Pattern:

```text
^(@[A-Za-z]+|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*(\|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*)?)$
```

---

## `users[].commands.deny`

Commands, or categories (`@category`), the user can not run.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].commands.deny` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | See below |

Pattern:

```text
^(@[A-Za-z]+|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*(\|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*)?)$
```

---

## `users[].keys`

Key patterns the user can access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].keys.readWrite`

Key patterns the user can read and write.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys.readWrite` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].keys.readOnly`

Key patterns the user can only read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys.readOnly` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].keys.writeOnly`

Key patterns the user can only write.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys.writeOnly` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].channels`

Pub/sub channels the user can access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].channels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].channels.patterns`

Pub/sub channel patterns the user can access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].channels.patterns` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `users[].permissions`

Raw ACL string appended after the generated rules, for example `+@all ~* &*`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].permissions` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labels`

Additional labels of the `ValkeyCluster`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `annotations`

Additional annotations of the `ValkeyCluster`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---
