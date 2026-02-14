---
title: Plugin Mod Security
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/plugin-mod-security#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.plugin-mod-security`

---

## `ingressMiddlewares.middlewares.traefik.plugin-mod-security`

Configuration for the Traefik plugin-mod-security middleware.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-mod-security` |
| Type       | `map`                                                        |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `ingressMiddlewares.middlewares.traefik.plugin-mod-security.modSecurityUrl`

No description provided.

| Field      | Value                                                                       |
| ---------- | --------------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-mod-security.modSecurityUrl` |
| Type       | `string`                                                                    |
| Required   | ✅                                                                          |
| Helm `tpl` | ❌                                                                          |
| Default    | unset                                                                       |
| Min Length | `1`                                                                         |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-mod-security
      data:
        pluginName: my-plugin-name
        modSecurityUrl: https://example.com
        timeoutMillis: 1000
        maxBodySize: 1024
```
