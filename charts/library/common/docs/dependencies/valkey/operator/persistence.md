---
title: persistence
---

## Appears in

- `.Values.dependencies.valkey.operator.persistence`

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

## `enabled`

Whether the nodes have a volume.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `size`

Size of the volume of every node. Defaults to `global.fallbackDefaults.vctSize`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.size` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `storageClass`

Storage class of the volumes. Defaults to `global.fallbackDefaults.storageClass`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.storageClass` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `retain`

Whether the volumes are retained when a node is deleted. Defaults to `global.fallbackDefaults.pvcRetain`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.retain` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---
