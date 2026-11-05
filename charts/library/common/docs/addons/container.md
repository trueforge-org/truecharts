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

Arguments of the container.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.container.args`       |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ✅                            |
| Default    | unset                         |

See [Args](../workload/) for full configuration.

---

### `addons.container.command`

Command of the container.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.container.command`    |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ✅                            |
| Default    | unset                         |

See [Command](../workload/) for full configuration.

---

### `addons.container.enabled`

Enable the container of the add-on.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.container.enabled` |
| Type       | `boolean, string`          |
| Required   | ❌                         |
| Helm `tpl` | ✅                         |
| Default    | unset                      |

See [Enabled](../workload/) for full configuration.

---

### `addons.container.env`

Environment variables of the container, keyed by name.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.container.env` |
| Type       | `map, null`            |
| Required   | ❌                     |
| Helm `tpl` | ✅ (Only value)         |
| Default    | unset                  |

See [Env](../workload/) for full configuration.

---

### `addons.container.envFrom`

ConfigMaps and Secrets whose keys become environment variables.

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

Arguments added after `args`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.container.extraArgs` |
| Type       | `string, list of unknown`    |
| Required   | ❌                           |
| Helm `tpl` | ✅                           |
| Default    | unset                        |

See [Extraargs](../workload/) for full configuration.

---

### `addons.container.fixedEnv`

Settings of the environment variables that common sets.

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

Name of the image on the root of the values.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.container.imageSelector` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ✅                               |
| Default    | unset                            |

See [Imageselector](../workload/) for full configuration.

---

### `addons.container.lifecycle`

Lifecycle hooks of the container.

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

Make this the primary container of the workload.

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

Probes of the container.

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

Resources of the container.

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

Security context of the container.

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

Keep stdin open.

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

Termination settings of the container.

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

Allocate a TTY.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.container.tty` |
| Type       | `boolean`              |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Tty](../workload/) for full configuration.

---
