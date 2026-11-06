---
title: devshm
---

:::note

- See the [Full Examples](/truecharts-common/persistence/devshm#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.devshm`

---

## `devshm`

Built-in in-memory `emptyDir` volume mounted at `/dev/shm` in all containers of all workloads, for shared memory. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Create the built-in `devshm` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/dev/shm`.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/dev/shm"` |

---

## `medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  devshm:
    enabled: true
    type: emptyDir
    medium: Memory
    mountPath: /dev/shm
```
