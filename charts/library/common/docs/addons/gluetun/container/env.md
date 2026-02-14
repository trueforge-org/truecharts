---
title: Env
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/gluetun/container/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.gluetun.container.env`

---

## `addons.gluetun.container.env`

Environment variables for gluetun addon.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `addons.gluetun.container.env` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `addons.gluetun.container.env.DNS_KEEP_NAMESERVER`

Keep nameserver from host.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `addons.gluetun.container.env.DNS_KEEP_NAMESERVER` |
| Type       | `boolean, string`                                  |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `addons.gluetun.container.env.DOT`

DNS over TLS provider setting.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.gluetun.container.env.DOT` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `addons.gluetun.container.env.FIREWALL`

Firewall mode.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `addons.gluetun.container.env.FIREWALL` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `addons.gluetun.container.env.FIREWALL_INPUT_PORTS`

Allowed inbound ports.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `addons.gluetun.container.env.FIREWALL_INPUT_PORTS` |
| Type       | `string`                                            |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `addons.gluetun.container.env.FIREWALL_OUTBOUND_SUBNETS`

Allowed outbound subnets.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `addons.gluetun.container.env.FIREWALL_OUTBOUND_SUBNETS` |
| Type       | `string`                                                 |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

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
