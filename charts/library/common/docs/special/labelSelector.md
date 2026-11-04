---
title: Labelselector
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/special/labelSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.special.labelSelector`

---

## `special.labelSelector`

A label selector, matches by labels and label expressions.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `special.labelSelector` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `special.labelSelector.matchExpressions`

Match by label expressions.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `special.labelSelector.matchExpressions` |
| Type       | `list of map`                            |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `special.labelSelector.matchLabels`

Match by labels.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `special.labelSelector.matchLabels` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---
