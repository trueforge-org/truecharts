---
title: Container
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/gluetun/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.gluetun.container`

---

## `addons.gluetun.container`

Container of the gluetun add-on.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.gluetun.container` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `addons.gluetun.container.args`

Arguments of the container.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `addons.gluetun.container.args` |
| Type       | `map, string, list of string`   |
| Required   | ❌                              |
| Helm `tpl` | ✅                              |
| Default    | unset                           |

See [Args](../../../workload/) for full configuration.

---

### `addons.gluetun.container.command`

Command of the container.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.gluetun.container.command` |
| Type       | `map, string, list of string`      |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | unset                              |

See [Command](../../../workload/) for full configuration.

---

### `addons.gluetun.container.enabled`

Enable the container of the add-on.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.gluetun.container.enabled` |
| Type       | `boolean, string`                  |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | unset                              |

See [Enabled](../../../workload/) for full configuration.

---

### `addons.gluetun.container.env`

Environment variables of the container, keyed by name.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `addons.gluetun.container.env` |
| Type       | `map, null`                    |
| Required   | ❌                             |
| Helm `tpl` | ✅ (Only value)                 |
| Default    | unset                          |

See [Env](../../../workload/) for full configuration.

---

### `addons.gluetun.container.envFrom`

ConfigMaps and Secrets whose keys become environment variables.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.gluetun.container.envFrom` |
| Type       | `list of map`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Envfrom](../../../workload/) for full configuration.

---

### `addons.gluetun.container.extraArgs`

Arguments added after `args`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.gluetun.container.extraArgs` |
| Type       | `string, list of unknown`            |
| Required   | ❌                                   |
| Helm `tpl` | ✅                                   |
| Default    | unset                                |

See [Extraargs](../../../workload/) for full configuration.

---

### `addons.gluetun.container.fixedEnv`

Settings of the environment variables that common sets.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `addons.gluetun.container.fixedEnv` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Fixedenv](../../../workload/) for full configuration.

---

### `addons.gluetun.container.imageSelector`

Name of the image on the root of the values.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `addons.gluetun.container.imageSelector` |
| Type       | `string`                                 |
| Required   | ❌                                       |
| Helm `tpl` | ✅                                       |
| Default    | unset                                    |

See [Imageselector](../../../workload/) for full configuration.

---

### `addons.gluetun.container.lifecycle`

Lifecycle hooks of the container.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.gluetun.container.lifecycle` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Lifecycle](../../../workload/) for full configuration.

---

### `addons.gluetun.container.primary`

Make this the primary container of the workload.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.gluetun.container.primary` |
| Type       | `boolean`                          |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Primary](../../../workload/) for full configuration.

---

### `addons.gluetun.container.probes`

Probes of the container.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `addons.gluetun.container.probes` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Probes](../../../workload/) for full configuration.

---

### `addons.gluetun.container.resources`

Resources of the container.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.gluetun.container.resources` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Resources](../../../workload/) for full configuration.

---

### `addons.gluetun.container.securityContext`

Security context of the container.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `addons.gluetun.container.securityContext` |
| Type       | `map, null`                                |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

See [Securitycontext](../../../workload/) for full configuration.

---

### `addons.gluetun.container.stdin`

Keep stdin open.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.gluetun.container.stdin` |
| Type       | `boolean`                        |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Stdin](../../../workload/) for full configuration.

---

### `addons.gluetun.container.targetSelector`

Workloads to which this container is attached.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.gluetun.container.targetSelector` |
| Type       | `list of string`                          |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `addons.gluetun.container.termination`

Termination settings of the container.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `addons.gluetun.container.termination` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Termination](../../../workload/) for full configuration.

---

### `addons.gluetun.container.tty`

Allocate a TTY.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `addons.gluetun.container.tty` |
| Type       | `boolean`                      |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Tty](../../../workload/) for full configuration.

---

## Child Pages

- [Env](env.md) - Environment variables for gluetun addon.

---
