---
title: replace-path-regex
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/replace-path-regex#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: replace-path-regex`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.regex`

Regular expression that is matched against the request URL.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.regex` |
| Type | `list or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-rewrite-response-headers`, `redirect-regex`, `replace-path-regex`, `strip-prefix-regex` |

---

## `data.replacement`

Replacement of the matched URL, can use the groups of `regex`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.replacement` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-rewrite-response-headers`, `redirect-regex`, `replace-path-regex` |

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
