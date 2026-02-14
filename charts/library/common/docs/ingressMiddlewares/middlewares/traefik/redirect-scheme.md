---
title: Redirect Scheme
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/redirect-scheme#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.redirect-scheme`

---

## `ingressMiddlewares.middlewares.traefik.redirect-scheme`

Configuration for the Traefik redirect-scheme middleware.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.redirect-scheme` |
| Type       | `map`                                                    |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `ingressMiddlewares.middlewares.traefik.redirect-scheme.scheme`

No description provided.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.redirect-scheme.scheme` |
| Type       | `string`                                                        |
| Required   | ✅                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |
| Min Length | `1`                                                             |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-scheme
      data:
        scheme: https
        permanent: true
```
