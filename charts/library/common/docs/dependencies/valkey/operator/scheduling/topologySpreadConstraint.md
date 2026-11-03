---
title: Topologyspreadconstraint
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/topologySpreadConstraint#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.topologySpreadConstraint`

---

## `dependencies.valkey.operator.scheduling.topologySpreadConstraint`

No description provided.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint` |
| Type       | `map`                                                              |
| Required   | ❌                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.labelSelector`

Pods the constraint counts.

| Field      | Value                                                                            |
| ---------- | -------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.labelSelector` |
| Type       | `map`                                                                            |
| Required   | ❌                                                                               |
| Helm `tpl` | ❌                                                                               |
| Default    | unset                                                                            |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`.

| Field      | Value                                                                             |
| ---------- | --------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.matchLabelKeys` |
| Type       | `list of string`                                                                  |
| Required   | ❌                                                                                |
| Helm `tpl` | ❌                                                                                |
| Default    | unset                                                                             |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.maxSkew`

Maximum difference in the number of matching pods between two domains.

| Field      | Value                                                                      |
| ---------- | -------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.maxSkew` |
| Type       | `integer`                                                                  |
| Required   | ✅                                                                         |
| Helm `tpl` | ❌                                                                         |
| Default    | unset                                                                      |
| Minimum    | `1`                                                                        |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.minDomains`

Minimum number of eligible domains.

| Field      | Value                                                                         |
| ---------- | ----------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.minDomains` |
| Type       | `integer`                                                                     |
| Required   | ❌                                                                            |
| Helm `tpl` | ❌                                                                            |
| Default    | unset                                                                         |
| Minimum    | `1`                                                                           |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.nodeAffinityPolicy`

Whether the node affinity of the pod is honored when counting the domains.

| Field      | Value                                                                                 |
| ---------- | ------------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.nodeAffinityPolicy` |
| Type       | `string`                                                                              |
| Required   | ❌                                                                                    |
| Helm `tpl` | ❌                                                                                    |
| Default    | unset                                                                                 |
| Enum       | `Honor`, `Ignore`                                                                     |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.nodeTaintsPolicy`

Whether the taints of the nodes are honored when counting the domains.

| Field      | Value                                                                               |
| ---------- | ----------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.nodeTaintsPolicy` |
| Type       | `string`                                                                            |
| Required   | ❌                                                                                  |
| Helm `tpl` | ❌                                                                                  |
| Default    | unset                                                                               |
| Enum       | `Honor`, `Ignore`                                                                   |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.topologyKey`

Node label key that defines a domain.

| Field      | Value                                                                          |
| ---------- | ------------------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.topologyKey` |
| Type       | `string`                                                                       |
| Required   | ✅                                                                             |
| Helm `tpl` | ❌                                                                             |
| Default    | unset                                                                          |

---

### `dependencies.valkey.operator.scheduling.topologySpreadConstraint.whenUnsatisfiable`

What to do when the constraint can not be satisfied: keep the pod `Pending`, or schedule it anyway.

| Field      | Value                                                                                |
| ---------- | ------------------------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.topologySpreadConstraint.whenUnsatisfiable` |
| Type       | `string`                                                                             |
| Required   | ✅                                                                                   |
| Helm `tpl` | ❌                                                                                   |
| Default    | unset                                                                                |
| Enum       | `DoNotSchedule`, `ScheduleAnyway`                                                    |

---
