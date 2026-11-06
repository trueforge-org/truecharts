---
title: compress
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/compress#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: compress`.

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
      type: compress
```
