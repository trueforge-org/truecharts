---
title: Resourcerequirements
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/resourceRequirements#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.resourceRequirements`

---

## `dependencies.valkey.operator.resourceRequirements`

No description provided.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.operator.resourceRequirements` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `dependencies.valkey.operator.resourceRequirements.claims`

Dynamic resource claims of the container.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.resourceRequirements.claims` |
| Type       | `list of map`                                              |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `dependencies.valkey.operator.resourceRequirements.limits`

Maximum amount of each resource the container can use, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.resourceRequirements.limits` |
| Type       | `map`                                                      |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `dependencies.valkey.operator.resourceRequirements.requests`

Minimum amount of each resource the container needs, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.resourceRequirements.requests` |
| Type       | `map`                                                        |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---
