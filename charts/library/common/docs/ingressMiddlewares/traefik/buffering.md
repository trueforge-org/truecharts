---
title: buffering
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/buffering#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: buffering`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.maxRequestBodyBytes`

Maximum size of a request body, in bytes.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.maxRequestBodyBytes` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `buffering` |

---

## `data.memRequestBodyBytes`

Size of a request body kept in memory before it is buffered to disk, in bytes.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.memRequestBodyBytes` |
| Type | `null or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `buffering` |

---

## `data.maxResponseBodyBytes`

Maximum size of a response body, in bytes.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.maxResponseBodyBytes` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `buffering` |

---

## `data.memResponseBodyBytes`

Size of a response body kept in memory before it is buffered to disk, in bytes.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.memResponseBodyBytes` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `buffering` |

---

## `data.retryExpression`

Retry when the expression matches the response, eg `IsNetworkError() && Attempts() < 2`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.retryExpression` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `buffering` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      data:
        maxRequestBodyBytes: 1024
        memRequestBodyBytes: 1024
        maxResponseBodyBytes: 1024
        memResponseBodyBytes: 1024
        retryExpression: "some-expression"
```
