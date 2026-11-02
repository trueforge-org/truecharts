---
title: Labelselector
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/labelSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.labelSelector`

---

## `networkpolicy.labelSelector`

Kubernetes label selector.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.labelSelector` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `networkpolicy.labelSelector.matchExpressions`

Match pods using label expressions.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `networkpolicy.labelSelector.matchExpressions` |
| Type       | `list of map`                                  |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `networkpolicy.labelSelector.matchLabels`

Match pods with all of these labels.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `networkpolicy.labelSelector.matchLabels` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---
