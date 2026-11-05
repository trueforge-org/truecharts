---
title: Valkey Operator Containers
---

## Appears in

- `.Values.dependencies.valkey.operator.containers`

---

## `containers`

Patches of the containers of the pods (strategic merge patch, by name: `server` and `metrics-exporter`), or additional sidecar containers.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A container of the valkey pods: patches `server` or `metrics-exporter`, or adds a sidecar. It follows the Kubernetes container spec.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the container. `server` and `metrics-exporter` patch the containers of the chart, any other name adds a sidecar.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `[].image`

Image of the container. Required for a sidecar.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].image` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].imagePullPolicy`

When the image is pulled.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].imagePullPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Always"`, `"Never"`, `"IfNotPresent"` |

---

## `[].command`

Entrypoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].args`

Arguments of the entrypoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].args` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].workingDir`

Working directory of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].workingDir` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports`

Ports the container listens on.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[]`

Port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].name`

Name of the port, can be referenced by probes. At most 15 characters.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | … to 15 |

---

## `[].ports[].containerPort`

Port the container listens on.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].containerPort` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].ports[].hostPort`

Port on the host that is mapped to the `containerPort`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].hostPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].ports[].protocol`

Protocol of the port.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"TCP"`, `"UDP"`, `"SCTP"` |

---

## `[].ports[].hostIP`

Host IP the `hostPort` is bound to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].hostIP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom`

Sources of environment variables of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[]`

Source of environment variables of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].prefix`

Prefix added to the names of the variables.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].prefix` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].configMapRef`

ConfigMap to take the variables from.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].configMapRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].configMapRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].configMapRef.optional`

Whether the ConfigMap may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].configMapRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].secretRef`

Secret to take the variables from.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].secretRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].secretRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom[].secretRef.optional`

Whether the Secret may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].secretRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env`

Environment variables of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].name`

Name of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].value`

Value of the environment variable. Not used with `valueFrom`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom`

Source of the value of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.fieldRef`

Field of the pod to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.fieldRef.apiVersion`

Version of the schema the field path is written in.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.fieldRef.fieldPath`

Path of the field of the pod to read, for example `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.resourceFieldRef`

Resource of the container to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.resourceFieldRef.containerName`

Name of the container the resource belongs to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.resourceFieldRef.resource`

Name of the resource to read, for example `limits.cpu`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef.resource` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.resourceFieldRef.divisor`

Unit of the value the resource is divided by.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef.divisor` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.configMapKeyRef`

Key of a ConfigMap to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.configMapKeyRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.configMapKeyRef.key`

Key of the ConfigMap to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.configMapKeyRef.optional`

Whether the ConfigMap or the key may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.secretKeyRef`

Key of a Secret to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.secretKeyRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.secretKeyRef.key`

Key of the Secret to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env[].valueFrom.secretKeyRef.optional`

Whether the Secret or the key may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources`

Resources of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.limits`

Maximum amount of each resource the container can use, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.limits.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.limits.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.requests`

Minimum amount of each resource the container needs, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.requests` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.requests.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.requests.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.claims`

Dynamic resource claims of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.claims[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.claims[].name`

Name of the claim the container uses.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources.claims[].request`

Name of the request within the claim. Uses every request of the claim when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims[].request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext`

Security context of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.allowPrivilegeEscalation`

Whether the process can gain more privileges than its parent process.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.allowPrivilegeEscalation` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.appArmorProfile`

AppArmor profile of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.appArmorProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `[].securityContext.appArmorProfile.localhostProfile`

Name of the profile loaded on the node, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.capabilities`

Linux capabilities added to or dropped from the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.capabilities` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.capabilities.add`

Linux capabilities added to the container (for example `NET_ADMIN`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.capabilities.drop`

Linux capabilities dropped from the container (for example `ALL`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.capabilities.drop` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.privileged`

Whether the container runs in privileged mode.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.privileged` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.procMount`

Type of the proc mount of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.procMount` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Default"`, `"Unmasked"` |

---

## `[].securityContext.readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.readOnlyRootFilesystem` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.runAsGroup`

Group ID of the first process of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.runAsNonRoot`

Whether the container must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.runAsUser`

User ID of the first process of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seLinuxOptions`

SELinux options of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seccompProfile`

Seccomp profile of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `[].securityContext.seccompProfile.localhostProfile`

Path of the profile on the node, relative to the kubelet seccomp directory, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.windowsOptions`

Windows specific options of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.windowsOptions.hostProcess`

Whether the container runs as a HostProcess container, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext.windowsOptions.runAsUserName`

User name the first process of the container runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resizePolicy`

Resize policy of the resources of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resizePolicy` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resizePolicy[]`

Resize policy of a resource of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resizePolicy[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resizePolicy[].resourceName`

Resource to resize, for example `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resizePolicy[].resourceName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resizePolicy[].restartPolicy`

Whether the container is restarted when the resource is resized.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resizePolicy[].restartPolicy` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"NotRequired"`, `"RestartContainer"` |

---

## `[].restartPolicy`

Restart policy of the container. Only used for sidecars (init containers).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Always"`, `"Never"`, `"OnFailure"` |

---

## `[].restartPolicyRules`

Rules that decide whether the container is restarted on exit.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].restartPolicyRules[]`

Rule that decides whether the container is restarted on exit.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].restartPolicyRules[].action`

Action taken when the exit codes match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].action` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Restart"`, `"RestartAllContainers"` |

---

## `[].restartPolicyRules[].exitCodes`

Exit codes the rule applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].exitCodes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].restartPolicyRules[].exitCodes.operator`

Whether the `values` are matched (`In`) or not (`NotIn`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].exitCodes.operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"` |

---

## `[].restartPolicyRules[].exitCodes.values`

Exit codes to match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].exitCodes.values` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts`

Volumes mounted in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[]`

Volume mounted in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[].name`

Name of the volume to mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[].mountPath`

Path in the container the volume is mounted at.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].mountPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[].readOnly`

Whether the volume is mounted read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].readOnly` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[].recursiveReadOnly`

Whether the read-only mount is applied recursively to submounts.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].recursiveReadOnly` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"IfPossible"`, `"Enabled"` |

---

## `[].volumeMounts[].subPath`

Path inside the volume to mount instead of its root.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].subPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[].subPathExpr`

Like `subPath`, but expanded from environment variables of the container. Mutually exclusive with `subPath`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].subPathExpr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts[].mountPropagation`

Mount propagation of the mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].mountPropagation` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"None"`, `"HostToContainer"`, `"Bidirectional"` |

---

## `[].volumeMounts[].bindMountOptions`

Options of the bind mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].bindMountOptions` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeDevices`

Block devices mapped in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeDevices` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeDevices[]`

Block device mapped in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeDevices[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeDevices[].name`

Name of the persistent volume claim that provides the block device.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeDevices[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeDevices[].devicePath`

Path the block device is mapped to in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeDevices[].devicePath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe`

Liveness probe of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"` |

---

## `[].livenessProbe.httpGet.httpHeaders`

Headers to set in the request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP1"`, `"HTTP2"` |

---

## `[].livenessProbe.tcpSocket`

Connection to a TCP port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.grpc`

gRPC health check of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.grpc.port`

Port of the gRPC server.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].livenessProbe.grpc.service`

Name of the service to check.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc.service` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.grpc.mode`

Whether the connection uses TLS.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Plaintext"`, `"TLS"` |

---

## `[].livenessProbe.initialDelaySeconds`

Seconds to wait after the container started before the first probe.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.initialDelaySeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.timeoutSeconds`

Seconds after which the probe times out.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.periodSeconds`

How often (in seconds) the probe runs.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.periodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.successThreshold`

Consecutive successes needed to be considered successful after a failure.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.successThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.failureThreshold`

Consecutive failures needed to be considered failed.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.failureThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].livenessProbe.terminationGracePeriodSeconds`

Grace period before the container is stopped when this probe fails.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.terminationGracePeriodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe`

Readiness probe of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"` |

---

## `[].readinessProbe.httpGet.httpHeaders`

Headers to set in the request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.httpGet.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP1"`, `"HTTP2"` |

---

## `[].readinessProbe.tcpSocket`

Connection to a TCP port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.grpc`

gRPC health check of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.grpc` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.grpc.port`

Port of the gRPC server.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.grpc.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].readinessProbe.grpc.service`

Name of the service to check.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.grpc.service` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.grpc.mode`

Whether the connection uses TLS.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.grpc.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Plaintext"`, `"TLS"` |

---

## `[].readinessProbe.initialDelaySeconds`

Seconds to wait after the container started before the first probe.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.initialDelaySeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.timeoutSeconds`

Seconds after which the probe times out.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.periodSeconds`

How often (in seconds) the probe runs.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.periodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.successThreshold`

Consecutive successes needed to be considered successful after a failure.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.successThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.failureThreshold`

Consecutive failures needed to be considered failed.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.failureThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe.terminationGracePeriodSeconds`

Grace period before the container is stopped when this probe fails.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe.terminationGracePeriodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe`

Startup probe of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"` |

---

## `[].startupProbe.httpGet.httpHeaders`

Headers to set in the request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.httpGet.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP1"`, `"HTTP2"` |

---

## `[].startupProbe.tcpSocket`

Connection to a TCP port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.grpc`

gRPC health check of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.grpc` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.grpc.port`

Port of the gRPC server.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.grpc.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].startupProbe.grpc.service`

Name of the service to check.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.grpc.service` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.grpc.mode`

Whether the connection uses TLS.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.grpc.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Plaintext"`, `"TLS"` |

---

## `[].startupProbe.initialDelaySeconds`

Seconds to wait after the container started before the first probe.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.initialDelaySeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.timeoutSeconds`

Seconds after which the probe times out.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.periodSeconds`

How often (in seconds) the probe runs.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.periodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.successThreshold`

Consecutive successes needed to be considered successful after a failure.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.successThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.failureThreshold`

Consecutive failures needed to be considered failed.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.failureThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe.terminationGracePeriodSeconds`

Grace period before the container is stopped when this probe fails.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe.terminationGracePeriodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle`

Lifecycle hooks of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart`

Handler run right after the container started.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"` |

---

## `[].lifecycle.postStart.httpGet.httpHeaders`

Headers to set in the request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP1"`, `"HTTP2"` |

---

## `[].lifecycle.postStart.tcpSocket`

Connection to a TCP port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.sleep`

Sleep for a number of seconds.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.sleep` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.postStart.sleep.seconds`

Seconds to sleep.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.sleep.seconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop`

Handler run before the container is stopped.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"` |

---

## `[].lifecycle.preStop.httpGet.httpHeaders`

Headers to set in the request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.httpGet.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP1"`, `"HTTP2"` |

---

## `[].lifecycle.preStop.tcpSocket`

Connection to a TCP port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.sleep`

Sleep for a number of seconds.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.sleep` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.preStop.sleep.seconds`

Seconds to sleep.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop.sleep.seconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle.stopSignal`

Signal sent to the container to stop it, instead of the default.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.stopSignal` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"SIGABRT"`, `"SIGALRM"`, `"SIGBUS"`, `"SIGCHLD"`, `"SIGCLD"`, `"SIGCONT"`, `"SIGFPE"`, `"SIGHUP"`, `"SIGILL"`, `"SIGINT"`, `"SIGIO"`, `"SIGIOT"`, `"SIGKILL"`, `"SIGPIPE"`, `"SIGPOLL"`, `"SIGPROF"`, `"SIGPWR"`, `"SIGQUIT"`, `"SIGSEGV"`, `"SIGSTKFLT"`, `"SIGSTOP"`, `"SIGSYS"`, `"SIGTERM"`, `"SIGTRAP"`, `"SIGTSTP"`, `"SIGTTIN"`, `"SIGTTOU"`, `"SIGURG"`, `"SIGVTALRM"`, `"SIGWINCH"`, `"SIGXCPU"`, `"SIGXFSZ"`, `"SIGRTMIN"`, `"SIGRTMAX"` |

---

## `[].terminationMessagePath`

Path of the file the termination message is written to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].terminationMessagePath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].terminationMessagePolicy`

Where the termination message is read from.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].terminationMessagePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"File"`, `"FallbackToLogsOnError"` |

---

## `[].stdin`

Whether stdin is kept open for the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].stdin` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].stdinOnce`

Whether stdin is closed after the first attach.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].stdinOnce` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tty`

Whether a TTY is allocated for the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].tty` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
