---
title: Volume Snapshot
---

:::note

- See the [Full Examples](/truecharts-common/volumeSnapshots#full-examples) section for complete examples.

:::

## Appears in

- `.Values.volumeSnapshots`

---

## `volumeSnapshots`

VolumeSnapshots, keyed by name.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A VolumeSnapshot.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.source`

Source of the snapshot. Set one of `persistentVolumeClaimName` or `volumeSnapshotContentName`.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.source` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.source.persistentVolumeClaimName`

Name of the PersistentVolumeClaim to snapshot.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.source.persistentVolumeClaimName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.source.volumeSnapshotContentName`

Name of an existing VolumeSnapshotContent to use.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.source.volumeSnapshotContentName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volumeSnapshotClassName`

Name of the VolumeSnapshotClass used to create the snapshot.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Labels of the VolumeSnapshot.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Annotations of the VolumeSnapshot.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.enabled`

Create this volume snapshot when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshots.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## Full Examples

### From an existing VolumeSnapshotContent

```yaml
volumeSnapshots:
  example1:
    enabled: true
    source:
      volumeSnapshotContentName: some-name
```

### From a PersistentVolumeClaim

```yaml
volumeSnapshots:
  example2:
    enabled: true
    source:
      persistentVolumeClaimName: some-pvc-name
```

### With a class

`volumeSnapshotClassName` selects the VolumeSnapshotClass. The class can be created by the chart too, see [Volume Snapshot Class](/truecharts-common/volumeSnapshotClass):

```yaml
volumeSnapshotClass:
  csi-class:
    enabled: true
    driver: csi-hostpath-snapshots
    deletionPolicy: Delete

volumeSnapshots:
  example3:
    enabled: true
    namespace: some-namespace
    volumeSnapshotClassName: csi-class
    labels:
      key: value
    annotations:
      key: value
    source:
      persistentVolumeClaimName: some-pvc-name
```
