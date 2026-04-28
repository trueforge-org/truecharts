---
title: Plugin Rewrite Response Headers
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/plugin-rewrite-response-headers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers`

---

## `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers`

Configuration for the Traefik plugin-rewrite-response-headers middleware.

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers` |
| Type       | `map`                                                                    |
| Required   | ❌                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | unset                                                                    |

---

### `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.header`

No description provided.

| Field      | Value                                                                           |
| ---------- | ------------------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.header` |
| Type       | `string`                                                                        |
| Required   | ✅                                                                              |
| Helm `tpl` | ❌                                                                              |
| Default    | unset                                                                           |
| Min Length | `1`                                                                             |

---

### `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.regex`

No description provided.

| Field      | Value                                                                          |
| ---------- | ------------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.regex` |
| Type       | `string`                                                                       |
| Required   | ✅                                                                             |
| Helm `tpl` | ❌                                                                             |
| Default    | unset                                                                          |
| Min Length | `1`                                                                            |

---

### `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.replacement`

No description provided.

| Field      | Value                                                                                |
| ---------- | ------------------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.replacement` |
| Type       | `string`                                                                             |
| Required   | ✅                                                                                   |
| Helm `tpl` | ❌                                                                                   |
| Default    | unset                                                                                |
| Min Length | `1`                                                                                  |

---

### `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.rewrites`

No description provided.

| Field      | Value                                                                             |
| ---------- | --------------------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-rewrite-response-headers.rewrites` |
| Type       | `list of unknown`                                                                 |
| Required   | ✅                                                                                |
| Helm `tpl` | ❌                                                                                |
| Default    | unset                                                                             |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-rewrite-response-headers
      data:
        pluginName: my-plugin-name
        rewrites:
          - header: some-header
            regex: some-regex
            replacement: some-replacement
          - header: some-other-header
            regex: some-other-regex
            replacement: some-other-replacement
```
