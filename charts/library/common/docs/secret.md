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
| Type       | `map, string`              |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `{}`                       |

Example

```yaml
secret:
  $name:
    annotations:
      {}
```

---

### `secret.$name.data`

Create Secret objects

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `secret.$name.data` |
| Type       | `map, string`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `secret.$name.enabled`

Enables or Disables the Secret

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `secret.$name.enabled` |
| Type       | `boolean, string`      |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
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
| Type       | `map, string`         |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `{}`                  |

Example

```yaml
secret:
  $name:
    labels:
      {}
```

---

### `secret.$name.namespace`

Define the namespace for this object

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `secret.$name.namespace` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
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
| Helm `tpl` | ❌                  |
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
