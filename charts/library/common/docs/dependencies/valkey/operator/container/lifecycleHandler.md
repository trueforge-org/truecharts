---
title: Lifecyclehandler
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/lifecycleHandler#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.lifecycleHandler`

---

## `dependencies.valkey.operator.container.lifecycleHandler`

Handler of a lifecycle hook of the container.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycleHandler` |
| Type       | `map`                                                     |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `dependencies.valkey.operator.container.lifecycleHandler.exec`

Run a command in the container.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycleHandler.exec` |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.valkey.operator.container.lifecycleHandler.httpGet`

Request to an HTTP endpoint of the container.

| Field      | Value                                                             |
| ---------- | ----------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycleHandler.httpGet` |
| Type       | `map`                                                             |
| Required   | ❌                                                                |
| Helm `tpl` | ❌                                                                |
| Default    | unset                                                             |

---

### `dependencies.valkey.operator.container.lifecycleHandler.sleep`

Sleep for a number of seconds.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycleHandler.sleep` |
| Type       | `map`                                                           |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.valkey.operator.container.lifecycleHandler.tcpSocket`

Connection to a TCP port of the container.

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycleHandler.tcpSocket` |
| Type       | `map`                                                               |
| Required   | ❌                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | unset                                                               |

---
