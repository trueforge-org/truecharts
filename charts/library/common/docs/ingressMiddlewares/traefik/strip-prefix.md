---
title: strip-prefix
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/strip-prefix#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: strip-prefix`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.prefix`

Prefix added to the path of the request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.prefix` |
| Type | `list or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `add-prefix`, `strip-prefix` |

---

## `data.forceSlash`

Make sure the path starts with a `/` after stripping.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.forceSlash` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `strip-prefix` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix
      data:
        prefix:
          - /some-prefix
          - /some-other-prefix
        forceSlash: true
```
