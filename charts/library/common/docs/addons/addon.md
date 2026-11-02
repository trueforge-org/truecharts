---
title: Addon
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/addon#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.addon`

---

## `addons.addon`

Configuration for a workload addon.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `addons.addon` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

### `addons.addon.container`

Container configuration for the addon.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `addons.addon.container` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Container](container.md) for full configuration.

---

### `addons.addon.enabled`

Enable or disable the addon.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.addon.enabled` |
| Type       | `boolean, string`      |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `addons.addon.ingress`

Ingress configuration for the addon.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.addon.ingress` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `addons.addon.secret`

Secret configuration for the addon.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `addons.addon.secret` |
| Type       | `map, null`           |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `addons.addon.service`

Service configuration for the addon.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.addon.service` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Service](../service/) for full configuration.

---

### `addons.addon.settings`

Addon-specific settings.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `addons.addon.settings` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `addons.addon.targetSelector`

Workloads to which the addon is attached.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.addon.targetSelector` |
| Type       | `list of string`              |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---
