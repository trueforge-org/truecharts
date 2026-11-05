---
title: targetSelector
---

## Appears in

- `.Values.persistence.$name.targetSelector`

---

## `targetSelector`

Where the volume is mounted, as a map of workload name to a map of container name to mount settings. Defaults to the primary workload and its primary container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

Containers of this workload that mount the volume, keyed by container name.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.$name`

Mount settings of this container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.$name.readOnly`

Mount the volume read-only in this container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.readOnly` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.$name.mountPath`

Path the volume is mounted at in this container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.$name.mountPropagation`

Mount propagation in this container: `None`, `HostToContainer` or `Bidirectional`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.mountPropagation` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.$name.subPath`

Path within the volume that is mounted instead of its root.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.subPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---
