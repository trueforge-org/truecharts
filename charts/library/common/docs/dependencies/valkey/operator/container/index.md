---
title: Container
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container`

---

## `dependencies.valkey.operator.container`

No description provided.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.operator.container` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `dependencies.valkey.operator.container.args`

Arguments of the entrypoint of the container.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.args` |
| Type       | `list of string`                              |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `dependencies.valkey.operator.container.command`

Entrypoint of the container.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.command` |
| Type       | `list of string`                                 |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

---

### `dependencies.valkey.operator.container.env`

Environment variables of the container.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.env` |
| Type       | `list of map`                                |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `dependencies.valkey.operator.container.envFrom`

Sources of environment variables of the container.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.envFrom` |
| Type       | `list of unknown`                                |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

---

### `dependencies.valkey.operator.container.image`

Image of the container. Required for a sidecar.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.image` |
| Type       | `string`                                       |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `dependencies.valkey.operator.container.imagePullPolicy`

When the image is pulled.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.imagePullPolicy` |
| Type       | `string`                                                 |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |
| Enum       | `Always`, `Never`, `IfNotPresent`                        |

---

### `dependencies.valkey.operator.container.lifecycle`

Lifecycle hooks of the container.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.lifecycle` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.container.livenessProbe`

Liveness probe of the container.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.livenessProbe` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `dependencies.valkey.operator.container.name`

Name of the container. `server` and `metrics-exporter` patch the containers of the chart, any other name adds a sidecar.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.name` |
| Type       | `string`                                      |
| Required   | ✅                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |
| Min Length | `1`                                           |

---

### `dependencies.valkey.operator.container.ports`

Ports the container listens on.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.ports` |
| Type       | `list of unknown`                              |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `dependencies.valkey.operator.container.readinessProbe`

Readiness probe of the container.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.readinessProbe` |
| Type       | `map`                                                   |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `dependencies.valkey.operator.container.resizePolicy`

Resize policy of the resources of the container.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.resizePolicy` |
| Type       | `list of unknown`                                     |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.resources`

Resources of the container.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.resources` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.container.restartPolicy`

Restart policy of the container. Only used for sidecars (init containers).

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.restartPolicy` |
| Type       | `string`                                               |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |
| Enum       | `Always`, `Never`, `OnFailure`                         |

---

### `dependencies.valkey.operator.container.restartPolicyRules`

Rules that decide whether the container is restarted on exit.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.restartPolicyRules` |
| Type       | `list of unknown`                                           |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `dependencies.valkey.operator.container.securityContext`

Security context of the container.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.securityContext` |
| Type       | `map`                                                    |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `dependencies.valkey.operator.container.startupProbe`

Startup probe of the container.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.startupProbe` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.stdin`

Whether stdin is kept open for the container.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.stdin` |
| Type       | `boolean`                                      |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `dependencies.valkey.operator.container.stdinOnce`

Whether stdin is closed after the first attach.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.stdinOnce` |
| Type       | `boolean`                                          |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.container.terminationMessagePath`

Path of the file the termination message is written to.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.terminationMessagePath` |
| Type       | `string`                                                        |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.valkey.operator.container.terminationMessagePolicy`

Where the termination message is read from.

| Field      | Value                                                             |
| ---------- | ----------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.terminationMessagePolicy` |
| Type       | `string`                                                          |
| Required   | ❌                                                                |
| Helm `tpl` | ❌                                                                |
| Default    | unset                                                             |
| Enum       | `File`, `FallbackToLogsOnError`                                   |

---

### `dependencies.valkey.operator.container.tty`

Whether a TTY is allocated for the container.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.tty` |
| Type       | `boolean`                                    |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `dependencies.valkey.operator.container.volumeDevices`

Block devices mapped in the container.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.volumeDevices` |
| Type       | `list of unknown`                                      |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `dependencies.valkey.operator.container.volumeMounts`

Volumes mounted in the container.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMounts` |
| Type       | `list of unknown`                                     |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.workingDir`

Working directory of the container.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.workingDir` |
| Type       | `string`                                            |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

## Child Pages

- [Envfrom](envFrom.md) - Source of environment variables of the container.
- [Exec](exec.md) - Run a command in the container.
- [Grpc](grpc.md) - gRPC health check of the container.
- [Httpget](httpGet.md) - Request to an HTTP endpoint of the container.
- [Lifecycle](lifecycle.md) - Lifecycle hooks of the container.
- [Lifecyclehandler](lifecycleHandler.md) - Handler of a lifecycle hook of the container.
- [Port](port.md) - Port of the container.
- [Probe](probe.md) - Probe of the container. Set one of `exec`, `httpGet`, `tcpSocket` or `grpc`.
- [Resizepolicy](resizePolicy.md) - Resize policy of a resource of the container.
- [Restartrule](restartRule.md) - Rule that decides whether the container is restarted on exit.
- [Tcpsocket](tcpSocket.md) - Connection to a TCP port of the container.
- [Volumedevice](volumeDevice.md) - Block device mapped in the container.
- [Volumemount](volumeMount.md) - Volume mounted in the container.

---
