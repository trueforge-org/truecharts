---
title: Add Prefix
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/add-prefix#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.add-prefix`

---

## `ingressMiddlewares.middlewares.traefik.add-prefix`

Configuration for the Traefik add-prefix middleware.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.add-prefix` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `ingressMiddlewares.middlewares.traefik.add-prefix.prefix`

No description provided.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.add-prefix.prefix` |
| Type       | `string`                                                   |
| Required   | ✅                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |
| Min Length | `1`                                                        |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: add-prefix
      data:
        prefix: some-prefix
```
