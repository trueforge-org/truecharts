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

Define arg(s). If it's single, can be defined as string

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.container.args`       |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Args](../workload/) for full configuration.

---

### `addons.container.command`

Define command(s). If it's single, can be defined as string

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.container.command`    |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Command](../workload/) for full configuration.

---

### `addons.container.enabled`

Define if the container is enabled or not

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.enabled` |
| Type       | `boolean, string`          |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Enabled](../workload/) for full configuration.

---

### `addons.container.env`

Define env(s) for the container

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.container.env` |
| Type       | `map, null`            |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Env](../workload/) for full configuration.

---

### `addons.container.envFrom`

Define envFrom for the container

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.envFrom` |
| Type       | `list of map`              |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Envfrom](../workload/) for full configuration.

---

### `addons.container.extraArgs`

Define extraArg(s). Those are appended **after** the `args`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.container.extraArgs` |
| Type       | `string, list of unknown`    |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Extraargs](../workload/) for full configuration.

---

### `addons.container.fixedEnv`

Override fixedEnv for the container By default it will set the following environment variables:

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

Define the image `map` to use

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.container.imageSelector` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Imageselector](../workload/) for full configuration.

---

### `addons.container.lifecycle`

Define lifecycle for the container

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

Define if the container is primary or not Does **not** apply to `initContainers`

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.primary` |
| Type       | `boolean`                  |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Primary](../workload/) for full configuration.

---

### `addons.container.probes`

Define probes for the container

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

The resources that the container can use.

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

Define securityContext for the container

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.container.securityContext` |
| Type       | `map, null`                        |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Securitycontext](../workload/) for full configuration.

---

### `addons.container.stdin`

Define if the container should have stdin enabled or not

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `addons.container.stdin` |
| Type       | `boolean`                |
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

Define termination for the container

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

Define if the container should have tty enabled or not

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.container.tty` |
| Type       | `boolean`              |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Tty](../workload/) for full configuration.

---
