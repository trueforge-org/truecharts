---
title: Device
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/device#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: device`.

:::

## Appears in

- `.Values.persistence.$name`

---

## `hostPath`

Path on the node. Only for `type: hostPath`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.hostPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `device`, `hostPath` |

Example

```yaml
persistence:
  example:
    hostPath: /mnt/data
```

---

## `hostPathType`

Type of the host path, eg `Directory` or `DirectoryOrCreate`. Only for `type: hostPath`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.hostPathType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `device`, `hostPath` |

---

## Full Examples

### Block device

```yaml
persistence:
  dev-vol:
    enabled: true
    type: device
    hostPath: /dev/sda
    hostPathType: BlockDevice
    mountPath: /dev/sda
```

### Character device

```yaml
persistence:
  gpu:
    enabled: true
    type: device
    hostPath: /dev/dri
    hostPathType: CharDevice
    targetSelector:
      workload-name:
        container-name:
          mountPath: /dev/dri
```
