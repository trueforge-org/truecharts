---
title: Compress
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/compress#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.compress`

---

## `ingressMiddlewares.middlewares.traefik.compress`

Configuration for the Traefik compress middleware.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.compress` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: compress
```
