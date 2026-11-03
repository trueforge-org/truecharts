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

Addons to the workloads.

| Field      | Value    |
| ---------- | -------- |
| Key        | `addons` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `addons.codeserver`

Configuration for the code-server addon.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `addons.codeserver` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

See [Codeserver](codeserver/) for full configuration.

---

### `addons.gluetun`

Configuration for the Gluetun addon.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `addons.gluetun` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Gluetun](gluetun/) for full configuration.

---

### `addons.netshoot`

Configuration for the netshoot addon.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `addons.netshoot` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

See [Netshoot](netshoot.md) for full configuration.

---

### `addons.tailscale`

Addons to the workloads

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `addons.tailscale` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Tailscale](tailscale/) for full configuration.

---

### `addons.vpn`

Removed vpn add-on. Setting `addons.vpn` fails rendering (see `templates/values/_deprecations.tpl`), use `addons.gluetun` or `addons.tailscale` instead.

| Field      | Value        |
| ---------- | ------------ |
| Key        | `addons.vpn` |
| Type       | `map`        |
| Required   | ❌           |
| Helm `tpl` | ❌           |
| Default    | unset        |

---

## Child Pages

- [Addon](addon.md) - Configuration for a workload addon.
- [Codeserver](codeserver/) - Configuration for the code-server addon.
- [Container](container.md) - Container configuration for an addon.
- [Gluetun](gluetun/) - Configuration for the Gluetun addon.
- [Netshoot](netshoot.md) - Configuration for the netshoot addon.
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
