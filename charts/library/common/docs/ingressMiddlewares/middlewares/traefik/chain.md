---
title: Chain
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/chain#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.chain`

---

## `ingressMiddlewares.middlewares.traefik.chain`

Configuration for the Traefik chain middleware.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.chain` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `ingressMiddlewares.middlewares.traefik.chain.expandObjectName`

No description provided.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.chain.expandObjectName` |
| Type       | `boolean`                                                       |
| Required   | ✅                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `ingressMiddlewares.middlewares.traefik.chain.middlewares`

No description provided.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.chain.middlewares` |
| Type       | `list of unknown`                                          |
| Required   | ✅                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `ingressMiddlewares.middlewares.traefik.chain.name`

No description provided.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.chain.name` |
| Type       | `string`                                            |
| Required   | ✅                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |
| Min Length | `1`                                                 |

---

## Full Examples

```yaml
middlewares:
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
