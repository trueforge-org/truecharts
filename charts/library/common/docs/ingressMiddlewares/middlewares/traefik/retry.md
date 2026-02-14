---
title: Retry
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/retry#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.retry`

---

## `ingressMiddlewares.middlewares.traefik.retry`

Configuration for the Traefik retry middleware.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.retry` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `ingressMiddlewares.middlewares.traefik.retry.attempts`

No description provided.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.retry.attempts` |
| Type       | `string`                                                |
| Required   | ✅                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |
| Min Length | `1`                                                     |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: retry
      data:
        attempts: 3
        initialInterval: 1000
```
