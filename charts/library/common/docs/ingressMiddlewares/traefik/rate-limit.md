---
title: rate-limit
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/rate-limit#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: rate-limit`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.average`

Average number of requests allowed per second.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.average` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `rate-limit` |

---

## `data.burst`

Maximum number of requests allowed in a burst.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.burst` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `rate-limit` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: rate-limit
      data:
        average: 1000
        burst: 1000
```
