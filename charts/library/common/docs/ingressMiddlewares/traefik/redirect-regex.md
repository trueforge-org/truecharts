---
title: redirect-regex
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/redirect-regex#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: redirect-regex`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.permanent`

Redirect permanently (308) instead of temporarily (307).

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.permanent` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `redirect-regex`, `redirect-scheme` |

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
      type: redirect-regex
      data:
        regex: some-regex
        replacement: some-replacement
        permanent: true
```
