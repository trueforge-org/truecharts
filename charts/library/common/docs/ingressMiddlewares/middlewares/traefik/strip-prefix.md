---
title: Strip Prefix
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/strip-prefix#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.strip-prefix`

---

## `ingressMiddlewares.middlewares.traefik.strip-prefix`

Configuration for the Traefik strip-prefix middleware.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.strip-prefix` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `ingressMiddlewares.middlewares.traefik.strip-prefix.prefix`

No description provided.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.strip-prefix.prefix` |
| Type       | `list of unknown`                                            |
| Required   | ✅                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |
| Min Length | `1`                                                          |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix
      data:
        prefix:
          - /some-prefix
          - /some-other-prefix
        forceSlash: true
```
