---
title: Replace Path
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/replace-path#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.replace-path`

---

## `ingressMiddlewares.middlewares.traefik.replace-path`

Configuration for the Traefik replace-path middleware.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.replace-path` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `ingressMiddlewares.middlewares.traefik.replace-path.path`

No description provided.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.replace-path.path` |
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
      type: replace-path
      data:
        path: /some-path
```
