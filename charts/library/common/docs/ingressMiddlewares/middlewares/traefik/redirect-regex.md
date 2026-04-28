---
title: Redirect Regex
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/redirect-regex#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.redirect-regex`

---

## `ingressMiddlewares.middlewares.traefik.redirect-regex`

Configuration for the Traefik redirect-regex middleware.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.redirect-regex` |
| Type       | `map`                                                   |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `ingressMiddlewares.middlewares.traefik.redirect-regex.regex`

No description provided.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.redirect-regex.regex` |
| Type       | `string`                                                      |
| Required   | ✅                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |
| Min Length | `1`                                                           |

---

### `ingressMiddlewares.middlewares.traefik.redirect-regex.replacement`

No description provided.

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.redirect-regex.replacement` |
| Type       | `string`                                                            |
| Required   | ✅                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | unset                                                               |
| Min Length | `1`                                                                 |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-regex
      data:
        regex: some-regex
        replacement: some-replacement
        permanent: true
```
