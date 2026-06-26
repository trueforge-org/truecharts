---
title: Serviceaccount
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/serviceAccount#full-examples) section for complete examples.

:::

## Appears in

- `.Values.serviceAccount`

---

## `serviceAccount`

Create serviceAccount objects

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `serviceAccount` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `serviceAccount.$name.annotations`

Additional annotations for service account

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `serviceAccount.$name.annotations` |
| Type       | `map, string`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `{}`                               |

Example

```yaml
serviceAccount:
  $name:
    annotations:
      {}
```

---

### `serviceAccount.$name.enabled`

Enables or Disables the serviceAccount

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `serviceAccount.$name.enabled` |
| Type       | `boolean, string`              |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `false`                        |

Example

```yaml
serviceAccount:
  $name:
    enabled: false
```

---

### `serviceAccount.$name.labels`

Additional labels for service account

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `serviceAccount.$name.labels` |
| Type       | `map, string`                 |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `{}`                          |

Example

```yaml
serviceAccount:
  $name:
    labels:
      {}
```

---

### `serviceAccount.$name.namespace`

Define the namespace for this object

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `serviceAccount.$name.namespace` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `""`                             |

Example

```yaml
serviceAccount:
  $name:
    namespace: ""
```

---

### `serviceAccount.$name.primary`

Sets the serviceAccount as primary

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `serviceAccount.$name.primary` |
| Type       | `boolean`                      |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `false`                        |

Example

```yaml
serviceAccount:
  $name:
    primary: false
```

---

### `serviceAccount.$name.targetSelectAll`

Whether to assign the serviceAccount to all pods or not

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `serviceAccount.$name.targetSelectAll` |
| Type       | `boolean`                              |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `serviceAccount.$name.targetSelector`

Create serviceAccount objects

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `serviceAccount.$name.targetSelector` |
| Type       | `list of string`                      |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `[]`                                  |

Example

```yaml
serviceAccount:
  $name:
    targetSelector:
      []
```

---

## Full Examples

```yaml
serviceAccount:
  sa-name:
    enabled: true
    primary: true
    namespace: some-namespace
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    targetSelectAll: true

  other-sa-name:
    enabled: true
    namespace: some-namespace
    targetSelector:
      - pod-name
      - other-pod-name
```
