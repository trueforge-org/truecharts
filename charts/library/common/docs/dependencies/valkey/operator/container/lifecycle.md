---
title: Lifecycle
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/lifecycle#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.lifecycle`

---

## `dependencies.valkey.operator.container.lifecycle`

Lifecycle hooks of the container.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycle` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.container.lifecycle.postStart`

Handler run right after the container started.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.lifecycle.postStart` |
| Type       | `map`                                                        |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `dependencies.valkey.operator.container.lifecycle.preStop`

Handler run before the container is stopped.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycle.preStop` |
| Type       | `map`                                                      |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `dependencies.valkey.operator.container.lifecycle.stopSignal`

Signal sent to the container to stop it, instead of the default.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycle.stopSignal` |
| Type       | `string`                                                      |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |
| Enum       | 34 values                                                     |

---
