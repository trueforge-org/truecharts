---
title: Priorityclass
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/priorityClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.priorityClass`

---

## `priorityClass`

Define priority classes

| Field      | Value           |
| ---------- | --------------- |
| Key        | `priorityClass` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

---

### `priorityClass.$name.annotations`

Additional annotations for priority class

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `priorityClass.$name.annotations` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ✅ (On value only)                 |
| Default    | `{}`                              |

Example

```yaml
priorityClass:
  $name:
    annotations:
      {}
```

---

### `priorityClass.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `priorityClass.$name.annotationsList` |
| Type       | `list of map`                         |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `priorityClass.$name.description`

Define the description for this priority class

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `priorityClass.$name.description` |
| Type       | `string`                          |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `"No description given"`          |

Example

```yaml
priorityClass:
  $name:
    description: No description given
```

---

### `priorityClass.$name.enabled`

Enables or Disables the priority class

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `priorityClass.$name.enabled` |
| Type       | `boolean, string`             |
| Required   | ✅                            |
| Helm `tpl` | ✅                            |
| Default    | `false`                       |

Example

```yaml
priorityClass:
  $name:
    enabled: false
```

---

### `priorityClass.$name.globalDefault`

Define if this priority class is the global default

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `priorityClass.$name.globalDefault` |
| Type       | `boolean`                           |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `false`                             |

Example

```yaml
priorityClass:
  $name:
    globalDefault: false
```

---

### `priorityClass.$name.labels`

Additional labels for priority class

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `priorityClass.$name.labels` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ✅ (On value only)            |
| Default    | `{}`                         |

Example

```yaml
priorityClass:
  $name:
    labels:
      {}
```

---

### `priorityClass.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `priorityClass.$name.labelsList` |
| Type       | `list of map`                    |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `priorityClass.$name.namespace`

Define the namespace for this object

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `priorityClass.$name.namespace` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ✅ (On value only)               |
| Default    | `""`                            |

Example

```yaml
priorityClass:
  $name:
    namespace: ""
```

---

### `priorityClass.$name.preemptionPolicy`

Define priority classes

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `priorityClass.$name.preemptionPolicy` |
| Type       | `string`                               |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `"Immediate"`                          |
| Enum       | `PreemptLowerPriority`, `Never`        |

Example

```yaml
priorityClass:
  $name:
    preemptionPolicy: Immediate
```

---

### `priorityClass.$name.provisioner`

Provisioner name for the priority class. Set in the common-test priorityclass fixture; the priority class templates ignore it.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `priorityClass.$name.provisioner` |
| Type       | `string`                          |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `priorityClass.$name.value`

Define the value for this priority class

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `priorityClass.$name.value` |
| Type       | `integer`                   |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `1000000`                   |

Example

```yaml
priorityClass:
  $name:
    value: 1000000
```

---

## Full Examples

```yaml
priorityClass:
  example:
    enabled: true
    value: 1000000
    preemptionPolicy: PreemptLowerPriority
    globalDefault: false
    description: "some description"
```
