---
title: Toleration
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/toleration#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.toleration`

---

## `dependencies.valkey.operator.scheduling.toleration`

No description provided.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.toleration` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `dependencies.valkey.operator.scheduling.toleration.effect`

Effect of the taint the toleration matches. Matches all effects when unset.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.toleration.effect` |
| Type       | `string`                                                    |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |
| Enum       | `NoSchedule`, `PreferNoSchedule`, `NoExecute`               |

---

### `dependencies.valkey.operator.scheduling.toleration.key`

Key of the taint the toleration matches. Matches all keys with `Exists` when unset.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.toleration.key` |
| Type       | `string`                                                 |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `dependencies.valkey.operator.scheduling.toleration.operator`

How the value of the taint is compared. Defaults to `Equal` in Kubernetes.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.toleration.operator` |
| Type       | `string`                                                      |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |
| Enum       | `Exists`, `Equal`, `Lt`, `Gt`                                 |

---

### `dependencies.valkey.operator.scheduling.toleration.tolerationSeconds`

Seconds the pod stays on a node with a matching `NoExecute` taint.

| Field      | Value                                                                  |
| ---------- | ---------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.toleration.tolerationSeconds` |
| Type       | `integer`                                                              |
| Required   | ❌                                                                     |
| Helm `tpl` | ❌                                                                     |
| Default    | unset                                                                  |

---

### `dependencies.valkey.operator.scheduling.toleration.value`

Value of the taint the toleration matches, with `Equal`, `Lt` and `Gt`.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.toleration.value` |
| Type       | `string`                                                   |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---
