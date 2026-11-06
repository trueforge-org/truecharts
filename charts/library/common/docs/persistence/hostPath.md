---
title: HostPath
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/hostPath#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: hostPath`.

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

### Create the directory

```yaml
persistence:
  hostpath-vol:
    enabled: true
    type: hostPath
    mountPath: /path
    hostPath: /path/to/host
    hostPathType: DirectoryOrCreate
```

### Read only file

```yaml
persistence:
  hostpath-file:
    enabled: true
    type: hostPath
    hostPath: /etc/localtime
    hostPathType: File
    targetSelector:
      workload-name:
        container-name:
          mountPath: /etc/localtime
          readOnly: true
```
