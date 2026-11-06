---
title: retry
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/retry#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: retry`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.attempts`

Number of attempts, including the first request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.attempts` |
| Type | `number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `retry` |

---

## `data.initialInterval`

Wait before the first retry, eg `100ms`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.initialInterval` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `retry` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: retry
      data:
        attempts: 3
        initialInterval: 1000
```
