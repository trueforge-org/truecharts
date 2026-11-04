---
title: Spread
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/spread#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.spread`

---

## `dependencies.valkey.operator.scheduling.spread`

No description provided.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.spread` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

---

### `dependencies.valkey.operator.scheduling.spread.pods`

Spread of all the pods of the cluster. Disabled when unset.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.spread.pods` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.scheduling.spread.primaries`

Spread of the pod that starts as the primary of each shard (node-index 0). Disabled when unset.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.spread.primaries` |
| Type       | `map`                                                      |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `dependencies.valkey.operator.scheduling.spread.shard`

Spread of the pods of each shard. Disabled when unset.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.spread.shard` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---
