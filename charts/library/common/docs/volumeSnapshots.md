---
title: Volumesnapshots
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/volumeSnapshots#full-examples) section for complete examples.

:::

## Appears in

- `.Values.volumeSnapshots`

---

## `volumeSnapshots`

Define a volume snapshot

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `volumeSnapshots` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `volumeSnapshots.$name.annotations`

Define the annotations of the volume snapshot class

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `volumeSnapshots.$name.annotations` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ✅ (On value only)                   |
| Default    | `{}`                                |

Example

```yaml
volumeSnapshots:
  $name:
    annotations:
      {}
```

---

### `volumeSnapshots.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `volumeSnapshots.$name.annotationsList` |
| Type       | `list of map`                           |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `volumeSnapshots.$name.enabled`

Enable volume snapshot

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `volumeSnapshots.$name.enabled` |
| Type       | `boolean, string`               |
| Required   | ✅                              |
| Helm `tpl` | ✅                              |
| Default    | `false`                         |

Example

```yaml
volumeSnapshots:
  $name:
    enabled: false
```

---

### `volumeSnapshots.$name.labels`

Define the labels of the volume snapshot

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `volumeSnapshots.$name.labels` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ✅ (On value only)              |
| Default    | `{}`                           |

Example

```yaml
volumeSnapshots:
  $name:
    labels:
      {}
```

---

### `volumeSnapshots.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `volumeSnapshots.$name.labelsList` |
| Type       | `list of map`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `volumeSnapshots.$name.namespace`

Define the namespace for this object

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `volumeSnapshots.$name.namespace` |
| Type       | `string`                          |
| Required   | ❌                                |
| Helm `tpl` | ✅                                |
| Default    | `""`                              |

Example

```yaml
volumeSnapshots:
  $name:
    namespace: ""
```

---

### `volumeSnapshots.$name.source`

Define the source of the volume snapshot At least one of the following keys must be defined

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `volumeSnapshots.$name.source` |
| Type       | `map`                          |
| Required   | ✅                             |
| Helm `tpl` | ❌                             |
| Default    | `{}`                           |

Example

```yaml
volumeSnapshots:
  $name:
    source:
      {}
```

---

### `volumeSnapshots.$name.volumeSnapshotClassName`

Define the name of the volume snapshot class used to create the snapshot

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `volumeSnapshots.$name.volumeSnapshotClassName` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

## Full Examples

```yaml
volumeSnapshots:
  example1:
    enabled: true
    source:
      volumeSnapshotContentName: some-name
  example2:
    enabled: true
    source:
      persistentVolumeClaimName: some-pvc-name
```
