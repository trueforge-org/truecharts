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

### `networkpolicy.ingressRule.fromCIDR`

Cilium only: CIDRs the rule allows.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.ingressRule.fromCIDR` |
| Type       | `list of string`                     |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `networkpolicy.ingressRule.fromCIDRSet`

Cilium only: CIDRs with exceptions the rule allows.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `networkpolicy.ingressRule.fromCIDRSet` |
| Type       | `list of unknown`                       |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `networkpolicy.ingressRule.fromEndpoints`

Cilium only: endpoints, by labels, the rule allows.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `networkpolicy.ingressRule.fromEndpoints` |
| Type       | `list of unknown`                         |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `networkpolicy.ingressRule.fromEntities`

Cilium only: entities (for example `world`, `cluster`, `host` or `all`) allowed to send traffic. Ignored for Kubernetes NetworkPolicies.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `networkpolicy.ingressRule.fromEntities` |
| Type       | `list of string`                         |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `networkpolicy.ingressRule.icmps`

Cilium only: ICMP types the rule allows.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.ingressRule.icmps` |
| Type       | `list of unknown`                 |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

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

### `networkpolicy.ingressRule.toPorts`

Cilium only: ports, with optional L7 rules, the rule allows.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `networkpolicy.ingressRule.toPorts` |
| Type       | `list of unknown`                   |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---
