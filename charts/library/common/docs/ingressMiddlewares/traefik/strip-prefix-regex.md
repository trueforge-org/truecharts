---
title: strip-prefix-regex
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/strip-prefix-regex#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: strip-prefix-regex`.

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
