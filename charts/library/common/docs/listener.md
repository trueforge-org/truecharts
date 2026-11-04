---
title: Listener
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/listener#full-examples) section for complete examples.

:::

## Appears in

- `.Values.listener`

---

## `listener`

A listener of a Gateway or ListenerSet.

| Field      | Value      |
| ---------- | ---------- |
| Key        | `listener` |
| Type       | `map`      |
| Required   | ❌         |
| Helm `tpl` | ❌         |
| Default    | unset      |

---

### `listener.allowedRoutes`

Routes that can attach to the listener.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `listener.allowedRoutes` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `listener.hostname`

Hostname of the listener, supports Helm `tpl`.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `listener.hostname` |
| Type       | `null, string`      |
| Required   | ❌                  |
| Helm `tpl` | ✅                  |
| Default    | unset               |

---

### `listener.name`

Name of the listener, unique within the Gateway.

| Field      | Value           |
| ---------- | --------------- |
| Key        | `listener.name` |
| Type       | `string`        |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |
| Min Length | `1`             |

---

### `listener.port`

Port of the listener.

| Field      | Value           |
| ---------- | --------------- |
| Key        | `listener.port` |
| Type       | `integer`       |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |
| Minimum    | `1`             |

---

### `listener.protocol`

Protocol of the listener, eg `HTTP`, `HTTPS`, `TLS`, `TCP` or `UDP`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `listener.protocol`                  |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |
| Enum       | `HTTP`, `HTTPS`, `TCP`, `TLS`, `UDP` |

---

### `listener.tls`

TLS settings of the listener.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `listener.tls` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---
