---
title: NFS
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/nfs#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: nfs`.

:::

## Appears in

- `.Values.persistence.$name`

---

## `path`

Path of the NFS export on the server. Only for `type: nfs`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `nfs` |

Example

```yaml
persistence:
  example:
    path: /exports/data
```

---

## `server`

Hostname or IP of the NFS server. Only for `type: nfs`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.server` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `nfs` |

Example

```yaml
persistence:
  example:
    server: 192.168.1.10
```

---

## Full Examples

```yaml
persistence:
  nfs-vol:
    enabled: true
    type: nfs
    path: /path/of/nfs/share
    server: nfs-server
    mountPath: /data
```

### Read only in selected containers

```yaml
persistence:
  nfs-media:
    enabled: true
    type: nfs
    path: /mnt/tank/media
    server: 10.0.0.10
    targetSelector:
      workload-name:
        container-name:
          mountPath: /media
          readOnly: true
```
