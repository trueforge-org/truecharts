---
title: Tcpsocket
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/tcpSocket#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.tcpSocket`

---

## `dependencies.valkey.operator.container.tcpSocket`

Connection to a TCP port of the container.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.tcpSocket` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.container.tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.tcpSocket.host` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `dependencies.valkey.operator.container.tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.tcpSocket.port` |
| Type       | `integer, string`                                       |
| Required   | ✅                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---
