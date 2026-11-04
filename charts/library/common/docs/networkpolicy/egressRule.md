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

### `networkpolicy.egressRule.icmps`

Cilium only: ICMP types the rule allows.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.egressRule.icmps` |
| Type       | `list of unknown`                |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

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

### `networkpolicy.egressRule.toCIDR`

Cilium only: CIDRs the rule allows.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.egressRule.toCIDR` |
| Type       | `list of string`                  |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `networkpolicy.egressRule.toCIDRSet`

Cilium only: CIDRs with exceptions the rule allows.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.egressRule.toCIDRSet` |
| Type       | `list of unknown`                    |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `networkpolicy.egressRule.toEndpoints`

Cilium only: endpoints, by labels, the rule allows.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `networkpolicy.egressRule.toEndpoints` |
| Type       | `list of unknown`                      |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

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

### `networkpolicy.egressRule.toFQDNs`

Cilium only: domain names the rule allows, eg `matchName` or `matchPattern`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.egressRule.toFQDNs` |
| Type       | `list of unknown`                  |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `networkpolicy.egressRule.toPorts`

Cilium only: ports, with optional L7 rules, the rule allows.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.egressRule.toPorts` |
| Type       | `list of unknown`                  |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `networkpolicy.egressRule.toServices`

Cilium only: kubernetes services the rule allows.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `networkpolicy.egressRule.toServices` |
| Type       | `list of unknown`                     |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---
