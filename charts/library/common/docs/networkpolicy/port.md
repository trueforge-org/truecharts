---
title: Port
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/port#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.port`

---

## `networkpolicy.port`

Port or port range for a NetworkPolicy rule.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `networkpolicy.port` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `networkpolicy.port.endPort`

End of an inclusive port range.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `networkpolicy.port.endPort` |
| Type       | `integer`                    |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |
| Minimum    | `1`                          |

---

### `networkpolicy.port.port`

Port number or named port. Omit to match all ports.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `networkpolicy.port.port` |
| Type       | `integer, string, null`   |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `networkpolicy.port.protocol`

No description provided.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.port.protocol` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |
| Enum       | `TCP`, `UDP`, `SCTP`          |

---
