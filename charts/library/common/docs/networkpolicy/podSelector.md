---
title: Podselector
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/podSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.podSelector`

---

## `networkpolicy.podSelector`

Kubernetes label selector, or a Helm template that renders one.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `networkpolicy.podSelector` |
| Type       | `map, string`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `networkpolicy.podSelector.matchExpressions`

Match pods using label expressions.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `networkpolicy.podSelector.matchExpressions` |
| Type       | `list of map`                                |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `networkpolicy.podSelector.matchLabels`

Match pods with all of these labels.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `networkpolicy.podSelector.matchLabels` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---
