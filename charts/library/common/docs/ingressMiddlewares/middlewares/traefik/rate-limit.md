---
title: Rate Limit
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/rate-limit#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.rate-limit`

---

## `ingressMiddlewares.middlewares.traefik.rate-limit`

Configuration for the Traefik rate-limit middleware.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.rate-limit` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: rate-limit
      data:
        average: 1000
        burst: 1000
```
