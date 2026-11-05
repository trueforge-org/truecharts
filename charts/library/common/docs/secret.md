---
title: Secret
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/secret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.secret`

---

## `secret`

Create Secret objects

| Field      | Value    |
| ---------- | -------- |
| Key        | `secret` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `secret.$name.annotations`

Additional annotations for secret

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `secret.$name.annotations` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ✅ (On value only)          |
| Default    | `{}`                       |

Example

```yaml
secret:
  $name:
    annotations:
      {}
```

---

### `secret.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `secret.$name.annotationsList` |
| Type       | `list of map`                  |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `secret.$name.data`

Data of the Secret, keyed by name.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `secret.$name.data` |
| Type       | `map`               |
| Required   | ✅                  |
| Helm `tpl` | ✅                  |
| Default    | unset               |

---

### `secret.$name.enabled`

Enables or Disables the Secret

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `secret.$name.enabled` |
| Type       | `boolean, string`      |
| Required   | ✅                     |
| Helm `tpl` | ✅                     |
| Default    | `false`                |

Example

```yaml
secret:
  $name:
    enabled: false
```

---

### `secret.$name.labels`

Additional labels for secret

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `secret.$name.labels` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ✅ (On value only)     |
| Default    | `{}`                  |

Example

```yaml
secret:
  $name:
    labels:
      {}
```

---

### `secret.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `secret.$name.labelsList` |
| Type       | `list of map`             |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `secret.$name.namespace`

Define the namespace for this object

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `secret.$name.namespace` |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ✅                       |
| Default    | `""`                     |

Example

```yaml
secret:
  $name:
    namespace: ""
```

---

### `secret.$name.type`

Define the type of the secret

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `secret.$name.type` |
| Type       | `string`            |
| Required   | ❌                  |
| Helm `tpl` | ✅                  |
| Default    | `"Opaque"`          |

Example

```yaml
secret:
  $name:
    type: Opaque
```

---

## Full Examples

```yaml
secret:
  secret-name:
    enabled: true
    type: CustomSecretType
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value

  other-secret-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
```
