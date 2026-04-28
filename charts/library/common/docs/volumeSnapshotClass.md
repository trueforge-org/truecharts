---
title: Volumesnapshotclass
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/volumeSnapshotClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.volumeSnapshotClass`

---

## `volumeSnapshotClass`

Define a volume snapshot class

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `volumeSnapshotClass` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `volumeSnapshotClass.$name.annotations`

Define the annotations of the volume snapshot class

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `volumeSnapshotClass.$name.annotations` |
| Type       | `map, string`                           |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `{}`                                    |

Example

```yaml
volumeSnapshotClass:
  $name:
    annotations:
      {}
```

---

### `volumeSnapshotClass.$name.deletionPolicy`

Define the deletion policy of the volume snapshot class

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `volumeSnapshotClass.$name.deletionPolicy` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `"Retain"`                                 |
| Enum       | `Delete`, `Retain`, `delete`, `retain`     |

Example

```yaml
volumeSnapshotClass:
  $name:
    deletionPolicy: Retain
```

---

### `volumeSnapshotClass.$name.driver`

Define the driver of the volume snapshot class

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `volumeSnapshotClass.$name.driver` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `""`                               |
| Min Length | `1`                                |

Example

```yaml
volumeSnapshotClass:
  $name:
    driver: ""
```

---

### `volumeSnapshotClass.$name.enabled`

Enable volume snapshot class

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `volumeSnapshotClass.$name.enabled` |
| Type       | `boolean, string`                   |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `false`                             |

Example

```yaml
volumeSnapshotClass:
  $name:
    enabled: false
```

---

### `volumeSnapshotClass.$name.isDefault`

Sets the annotation `snapshot.storage.kubernetes.io/is-default-class` to `"true"` or `"false"`

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `volumeSnapshotClass.$name.isDefault` |
| Type       | `boolean`                             |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `false`                               |

Example

```yaml
volumeSnapshotClass:
  $name:
    isDefault: false
```

---

### `volumeSnapshotClass.$name.labels`

Define the labels of the volume snapshot class

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `volumeSnapshotClass.$name.labels` |
| Type       | `map, string`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `{}`                               |

Example

```yaml
volumeSnapshotClass:
  $name:
    labels:
      {}
```

---

### `volumeSnapshotClass.$name.parameters`

Define a volume snapshot class

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `volumeSnapshotClass.$name.parameters` |
| Type       | `map, string`                          |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `{}`                                   |

Example

```yaml
volumeSnapshotClass:
  $name:
    parameters:
      {}
```

---

## Full Examples

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
  class2:
    enabled: true
    isDefault: true
    driver: "{{ .Values.some_driver }}"
    labels:
      label1: "{{ .Values.label1 }}"
      label2: label2
    annotations:
      annotation1: "{{ .Values.annotation1 }}"
      annotation2: annotation2
    parameters:
      "{{ .Values.some_key }}": "{{ .Values.some_value }}"
      parameter2: 5
```
