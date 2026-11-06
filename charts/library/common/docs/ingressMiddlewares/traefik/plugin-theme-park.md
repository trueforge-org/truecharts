---
title: plugin-theme-park
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/plugin-theme-park#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: plugin-theme-park`.

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

## `data.app`

Name of the app the Theme Park theme is applied to.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.app` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-theme-park` |

---

## `data.theme`

Theme Park theme, eg `dark`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.theme` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-theme-park` |

---

## `data.baseUrl`

Base URL the Theme Park CSS is loaded from.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.baseUrl` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-theme-park` |

---

## `data.addons`

Settings of the add-ons of the Theme Park plugin.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.addons` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-theme-park` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-theme-park
      data:
        pluginName: my-plugin-name
        app: sonarr
        theme: dark
        baseUrl: https://example.com
        addons:
          - some-addon
          - some-other-addon
```
