---
title: replace-path
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/replace-path#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: replace-path`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.path`

Path that replaces the path of the request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `replace-path` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: replace-path
      data:
        path: /some-path
```
