---
title: Affinity
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/affinity#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity`

---

## `dependencies.valkey.operator.scheduling.affinity`

No description provided.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.scheduling.affinity.nodeAffinity`

Node affinity of the pods.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity` |
| Type       | `map`                                                           |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinity`

Pod affinity of the pods.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinity` |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity`

Pod anti-affinity of the pods.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity` |
| Type       | `map`                                                              |
| Required   | ❌                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |

---

## Child Pages

- [Nodeaffinity](nodeAffinity.md)
- [Nodeselectorterm](nodeSelectorTerm.md)
- [Podaffinity](podAffinity.md)
- [Podaffinityterm](podAffinityTerm.md)

---
