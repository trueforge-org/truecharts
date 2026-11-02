---
title: Codeserver
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/codeserver#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver`

---

## `addons.codeserver`

Configuration for the code-server addon.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `addons.codeserver` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `addons.codeserver.container`

No description provided.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.codeserver.container` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `addons.codeserver.enabled`

No description provided.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.codeserver.enabled` |
| Type       | `boolean, string`           |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `addons.codeserver.ingress`

No description provided.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.codeserver.ingress` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `addons.codeserver.secret`

Secret configuration for the addon.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.codeserver.secret` |
| Type       | `map, null`                |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `addons.codeserver.service`

Define service objects

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.codeserver.service` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Service](../../service/) for full configuration.

---

### `addons.codeserver.settings`

Addon-specific settings.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.codeserver.settings` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `addons.codeserver.targetSelector`

Workloads to which the addon is attached.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.codeserver.targetSelector` |
| Type       | `list of string`                   |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

## Child Pages

- [Container](container/)

---
