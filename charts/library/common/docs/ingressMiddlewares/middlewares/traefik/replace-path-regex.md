---
title: Replace Path Regex
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/replace-path-regex#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.replace-path-regex`

---

## `ingressMiddlewares.middlewares.traefik.replace-path-regex`

Configuration for the Traefik replace-path-regex middleware.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.replace-path-regex` |
| Type       | `map`                                                       |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `ingressMiddlewares.middlewares.traefik.replace-path-regex.regex`

No description provided.

| Field      | Value                                                             |
| ---------- | ----------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.replace-path-regex.regex` |
| Type       | `string`                                                          |
| Required   | ✅                                                                |
| Helm `tpl` | ❌                                                                |
| Default    | unset                                                             |
| Min Length | `1`                                                               |

---

### `ingressMiddlewares.middlewares.traefik.replace-path-regex.replacement`

No description provided.

| Field      | Value                                                                   |
| ---------- | ----------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.replace-path-regex.replacement` |
| Type       | `string`                                                                |
| Required   | ✅                                                                      |
| Helm `tpl` | ❌                                                                      |
| Default    | unset                                                                   |
| Min Length | `1`                                                                     |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: replace-path-regex
      data:
        regex: /some-path
        replacement: /some-replacement
```
