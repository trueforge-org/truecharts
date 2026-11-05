---
title: volumeMounts
---

## Appears in

- `.Values.dependencies.valkey.operator.containers[].volumeMounts`

---

## `volumeMounts`

Volumes mounted in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

Volume mounted in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the volume to mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].mountPath`

Path in the container the volume is mounted at.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].mountPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readOnly`

Whether the volume is mounted read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].readOnly` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].recursiveReadOnly`

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

## `[].subPath`

Path inside the volume to mount instead of its root.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].subPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].subPathExpr`

Like `subPath`, but expanded from environment variables of the container. Mutually exclusive with `subPath`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].subPathExpr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].mountPropagation`

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

## `[].bindMountOptions`

Options of the bind mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].bindMountOptions` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
