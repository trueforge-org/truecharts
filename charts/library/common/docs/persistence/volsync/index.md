---
title: volsync
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/volsync#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.volsync`

---

## Child Pages

- [src](/truecharts-common/persistence/volsync/src)

---

## `volsync`

VolSync backups and restores of this PVC. Only for `type: pvc` and `type: vct`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A VolSync backup and restore pair.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the VolSync backup, used in the names of the generated resources.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].type`

VolSync mover type, for example `restic`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"restic"` |

---

## `[].credentials`

Name of the entry in `credentials` that holds the backup repository settings.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].credentials` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].copyMethod`

How VolSync copies the data: `Snapshot`, `Clone` or `Direct`. Defaults to `Snapshot`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].copyMethod` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Clone"`, `"Direct"`, `"Snapshot"` |

---

## `[].cleanupTempPVC`

Delete the temporary PVC of the ReplicationDestination after the restore.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].cleanupTempPVC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cleanupCachePVC`

Delete the cache PVC of the ReplicationDestination after the restore.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].cleanupCachePVC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labels`

Additional labels for the VolSync resources

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].annotations`

Additional annotations for the VolSync resources

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].src`

The ReplicationSource, which backs up the data.

See [src](/truecharts-common/persistence/volsync/src) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest`

The ReplicationDestination, which restores the data.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.enabled`

Enables or Disables the VolSync destination, which restores the data

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].dest.capacity`

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

## `[].dest.accessModes`

Access modes of the restored volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.accessModes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.storageClassName`

Define the storageClassName of the destination storage

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.storageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.volumeSnapshotClassName`

Define the volumeSnapshotClassName used for the destination snapshots

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.cacheCapacity`

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

## `[].dest.cacheStorageClassName`

Define the storageClassName of the cache PVC

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheStorageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.cacheAccessModes`

Access modes of the cache PVC.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheAccessModes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.moverSecurityContext`

Pod security context of the VolSync mover pod of the destination.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.moverSecurityContext.fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.moverSecurityContext.runAsGroup`

Group ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].dest.moverSecurityContext.runAsUser`

User ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  restored:
    volsync:
      - name: mybackup
        type: restic
        credentials: mys3
        src:
          enabled: false
        dest:
          enabled: true
          capacity: 10Gi
          accessModes:
            - ReadWriteOnce
          storageClassName: some-storage-class
          volumeSnapshotClassName: some-snapshot-class
```

```yaml
persistence:
  backedup:
    volsync:
      - name: mybackup
        type: restic
        credentials: mys3
        copyMethod: Snapshot
        cleanupTempPVC: true
        cleanupCachePVC: true
        src:
          enabled: true
          trigger:
            schedule: 0 0 * * *
          pruneIntervalDays: 7
          retain:
            hourly: 6
            daily: 5
            weekly: 4
            monthly: 3
            yearly: 1
          accessModes:
            - ReadWriteOnce
          storageClassName: some-storage-class
          volumeSnapshotClassName: some-snapshot-class
          cacheCapacity: 1Gi
          moverSecurityContext:
            runAsUser: 568
            runAsGroup: 568
            fsGroup: 568
        dest:
          enabled: false
```
