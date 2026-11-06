---
title: content-type
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/content-type#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: content-type`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: content-type
```
