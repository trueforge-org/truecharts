---
title: Buffering
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/buffering#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.buffering`

---

## `ingressMiddlewares.middlewares.traefik.buffering`

Configuration for the Traefik buffering middleware.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.buffering` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      data:
        maxRequestBodyBytes: 1024
        memRequestBodyBytes: 1024
        maxResponseBodyBytes: 1024
        memResponseBodyBytes: 1024
        retryExpression: "some-expression"
```
