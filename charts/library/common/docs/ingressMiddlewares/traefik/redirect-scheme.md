---
title: redirect-scheme
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/redirect-scheme#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: redirect-scheme`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.scheme`

Scheme to redirect to, eg `https`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.scheme` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `redirect-scheme` |

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

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-scheme
      data:
        scheme: https
        permanent: true
```
