---
title: Storageclass
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/storageClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.storageClass`

---

## `storageClass`

Define storage classes

| Field      | Value          |
| ---------- | -------------- |
| Key        | `storageClass` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

### `storageClass.$name.allowVolumeExpansion`

Define if volume expansion is allowed for this storage class

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `storageClass.$name.allowVolumeExpansion` |
| Type       | `boolean`                                 |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `false`                                   |

Example

```yaml
storageClass:
  $name:
    allowVolumeExpansion: false
```

---

### `storageClass.$name.annotations`

Additional annotations for storage class

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `storageClass.$name.annotations` |
| Type       | `map, string`                    |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `{}`                             |

Example

```yaml
storageClass:
  $name:
    annotations:
      {}
```

---

### `storageClass.$name.enabled`

Enables or Disables the storage class

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `storageClass.$name.enabled` |
| Type       | `boolean, string`            |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `false`                      |

Example

```yaml
storageClass:
  $name:
    enabled: false
```

---

### `storageClass.$name.labels`

Additional labels for storage class

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `storageClass.$name.labels` |
| Type       | `map, string`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `{}`                        |

Example

```yaml
storageClass:
  $name:
    labels:
      {}
```

---

### `storageClass.$name.mountOptions`

Define storage classes

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `storageClass.$name.mountOptions` |
| Type       | `list, string`                    |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `[]`                              |

Example

```yaml
storageClass:
  $name:
    mountOptions:
      []
```

---

### `storageClass.$name.parameters`

Define the parameters for this storage class

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `storageClass.$name.parameters` |
| Type       | `map, string`                   |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `{}`                            |

Example

```yaml
storageClass:
  $name:
    parameters:
      {}
```

---

### `storageClass.$name.provisioner`

Define the provisioner for this storage class

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `storageClass.$name.provisioner` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `storageClass.$name.reclaimPolicy`

Define the reclaim policy for this storage class

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `storageClass.$name.reclaimPolicy` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `"Retain"`                         |
| Enum       | `Delete`, `Retain`                 |

Example

```yaml
storageClass:
  $name:
    reclaimPolicy: Retain
```

---

### `storageClass.$name.volumeBindingMode`

Define the volume binding mode for this storage class

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `storageClass.$name.volumeBindingMode` |
| Type       | `string`                               |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `"Immediate"`                          |
| Enum       | `Immediate`, `WaitForFirstConsumer`    |

Example

```yaml
storageClass:
  $name:
    volumeBindingMode: Immediate
```

---

## Full Examples

```yaml
storageClass:
  example:
    provisioner: some.provisioner.io
    enabled: true
    parameters:
      param1: value1
      param2: value2
    reclaimPolicy: retain
    allowVolumeExpansion: true
    volumeBindingMode: Immediate
    mountOptions:
      - option1
      - option2=value
```
