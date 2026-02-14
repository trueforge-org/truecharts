---
title: Traefik Middlewares
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/middlewares/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik`

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `type`

Define the type for this object

Available types:

- [add-prefix](/truecharts-common/middlewares/traefik/add-prefix)
- [basic-auth](/truecharts-common/middlewares/traefik/basic-auth)
- [buffering](/truecharts-common/middlewares/traefik/buffering)
- [chain](/truecharts-common/middlewares/traefik/chain)
- [compress](/truecharts-common/middlewares/traefik/compress)
- [content-type](/truecharts-common/middlewares/traefik/content-type)
- [forward-auth](/truecharts-common/middlewares/traefik/forward-auth)
- [headers](/truecharts-common/middlewares/traefik/headers)
- [ip-allow-list](/truecharts-common/middlewares/traefik/ip-allow-list)
- [plugin-bouncer](/truecharts-common/middlewares/traefik/plugin-bouncer)
- [plugin-geoblock](/truecharts-common/middlewares/traefik/plugin-geoblock)
- [plugin-mod-security](/truecharts-common/middlewares/traefik/plugin-mod-security)
- [plugin-real-ip](/truecharts-common/middlewares/traefik/plugin-real-ip)
- [plugin-rewrite-response-headers](/truecharts-common/middlewares/traefik/plugin-rewrite-response-headers)
- [plugin-theme-park](/truecharts-common/middlewares/traefik/plugin-theme-park)
- [rate-limit](/truecharts-common/middlewares/traefik/rate-limit)
- [redirect-regex](/truecharts-common/middlewares/traefik/redirect-regex)
- [redirect-scheme](/truecharts-common/middlewares/traefik/redirect-scheme)
- [replace-path-regex](/truecharts-common/middlewares/traefik/replace-path-regex)
- [replace-path](/truecharts-common/middlewares/traefik/replace-path)
- [retry](/truecharts-common/middlewares/traefik/retry)
- [strip-prefix-regex](/truecharts-common/middlewares/traefik/strip-prefix-regex)
- [strip-prefix](/truecharts-common/middlewares/traefik/strip-prefix)

|            |                                           |
| ---------- | ----------------------------------------- |
| Key        | `ingressMiddlewares.$provider.$name.type` |
| Type       | `string`                                  |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `""`                                      |

Example

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      type: buffering
```

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      data:
        key: value
```
