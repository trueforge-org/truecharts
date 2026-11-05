---
title: plugin-mod-security
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/plugin-mod-security#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: plugin-mod-security`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.pluginName`

Name of the plugin, as registered in Traefik.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.pluginName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer`, `plugin-geoblock`, `plugin-mod-security`, `plugin-real-ip`, `plugin-rewrite-response-headers`, `plugin-theme-park` |

---

## `data.modSecurityUrl`

URL of the ModSecurity service the request is checked with.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.modSecurityUrl` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-mod-security` |

---

## `data.timeoutMillis`

Timeout of the requests to the ModSecurity service, in milliseconds.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.timeoutMillis` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-mod-security` |

---

## `data.maxBodySize`

Maximum size of a request body sent to the plugin, in bytes.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.maxBodySize` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-mod-security` |

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
