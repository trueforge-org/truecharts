---
title: volsync
---

:::note

- See the [Full Examples](/truecharts-common/persistence/volsync#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.volsync`

---

## Child Pages

- [dest](/truecharts-common/persistence/volsync/dest)
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

## `[].resources`

Define the resources of the VolSync mover

See [Resources](/truecharts-common/workload/podSpec/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].resources` |
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

See [dest](/truecharts-common/persistence/volsync/dest) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest` |
| Type | `map` |
| Required | ✅ |
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
  data:
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
          moverSecurityContext:
            runAsUser: 568
            runAsGroup: 568
            fsGroup: 568
```

```yaml
persistence:
  data:
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
          moverSecurityContext:
            runAsNonRoot: true
            runAsUser: 1000
            runAsGroup: 1000
            fsGroup: 1000
            fsGroupChangePolicy: OnRootMismatch
            seccompProfile:
              type: RuntimeDefault
            supplementalGroups:
              - 44
```
