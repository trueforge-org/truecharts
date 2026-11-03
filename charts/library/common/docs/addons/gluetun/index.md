---
title: Gluetun
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/gluetun#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.gluetun`

---

## `addons.gluetun`

Configuration for the Gluetun addon.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `addons.gluetun` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `addons.gluetun.container`

No description provided.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.gluetun.container` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `addons.gluetun.enabled`

Enable the Gluetun VPN addon.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `addons.gluetun.enabled` |
| Type       | `boolean, string`        |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `false`                  |

Example

```yaml
addons:
  gluetun:
    enabled: false
```

---

### `addons.gluetun.secret`

Secrets mounted into the Gluetun container, for example the WireGuard configuration. Each key is a name for the secret.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `addons.gluetun.secret` |
| Type       | `map, null`             |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `addons.gluetun.targetSelector`

Workloads to which the Gluetun container is attached.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `addons.gluetun.targetSelector` |
| Type       | `list of string`                |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `["main"]`                      |

Example

```yaml
addons:
  gluetun:
    targetSelector:
      - main
```

---

## Child Pages

- [Container](container/)

---
