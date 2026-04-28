---
title: Strip Prefix Regex
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/strip-prefix-regex#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.strip-prefix-regex`

---

## `ingressMiddlewares.middlewares.traefik.strip-prefix-regex`

Configuration for the Traefik strip-prefix-regex middleware.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.strip-prefix-regex` |
| Type       | `map`                                                       |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `ingressMiddlewares.middlewares.traefik.strip-prefix-regex.regex`

No description provided.

| Field      | Value                                                             |
| ---------- | ----------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.strip-prefix-regex.regex` |
| Type       | `list of unknown`                                                 |
| Required   | ✅                                                                |
| Helm `tpl` | ❌                                                                |
| Default    | unset                                                             |
| Min Length | `1`                                                               |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix-regex
      data:
        regex:
          - some-regex
          - some-other-regex
```
