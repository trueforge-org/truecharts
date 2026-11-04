---
title: Netshoot
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/netshoot#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.netshoot`

---

## `addons.netshoot`

Configuration for the netshoot addon.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `addons.netshoot` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `addons.netshoot.container`

Container configuration for the netshoot addon.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.netshoot.container` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Container](container.md) for full configuration.

---

### `addons.netshoot.enabled`

Enable running a netshoot container in the pod.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `addons.netshoot.enabled` |
| Type       | `boolean, string`         |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `false`                   |

Example

```yaml
addons:
  netshoot:
    enabled: false
```

---

### `addons.netshoot.targetSelector`

Workloads to which the netshoot container is attached. Defaults to `main`.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.netshoot.targetSelector` |
| Type       | `list of string`                 |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---
