---
title: basic-auth
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/basic-auth#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: basic-auth`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.users`

Users of the basic authentication, as `username` and `password`. Do not set together with `secret`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.users` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `basic-auth` |

---

## `data.users[]`

A user of the basic authentication.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.users[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.users[].password`

Password of the user.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.users[].password` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.users[].username`

User name.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.users[].username` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.secret`

Name of an existing Secret with the users, in the Traefik `basicAuth` format. Do not set together with `users`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.secret` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `basic-auth` |

---

## Full Examples

### Users in the values

The password is stored in a generated Secret. Use placeholders only in documentation, and set a real password in your own values.

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: basic-auth
      data:
        users:
          - username: some-username
            password: <password>
```

### Existing secret

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: basic-auth
      data:
        secret: some-secret
```
