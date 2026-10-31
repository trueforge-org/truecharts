---
title: Plugin Theme Park
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/plugin-theme-park#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.plugin-theme-park`

---

## `ingressMiddlewares.middlewares.traefik.plugin-theme-park`

Configuration for the Traefik plugin-theme-park middleware.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-theme-park` |
| Type       | `map`                                                      |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `ingressMiddlewares.middlewares.traefik.plugin-theme-park.app`

No description provided.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-theme-park.app` |
| Type       | `string`                                                       |
| Required   | ✅                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |
| Min Length | `1`                                                            |

---

### `ingressMiddlewares.middlewares.traefik.plugin-theme-park.theme`

No description provided.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-theme-park.theme` |
| Type       | `string`                                                         |
| Required   | ✅                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |
| Min Length | `1`                                                              |

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
