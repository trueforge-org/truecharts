---
title: Nodeaffinity
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/nodeAffinity#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity.nodeAffinity`

---

## `dependencies.valkey.operator.scheduling.affinity.nodeAffinity`

No description provided.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity` |
| Type       | `map`                                                           |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution`

Terms the node should match.

| Field      | Value                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type       | `list of map`                                                                                                   |
| Required   | ❌                                                                                                              |
| Helm `tpl` | ❌                                                                                                              |
| Default    | unset                                                                                                           |

---

### `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution`

Terms the node must match.

| Field      | Value                                                                                                          |
| ---------- | -------------------------------------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type       | `map`                                                                                                          |
| Required   | ❌                                                                                                             |
| Helm `tpl` | ❌                                                                                                             |
| Default    | unset                                                                                                          |

---
