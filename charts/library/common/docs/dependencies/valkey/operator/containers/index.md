---
title: Valkey Operator Containers
---

## Appears in

- `.Values.dependencies.valkey.operator.containers`

---

## Child Pages

- [env](/truecharts-common/dependencies/valkey/operator/containers/env)
- [envFrom](/truecharts-common/dependencies/valkey/operator/containers/envFrom)
- [lifecycle](/truecharts-common/dependencies/valkey/operator/containers/lifecycle)
- [livenessProbe](/truecharts-common/dependencies/valkey/operator/containers/livenessProbe)
- [ports](/truecharts-common/dependencies/valkey/operator/containers/ports)
- [resources](/truecharts-common/dependencies/valkey/operator/containers/resources)
- [restartPolicyRules](/truecharts-common/dependencies/valkey/operator/containers/restartPolicyRules)
- [securityContext](/truecharts-common/dependencies/valkey/operator/containers/securityContext)
- [volumeMounts](/truecharts-common/dependencies/valkey/operator/containers/volumeMounts)

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

See [ports](/truecharts-common/dependencies/valkey/operator/containers/ports) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].envFrom`

Sources of environment variables of the container.

See [envFrom](/truecharts-common/dependencies/valkey/operator/containers/envFrom) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].env`

Environment variables of the container.

See [env](/truecharts-common/dependencies/valkey/operator/containers/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resources`

Resources of the container.

See [resources](/truecharts-common/dependencies/valkey/operator/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].securityContext`

Security context of the container.

See [securityContext](/truecharts-common/dependencies/valkey/operator/containers/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext` |
| Type | `map` |
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

See [restartPolicyRules](/truecharts-common/dependencies/valkey/operator/containers/restartPolicyRules) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].volumeMounts`

Volumes mounted in the container.

See [volumeMounts](/truecharts-common/dependencies/valkey/operator/containers/volumeMounts) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts` |
| Type | `list of map` |
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

See [livenessProbe](/truecharts-common/dependencies/valkey/operator/containers/livenessProbe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readinessProbe`

Readiness probe of the container.

See [livenessProbe](/truecharts-common/dependencies/valkey/operator/containers/livenessProbe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].readinessProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].startupProbe`

Startup probe of the container.

See [livenessProbe](/truecharts-common/dependencies/valkey/operator/containers/livenessProbe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].startupProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].lifecycle`

Lifecycle hooks of the container.

See [lifecycle](/truecharts-common/dependencies/valkey/operator/containers/lifecycle) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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
