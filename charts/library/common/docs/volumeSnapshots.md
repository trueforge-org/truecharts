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
| Type       | `map, string`                       |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `{}`                                |

Example

```yaml
volumeSnapshots:
  $name:
    annotations:
      {}
```

---

### `volumeSnapshots.$name.enabled`

Enable volume snapshot

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `volumeSnapshots.$name.enabled` |
| Type       | `boolean, string`               |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
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
| Type       | `map, string`                  |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `{}`                           |

Example

```yaml
volumeSnapshots:
  $name:
    labels:
      {}
```

---

### `volumeSnapshots.$name.source`

Define the source of the volume snapshot At least one of the following keys must be defined

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `volumeSnapshots.$name.source` |
| Type       | `map`                          |
| Required   | ❌                             |
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
