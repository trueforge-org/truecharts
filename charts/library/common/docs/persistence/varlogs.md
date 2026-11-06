---
title: varlogs
---

:::note

- See the [Full Examples](/truecharts-common/persistence/varlogs#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.varlogs`

---

## `varlogs`

Built-in in-memory `emptyDir` volume mounted at `/var/logs` in all containers of all workloads, so apps can write logs while the root filesystem is read-only. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Create the built-in `varlogs` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/var/logs`.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/logs"` |

---

## `medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.targetSelectAll` |
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
| Key | `persistence.varlogs.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  varlogs:
    enabled: false
```
