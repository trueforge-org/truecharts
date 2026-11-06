---
title: tmp
---

:::note

- See the [Full Examples](/truecharts-common/persistence/tmp#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.tmp`

---

## `tmp`

Built-in in-memory `emptyDir` volume mounted at `/tmp` in all containers of all workloads, as scratch space while the root filesystem is read-only. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Create the built-in `tmp` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/tmp`.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/tmp"` |

---

## `medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.targetSelectAll` |
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
| Key | `persistence.tmp.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  tmp:
    enabled: true
    type: emptyDir
    medium: Memory
    mountPath: /tmp
```
