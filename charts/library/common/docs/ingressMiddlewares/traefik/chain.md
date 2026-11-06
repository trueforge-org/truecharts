---
title: chain
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/chain#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: chain`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.middlewares`

Middlewares of a chain, applied in order. Only for `type: chain`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.middlewares` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `chain` |

---

## `data.middlewares[]`

A middleware of the chain.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.middlewares[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.middlewares[].expandObjectName`

Prefix `name` with the release fullname. Set to `false` for a middleware that is not created by this chart.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.middlewares[].expandObjectName` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.middlewares[].name`

Name of the middleware.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.middlewares[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: chain
      data:
        middlewares:
          - name: some-middleware
          - name: some-other-middleware
            expandObjectName: false
```
