---
title: Container
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/tailscale/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.tailscale.container`

---

## `addons.tailscale.container`

Addons to the workloads

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.tailscale.container` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `addons.tailscale.container.command`

Command of the container.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.tailscale.container.command` |
| Type       | `list of string`                     |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `addons.tailscale.container.enabled`

Enable the container of the add-on.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.tailscale.container.enabled` |
| Type       | `boolean, string`                    |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `addons.tailscale.container.env`

Environment variables of the container, keyed by name.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.tailscale.container.env` |
| Type       | `map, null`                      |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Env](env.md) for full configuration.

---

### `addons.tailscale.container.imageSelector`

Name of the image on the root of the values.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `addons.tailscale.container.imageSelector` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `addons.tailscale.container.probes`

Probes of the container.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `addons.tailscale.container.probes` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `addons.tailscale.container.resources`

Resources of the container.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `addons.tailscale.container.resources` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `addons.tailscale.container.securityContext`

Security context of the container.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.tailscale.container.securityContext` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

## Child Pages

- [Env](env.md) - Configuration for `addons.tailscale.container.env`.

---
