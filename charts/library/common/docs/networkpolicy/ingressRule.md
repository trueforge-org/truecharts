---
title: Ingressrule
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/ingressRule#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.ingressRule`

---

## `networkpolicy.ingressRule`

An ingress rule.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `networkpolicy.ingressRule` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `networkpolicy.ingressRule.from`

Peers allowed to send traffic.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.ingressRule.from` |
| Type       | `list of unknown`                |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `networkpolicy.ingressRule.ports`

Ports allowed by this rule.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.ingressRule.ports` |
| Type       | `list of unknown`                 |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---
