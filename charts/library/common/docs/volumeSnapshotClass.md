---
title: Volume Snapshot Class
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/volumeSnapshotClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.volumeSnapshotClass`

---

## `volumeSnapshotClass`

VolumeSnapshotClasses, keyed by name.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A VolumeSnapshotClass.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.parameters`

Parameters passed to the CSI driver. Supports Helm `tpl` on keys and values.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.parameters` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On keys and values) |
| Default | `{}` |

---

## `$name.parameters.$name`

Value of the parameter

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.parameters.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Labels of the VolumeSnapshotClass.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.labels` |
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
| Key | `volumeSnapshotClass.$name.annotationsList` |
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
| Key | `volumeSnapshotClass.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Annotations of the VolumeSnapshotClass.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.enabled`

Create this volume snapshot class when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.isDefault`

Make this the default VolumeSnapshotClass. Sets the annotation `snapshot.storage.kubernetes.io/is-default-class` to `"true"` or `"false"`.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.isDefault` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.driver`

CSI driver that takes the snapshots.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.driver` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

Example

```yaml
volumeSnapshotClass:
  example:
    driver: driver.longhorn.io
```

---

## `$name.deletionPolicy`

What happens to the snapshot content when a VolumeSnapshot is deleted.

| Field | Value |
| --- | --- |
| Key | `volumeSnapshotClass.$name.deletionPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Retain"` |
| Allowed values | `"Retain"`, `"Delete"` |

---

## Full Examples

### Basic class

```yaml
volumeSnapshotClass:
  class1:
    enabled: true
    driver: csi-hostpath-snapshots
    deletionPolicy: Delete
    labels:
      label1: "{{ .Values.label1 }}"
      label2: label2
    annotations:
      annotation1: "{{ .Values.annotation1 }}"
      annotation2: annotation2
```

### Default class with parameters

The `driver` can be read from other values, and `parameters` can be numbers and booleans:

```yaml
volumeSnapshotClass:
  class2:
    enabled: true
    isDefault: true
    driver: "{{ .Values.some_driver }}"
    deletionPolicy: Retain
    parameters:
      "{{ .Values.some_key }}": "{{ .Values.some_value }}"
      parameter2: 5
      parameter3: true
```
