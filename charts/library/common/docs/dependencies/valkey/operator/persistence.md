---
title: Persistence
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/persistence#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.persistence`

---

## `dependencies.valkey.operator.persistence`

No description provided.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.valkey.operator.persistence` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.valkey.operator.persistence.enabled`

Whether the nodes have a volume.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.persistence.enabled` |
| Type       | `boolean`                                          |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | `true`                                             |

Example

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        enabled: true
```

---

### `dependencies.valkey.operator.persistence.retain`

Whether the volumes are retained when a node is deleted. Defaults to `global.fallbackDefaults.pvcRetain`.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.valkey.operator.persistence.retain` |
| Type       | `boolean`                                         |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `false`                                           |

Example

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        retain: false
```

---

### `dependencies.valkey.operator.persistence.size`

Size of the volume of every node. Defaults to `global.fallbackDefaults.vctSize`.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `dependencies.valkey.operator.persistence.size` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | `""`                                            |

Example

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        size: ""
```

---

### `dependencies.valkey.operator.persistence.storageClass`

Storage class of the volumes. Defaults to `global.fallbackDefaults.storageClass`.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.persistence.storageClass` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | `""`                                                    |

Example

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        storageClass: ""
```

---
