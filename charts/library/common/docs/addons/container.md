---
title: Container
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.container`

---

## `addons.container`

Container configuration for an addon.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `addons.container` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `addons.container.args`

Define workload objects

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `addons.container.args` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

See [Args](../workload/) for full configuration.

---

### `addons.container.command`

Define workload objects

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.command` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Command](../workload/) for full configuration.

---

### `addons.container.enabled`

Define workload objects

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.enabled` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Enabled](../workload/) for full configuration.

---

### `addons.container.env`

Define workload objects

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.container.env` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Env](../workload/) for full configuration.

---

### `addons.container.envFrom`

Define workload objects

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.envFrom` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Envfrom](../workload/) for full configuration.

---

### `addons.container.extraArgs`

Define workload objects

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.container.extraArgs` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Extraargs](../workload/) for full configuration.

---

### `addons.container.fixedEnv`

Define workload objects

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.container.fixedEnv` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Fixedenv](../workload/) for full configuration.

---

### `addons.container.imageSelector`

Define workload objects

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.container.imageSelector` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Imageselector](../workload/) for full configuration.

---

### `addons.container.lifecycle`

Define workload objects

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.container.lifecycle` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Lifecycle](../workload/) for full configuration.

---

### `addons.container.primary`

Define workload objects

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.primary` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Primary](../workload/) for full configuration.

---

### `addons.container.probes`

Define workload objects

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `addons.container.probes` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Probes](../workload/) for full configuration.

---

### `addons.container.resources`

Define workload objects

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.container.resources` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Resources](../workload/) for full configuration.

---

### `addons.container.securityContext`

Define workload objects

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.container.securityContext` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Securitycontext](../workload/) for full configuration.

---

### `addons.container.stdin`

Define workload objects

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `addons.container.stdin` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Stdin](../workload/) for full configuration.

---

### `addons.container.targetSelector`

Workloads to which this container is attached.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `addons.container.targetSelector` |
| Type       | `list of string`                  |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `addons.container.termination`

Define workload objects

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `addons.container.termination` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Termination](../workload/) for full configuration.

---

### `addons.container.tty`

Define workload objects

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.container.tty` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Tty](../workload/) for full configuration.

---
