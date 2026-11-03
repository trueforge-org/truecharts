---
title: Configmap
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/configmap#full-examples) section for complete examples.

:::

## Appears in

- `.Values.configmap`

---

## `configmap`

Create Configmap objects

| Field      | Value       |
| ---------- | ----------- |
| Key        | `configmap` |
| Type       | `map`       |
| Required   | ❌          |
| Helm `tpl` | ❌          |
| Default    | unset       |

---

### `configmap.$name.annotations`

Additional annotations for configmap

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `configmap.$name.annotations` |
| Type       | `map, string`                 |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `{}`                          |

Example

```yaml
configmap:
  $name:
    annotations:
      {}
```

---

### `configmap.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `configmap.$name.annotationsList` |
| Type       | `list of map`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `configmap.$name.data`

Data entries of the ConfigMap, keyed by file or variable name

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `configmap.$name.data` |
| Type       | `map, string`          |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `configmap.$name.enabled`

Enables or Disables the Configmap

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `configmap.$name.enabled` |
| Type       | `boolean, string`         |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `false`                   |

Example

```yaml
configmap:
  $name:
    enabled: false
```

---

### `configmap.$name.expandObjectName`

Prefix the object name with the chart fullname

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `configmap.$name.expandObjectName` |
| Type       | `boolean, string`                  |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `true`                             |

Example

```yaml
configmap:
  $name:
    expandObjectName: true
```

---

### `configmap.$name.labels`

Additional labels for configmap

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `configmap.$name.labels` |
| Type       | `map, string`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
configmap:
  $name:
    labels:
      {}
```

---

### `configmap.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `configmap.$name.labelsList` |
| Type       | `list of map`                |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `configmap.$name.namespace`

Define the namespace for this object

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `configmap.$name.namespace` |
| Type       | `string`                    |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `""`                        |

Example

```yaml
configmap:
  $name:
    namespace: ""
```

---

## Full Examples

```yaml
configmap:
  configmap-name:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value

  other-configmap-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
```
