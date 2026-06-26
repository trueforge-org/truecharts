---
title: Content Type
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/content-type#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.content-type`

---

## `ingressMiddlewares.middlewares.traefik.content-type`

Configuration for the Traefik content-type middleware.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.content-type` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: content-type
```
