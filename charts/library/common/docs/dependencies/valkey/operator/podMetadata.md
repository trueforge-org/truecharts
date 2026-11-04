---
title: Podmetadata
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/podMetadata#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.podMetadata`

---

## `dependencies.valkey.operator.podMetadata`

No description provided.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.valkey.operator.podMetadata` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.valkey.operator.podMetadata.annotations`

Annotations of the pods.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.podMetadata.annotations` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | `{}`                                                   |

Example

```yaml
dependencies:
  valkey:
    operator:
      podMetadata:
        annotations:
          {}
```

---

### `dependencies.valkey.operator.podMetadata.labels`

Labels of the pods.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podMetadata.labels` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `{}`                                              |

Example

```yaml
dependencies:
  valkey:
    operator:
      podMetadata:
        labels:
          {}
```

---
