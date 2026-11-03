---
title: Container
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/codeserver/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container`

---

## `addons.codeserver.container`

No description provided.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.codeserver.container` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `addons.codeserver.container.args`

Define arg(s). If it's single, can be defined as string

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.codeserver.container.args` |
| Type       | `map, string, list of string`      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Args](../../../workload/) for full configuration.

---

### `addons.codeserver.container.command`

Define command(s). If it's single, can be defined as string

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `addons.codeserver.container.command` |
| Type       | `map, string, list of string`         |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Command](../../../workload/) for full configuration.

---

### `addons.codeserver.container.enabled`

Define if the container is enabled or not

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `addons.codeserver.container.enabled` |
| Type       | `boolean, string`                     |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Enabled](../../../workload/) for full configuration.

---

### `addons.codeserver.container.env`

Define env(s) for the container

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `addons.codeserver.container.env` |
| Type       | `map, null`                       |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Env](../../../workload/) for full configuration.

---

### `addons.codeserver.container.envFrom`

Define envFrom for the container

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `addons.codeserver.container.envFrom` |
| Type       | `list of map`                         |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Envfrom](../../../workload/) for full configuration.

---

### `addons.codeserver.container.extraArgs`

Define extraArg(s). Those are appended **after** the `args`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `addons.codeserver.container.extraArgs` |
| Type       | `string, list of unknown`               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Extraargs](../../../workload/) for full configuration.

---

### `addons.codeserver.container.fixedEnv`

Override fixedEnv for the container By default it will set the following environment variables:

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `addons.codeserver.container.fixedEnv` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Fixedenv](../../../workload/) for full configuration.

---

### `addons.codeserver.container.imageSelector`

Define the image `map` to use

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `addons.codeserver.container.imageSelector` |
| Type       | `string`                                    |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [Imageselector](../../../workload/) for full configuration.

---

### `addons.codeserver.container.lifecycle`

Define lifecycle for the container

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `addons.codeserver.container.lifecycle` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Lifecycle](../../../workload/) for full configuration.

---

### `addons.codeserver.container.primary`

Define if the container is primary or not Does **not** apply to `initContainers`

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `addons.codeserver.container.primary` |
| Type       | `boolean`                             |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Primary](../../../workload/) for full configuration.

---

### `addons.codeserver.container.probes`

Define probes for the container

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.codeserver.container.probes` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Probes](../../../workload/) for full configuration.

---

### `addons.codeserver.container.resources`

The resources that the container can use.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `addons.codeserver.container.resources` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Resources](../../../workload/) for full configuration.

---

### `addons.codeserver.container.securityContext`

Define securityContext for the container

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `addons.codeserver.container.securityContext` |
| Type       | `map, null`                                   |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

See [Securitycontext](../../../workload/) for full configuration.

---

### `addons.codeserver.container.stdin`

Define if the container should have stdin enabled or not

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `addons.codeserver.container.stdin` |
| Type       | `boolean`                           |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Stdin](../../../workload/) for full configuration.

---

### `addons.codeserver.container.targetSelector`

Workloads to which this container is attached.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.codeserver.container.targetSelector` |
| Type       | `list of string`                             |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `addons.codeserver.container.termination`

Define termination for the container

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.codeserver.container.termination` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Termination](../../../workload/) for full configuration.

---

### `addons.codeserver.container.tty`

Define if the container should have tty enabled or not

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `addons.codeserver.container.tty` |
| Type       | `boolean`                         |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Tty](../../../workload/) for full configuration.

---

## Child Pages

- [Env](env.md) - Environment variables for codeserver addon.

---
