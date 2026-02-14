---
title: Tailscale
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/tailscale#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.tailscale`

---

## `addons.tailscale`

Addons to the workloads

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `addons.tailscale` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `addons.tailscale.annotations`

Configuration for `addons.tailscale.annotations`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `addons.tailscale.annotations` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `addons.tailscale.container`

Addons to the workloads

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `addons.tailscale.container` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `addons.tailscale.enabled`

Addons to the workloads

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.tailscale.enabled` |
| Type       | `boolean, string`          |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `addons.tailscale.settings`

Tailscale settings

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.tailscale.settings` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `addons.tailscale.targetSelector`

Addons to the workloads

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `addons.tailscale.targetSelector` |
| Type       | `list of string`                  |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

## Child Pages

- [Container](container/) - Addons to the workloads

---

## Full Examples

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
    service:
      enabled: true
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
```
