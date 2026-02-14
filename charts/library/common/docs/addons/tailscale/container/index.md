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

Configuration for `addons.tailscale.container.command`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.tailscale.container.command` |
| Type       | `list of string`                     |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `addons.tailscale.container.enabled`

Configuration for `addons.tailscale.container.enabled`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `addons.tailscale.container.enabled` |
| Type       | `boolean, string`                    |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `addons.tailscale.container.env`

Configuration for `addons.tailscale.container.env`.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.tailscale.container.env` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Env](env.md) for full configuration.

---

### `addons.tailscale.container.imageSelector`

Configuration for `addons.tailscale.container.imageSelector`.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `addons.tailscale.container.imageSelector` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `addons.tailscale.container.probes`

Configuration for `addons.tailscale.container.probes`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `addons.tailscale.container.probes` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `addons.tailscale.container.resources`

Configuration for `addons.tailscale.container.resources`.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `addons.tailscale.container.resources` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `addons.tailscale.container.securityContext`

Configuration for `addons.tailscale.container.securityContext`.

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
