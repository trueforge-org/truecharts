---
title: Scheduling
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling`

---

## `dependencies.valkey.operator.scheduling`

No description provided.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `dependencies.valkey.operator.scheduling.affinity`

Node and pod affinity of the pods.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.scheduling.node`

Distribution of the pods across the nodes.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.node` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `dependencies.valkey.operator.scheduling.nodeSelector`

Labels the nodes of the pods must have.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.nodeSelector` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `dependencies.valkey.operator.scheduling.priorityClassName`

Name of the PriorityClass of the pods.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.priorityClassName` |
| Type       | `string`                                                    |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `dependencies.valkey.operator.scheduling.tolerations`

Tolerations of the pods.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.tolerations` |
| Type       | `list of unknown`                                     |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraints`

Topology spread constraints of the pods, for topology keys other than the hostname and the zone (use `node.spread` and `zone.spread` for those).

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraints` |
| Type       | `list of unknown`                                                   |
| Required   | ❌                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | unset                                                               |

---

### `dependencies.valkey.operator.scheduling.zone`

Distribution and pinning of the pods across the zones.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.zone` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

## Child Pages

- [Affinity](affinity/)
- [Spread](spread.md)
- [Toleration](toleration.md)
- [Topologyspreadconstraint](topologySpreadConstraint.md)

---
