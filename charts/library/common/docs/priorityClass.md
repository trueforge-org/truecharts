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
| Type       | `map, string`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `{}`                              |

Example

```yaml
priorityClass:
  $name:
    annotations:
      {}
```

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
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
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
| Type       | `map, string`                |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Example

```yaml
priorityClass:
  $name:
    labels:
      {}
```

---

### `priorityClass.$name.namespace`

Define the namespace for this object

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `priorityClass.$name.namespace` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
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
