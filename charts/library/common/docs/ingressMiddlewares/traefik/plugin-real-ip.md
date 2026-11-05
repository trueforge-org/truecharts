---
title: plugin-real-ip
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/plugin-real-ip#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: plugin-real-ip`.

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

## `data.excludednets`

CIDRs that are skipped when the real IP is taken from `X-Forwarded-For`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.excludednets` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-real-ip` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-real-ip
      data:
        pluginName: my-plugin-name
        excludednets:
          - some-excluded-net
          - some-other-excluded-net
```
