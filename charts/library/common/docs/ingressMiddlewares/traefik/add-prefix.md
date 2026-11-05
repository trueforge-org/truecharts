---
title: add-prefix
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/add-prefix#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: add-prefix`.

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

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: add-prefix
      data:
        prefix: some-prefix
```
