---
title: Secret
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/secret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.secret`

---

## `persistence.secret`

Create Secret objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `persistence.secret` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `persistence.secret.$name.annotations`

Additional annotations for secret

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `persistence.secret.$name.annotations` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `persistence.secret.$name.data`

Create Secret objects

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `persistence.secret.$name.data` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `persistence.secret.$name.enabled`

Enables or Disables the Secret

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `persistence.secret.$name.enabled` |
| Type       | `boolean, string`                  |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `persistence.secret.$name.labels`

Additional labels for secret

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `persistence.secret.$name.labels` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `persistence.secret.$name.namespace`

Define the namespace for this object

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `persistence.secret.$name.namespace` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `persistence.secret.$name.type`

Define the type of the secret

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `persistence.secret.$name.type` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

## Full Examples

```yaml
persistence:
  secret-vol:
    enabled: true
    type: secret
    objectName: secret-name
    expandObjectName: false
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
```
