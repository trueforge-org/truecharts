---
title: Probe
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/probe#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.probe`

---

## `dependencies.valkey.operator.container.probe`

Probe of the container. Set one of `exec`, `httpGet`, `tcpSocket` or `grpc`.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `dependencies.valkey.operator.container.probe.exec`

Run a command in the container.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.exec` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `dependencies.valkey.operator.container.probe.failureThreshold`

Consecutive failures needed to be considered failed.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.failureThreshold` |
| Type       | `integer`                                                       |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.valkey.operator.container.probe.grpc`

gRPC health check of the container.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.grpc` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `dependencies.valkey.operator.container.probe.httpGet`

Request to an HTTP endpoint of the container.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.probe.httpGet` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `dependencies.valkey.operator.container.probe.initialDelaySeconds`

Seconds to wait after the container started before the first probe.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.probe.initialDelaySeconds` |
| Type       | `integer`                                                          |
| Required   | ❌                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |

---

### `dependencies.valkey.operator.container.probe.periodSeconds`

How often (in seconds) the probe runs.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.probe.periodSeconds` |
| Type       | `integer`                                                    |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `dependencies.valkey.operator.container.probe.successThreshold`

Consecutive successes needed to be considered successful after a failure.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.successThreshold` |
| Type       | `integer`                                                       |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.valkey.operator.container.probe.tcpSocket`

Connection to a TCP port of the container.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.tcpSocket` |
| Type       | `map`                                                    |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `dependencies.valkey.operator.container.probe.terminationGracePeriodSeconds`

Grace period before the container is stopped when this probe fails.

| Field      | Value                                                                        |
| ---------- | ---------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.terminationGracePeriodSeconds` |
| Type       | `integer`                                                                    |
| Required   | ❌                                                                           |
| Helm `tpl` | ❌                                                                           |
| Default    | unset                                                                        |

---

### `dependencies.valkey.operator.container.probe.timeoutSeconds`

Seconds after which the probe times out.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.probe.timeoutSeconds` |
| Type       | `integer`                                                     |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---
