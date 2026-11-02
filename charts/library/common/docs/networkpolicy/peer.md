---
title: Peer
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/peer#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.peer`

---

## `networkpolicy.peer`

A peer allowed by a NetworkPolicy rule.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `networkpolicy.peer` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `networkpolicy.peer.ipBlock`

No description provided.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `networkpolicy.peer.ipBlock` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `networkpolicy.peer.namespaceSelector`

Select namespaces by labels.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `networkpolicy.peer.namespaceSelector` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Namespaceselector](labelSelector.md) for full configuration.

---

### `networkpolicy.peer.podSelector`

Select pods in the policy namespace.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.peer.podSelector` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Podselector](labelSelector.md) for full configuration.

---
