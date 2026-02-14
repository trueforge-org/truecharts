---
title: Addons
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons`

---

## `addons`

Addons to the workloads

| Field      | Value    |
| ---------- | -------- |
| Key        | `addons` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `addons.$name.container`

Define additional options for the container See container options in the [container](/truecharts-common/container) section.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `addons.$name.container` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [$name.container](../workload/) for full configuration.

---

### `addons.$name.enabled`

Enables or Disables the Addon

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.$name.enabled` |
| Type       | `boolean, string`      |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `addons.$name.ingress`

Define additional options for the ingress See ingress options in the [ingress](/truecharts-common/ingress) section.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.$name.ingress` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `addons.$name.secret`

Define additional options for the secret See secret options in the [secret](/truecharts-common/secret) section.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `addons.$name.secret` |
| Type       | `map, null`           |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `addons.$name.service`

Define additional options for the service See service options in the [service](/truecharts-common/service) section.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `addons.$name.service` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [$name.service](../service/) for full configuration.

---

### `addons.$name.settings`

Addon-specific settings that vary by addon type

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `addons.$name.settings` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `addons.$name.targetSelector`

Define the workloads to add the addon to

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.$name.targetSelector` |
| Type       | `list of string`              |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

## Child Pages

- [Codeserver](codeserver/) - Configuration for `addons.codeserver`.
- [Gluetun](gluetun/) - Configuration for `addons.gluetun`.
- [Tailscale](tailscale/) - Addons to the workloads

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
