---
title: dest
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/volsync/dest#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.volsync[].dest`

---

## Child Pages

- [moverSecurityContext](/truecharts-common/persistence/volsync/dest/moverSecurityContext)

---

## `dest`

The ReplicationDestination, which restores the data.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables or Disables the VolSync destination, which restores the data

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `capacity`

Size of the restored volume, as a quantity.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.capacity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - dest:
          capacity: 100Gi
```

---

## `accessModes`

Access modes of the restored volume, a single mode as a string or a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.accessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `storageClassName`

Define the storageClassName of the destination storage

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.storageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `volumeSnapshotClassName`

Define the volumeSnapshotClassName used for the destination snapshots

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `cacheCapacity`

Size of the cache PVC, as a quantity. Defaults to `10Gi`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheCapacity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - dest:
          cacheCapacity: 10Gi
```

---

## `cacheStorageClassName`

Define the storageClassName of the cache PVC

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheStorageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `cacheAccessModes`

Access modes of the cache PVC, a single mode as a string or a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheAccessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `moverSecurityContext`

Pod security context of the VolSync mover pod of the destination.

See [moverSecurityContext](/truecharts-common/persistence/volsync/dest/moverSecurityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  backedup:
    volsync:
      - dest:
          enabled: false
```

```yaml
persistence:
  restored:
    volsync:
      - dest:
          enabled: true
          capacity: 10Gi
          accessModes:
            - ReadWriteOnce
          storageClassName: some-storage-class
          volumeSnapshotClassName: some-snapshot-class
```
