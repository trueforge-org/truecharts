---
title: Port
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/port#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.port`

---

## `dependencies.valkey.operator.container.port`

Port of the container.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.port` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `dependencies.valkey.operator.container.port.containerPort`

Port the container listens on.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.port.containerPort` |
| Type       | `integer`                                                   |
| Required   | ✅                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |
| Minimum    | `1`                                                         |
| Maximum    | `65535`                                                     |

---

### `dependencies.valkey.operator.container.port.hostIP`

Host IP the `hostPort` is bound to.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.port.hostIP` |
| Type       | `string`                                             |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `dependencies.valkey.operator.container.port.hostPort`

Port on the host that is mapped to the `containerPort`.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.port.hostPort` |
| Type       | `integer`                                              |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |
| Minimum    | `1`                                                    |
| Maximum    | `65535`                                                |

---

### `dependencies.valkey.operator.container.port.name`

Name of the port, can be referenced by probes. At most 15 characters.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.port.name` |
| Type       | `string`                                           |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |
| Max Length | `15`                                               |

---

### `dependencies.valkey.operator.container.port.protocol`

Protocol of the port.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.port.protocol` |
| Type       | `string`                                               |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |
| Enum       | `TCP`, `UDP`, `SCTP`                                   |

---
