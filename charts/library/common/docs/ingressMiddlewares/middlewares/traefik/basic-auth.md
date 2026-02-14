---
title: Basic Auth
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/basic-auth#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.basic-auth`

---

## `ingressMiddlewares.middlewares.traefik.basic-auth`

Configuration for the Traefik basic-auth middleware.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.basic-auth` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `ingressMiddlewares.middlewares.traefik.basic-auth.password`

No description provided.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.basic-auth.password` |
| Type       | `string`                                                     |
| Required   | ✅                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |
| Min Length | `1`                                                          |

---

### `ingressMiddlewares.middlewares.traefik.basic-auth.secret`

No description provided.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.basic-auth.secret` |
| Type       | `string`                                                   |
| Required   | ✅                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |
| Min Length | `1`                                                        |

---

### `ingressMiddlewares.middlewares.traefik.basic-auth.username`

No description provided.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.basic-auth.username` |
| Type       | `string`                                                     |
| Required   | ✅                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |
| Min Length | `1`                                                          |

---

### `ingressMiddlewares.middlewares.traefik.basic-auth.users`

No description provided.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.basic-auth.users` |
| Type       | `list of unknown`                                         |
| Required   | ✅                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name1:
      enabled: true
      type: basic-auth
      data:
        users:
          - username: some-username
            password: some-password
    middleware-name2:
      enabled: true
      type: basic-auth
      data:
        secret: some-secret
```
