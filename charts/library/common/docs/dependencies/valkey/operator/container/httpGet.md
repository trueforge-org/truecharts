---
title: Httpget
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/httpGet#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.httpGet`

---

## `dependencies.valkey.operator.container.httpGet`

Request to an HTTP endpoint of the container.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.httpGet` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

---

### `dependencies.valkey.operator.container.httpGet.host`

Host to request, defaults to the pod IP.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.httpGet.host` |
| Type       | `string`                                              |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.httpGet.httpHeaders`

Headers to set in the request.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.httpGet.httpHeaders` |
| Type       | `list of map`                                                |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `dependencies.valkey.operator.container.httpGet.path`

Path to request.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.httpGet.path` |
| Type       | `string`                                              |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.httpGet.port`

Port (number or name of a container port) to request.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.httpGet.port` |
| Type       | `integer, string`                                     |
| Required   | ✅                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.httpGet.protocol`

HTTP protocol version to use.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.httpGet.protocol` |
| Type       | `string`                                                  |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |
| Enum       | `HTTP1`, `HTTP2`                                          |

---

### `dependencies.valkey.operator.container.httpGet.scheme`

Scheme to use.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.httpGet.scheme` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |
| Enum       | `HTTP`, `HTTPS`                                         |

---
