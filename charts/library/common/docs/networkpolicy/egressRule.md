---
title: Egressrule
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/egressRule#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.egressRule`

---

## `networkpolicy.egressRule`

An egress rule.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `networkpolicy.egressRule` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `networkpolicy.egressRule.ports`

Ports allowed by this rule.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.egressRule.ports` |
| Type       | `list of unknown`                |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `networkpolicy.egressRule.to`

Peers that may receive traffic.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.egressRule.to` |
| Type       | `list of unknown`             |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `networkpolicy.egressRule.toEntities`

Cilium only: entities (for example `world`, `cluster`, `host` or `all`) allowed to receive traffic. Ignored for Kubernetes NetworkPolicies.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `networkpolicy.egressRule.toEntities` |
| Type       | `list of string`                      |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---
