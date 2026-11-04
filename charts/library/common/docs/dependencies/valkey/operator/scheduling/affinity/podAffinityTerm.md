---
title: Podaffinityterm
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinityTerm#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity.podAffinityTerm`

---

## `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm`

No description provided.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm` |
| Type       | `map`                                                              |
| Required   | ❌                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.labelSelector`

Pods the term matches.

| Field      | Value                                                                            |
| ---------- | -------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.labelSelector` |
| Type       | `map`                                                                            |
| Required   | ❌                                                                               |
| Helm `tpl` | ❌                                                                               |
| Default    | unset                                                                            |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field      | Value                                                                             |
| ---------- | --------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.matchLabelKeys` |
| Type       | `list of string`                                                                  |
| Required   | ❌                                                                                |
| Helm `tpl` | ❌                                                                                |
| Default    | unset                                                                             |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field      | Value                                                                                |
| ---------- | ------------------------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.mismatchLabelKeys` |
| Type       | `list of string`                                                                     |
| Required   | ❌                                                                                   |
| Helm `tpl` | ❌                                                                                   |
| Default    | unset                                                                                |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.namespaceSelector`

Namespaces the term matches, by their labels.

| Field      | Value                                                                                |
| ---------- | ------------------------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.namespaceSelector` |
| Type       | `map`                                                                                |
| Required   | ❌                                                                                   |
| Helm `tpl` | ❌                                                                                   |
| Default    | unset                                                                                |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field      | Value                                                                         |
| ---------- | ----------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.namespaces` |
| Type       | `list of string`                                                              |
| Required   | ❌                                                                            |
| Helm `tpl` | ❌                                                                            |
| Default    | unset                                                                         |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.topologyKey`

Node label key that defines the domain.

| Field      | Value                                                                          |
| ---------- | ------------------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinityTerm.topologyKey` |
| Type       | `string`                                                                       |
| Required   | ✅                                                                             |
| Helm `tpl` | ❌                                                                             |
| Default    | unset                                                                          |

---
