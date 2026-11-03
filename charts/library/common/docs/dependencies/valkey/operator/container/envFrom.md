---
title: Envfrom
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/envFrom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.envFrom`

---

## `dependencies.valkey.operator.container.envFrom`

Source of environment variables of the container.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.envFrom` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

---

### `dependencies.valkey.operator.container.envFrom.configMapRef`

ConfigMap to take the variables from.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.envFrom.configMapRef` |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.valkey.operator.container.envFrom.prefix`

Prefix added to the names of the variables.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.envFrom.prefix` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `dependencies.valkey.operator.container.envFrom.secretRef`

Secret to take the variables from.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.envFrom.secretRef` |
| Type       | `map`                                                      |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---
