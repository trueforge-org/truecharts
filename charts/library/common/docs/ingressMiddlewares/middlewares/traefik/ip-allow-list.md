---
title: Ip Allow List
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/ip-allow-list#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.ip-allow-list`

---

## `ingressMiddlewares.middlewares.traefik.ip-allow-list`

Configuration for the Traefik ip-allow-list middleware.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.ip-allow-list` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `ingressMiddlewares.middlewares.traefik.ip-allow-list.depth`

No description provided.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.ip-allow-list.depth` |
| Type       | `integer`                                                    |
| Required   | ✅                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |
| Minimum    | `1`                                                          |

---

### `ingressMiddlewares.middlewares.traefik.ip-allow-list.excludedIPs`

No description provided.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.ip-allow-list.excludedIPs` |
| Type       | `string`                                                           |
| Required   | ✅                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |
| Min Length | `1`                                                                |

---

### `ingressMiddlewares.middlewares.traefik.ip-allow-list.ipStrategy`

No description provided.

| Field      | Value                                                             |
| ---------- | ----------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.ip-allow-list.ipStrategy` |
| Type       | `map`                                                             |
| Required   | ✅                                                                |
| Helm `tpl` | ❌                                                                |
| Default    | `{}`                                                              |

Example

```yaml
ingressMiddlewares:
  middlewares:
    traefik:
      ip-allow-list:
        ipStrategy:
          {}
```

---

### `ingressMiddlewares.middlewares.traefik.ip-allow-list.sourceRange`

No description provided.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.ip-allow-list.sourceRange` |
| Type       | `list of unknown`                                                  |
| Required   | ✅                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |
| Min Length | `1`                                                                |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: ip-allow-list
      data:
        sourceRange:
          - some-source-range
        ipStrategy:
          depth: 1
          excludedIPs:
            - some-excluded-ip
```
