---
title: Forward Auth
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/forward-auth#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.forward-auth`

---

## `ingressMiddlewares.middlewares.traefik.forward-auth`

Configuration for the Traefik forward-auth middleware.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.address`

No description provided.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.address` |
| Type       | `string`                                                      |
| Required   | ✅                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |
| Min Length | `1`                                                           |

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.authRequestHeaders`

No description provided.

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.authRequestHeaders` |
| Type       | `list of unknown`                                                        |
| Required   | ✅                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | `[]`                                                                     |
| Min Length | `1`                                                                      |

Example

```yaml
ingressMiddlewares:
  middlewares:
    traefik:
      forward-auth:
        authRequestHeaders:
          []
```

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.authResponseHeaders`

No description provided.

| Field      | Value                                                                     |
| ---------- | ------------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.authResponseHeaders` |
| Type       | `list of unknown`                                                         |
| Required   | ✅                                                                        |
| Helm `tpl` | ❌                                                                        |
| Default    | `[]`                                                                      |
| Min Length | `1`                                                                       |

Example

```yaml
ingressMiddlewares:
  middlewares:
    traefik:
      forward-auth:
        authResponseHeaders:
          []
```

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.authResponseHeadersRegex`

No description provided.

| Field      | Value                                                                          |
| ---------- | ------------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.authResponseHeadersRegex` |
| Type       | `string`                                                                       |
| Required   | ✅                                                                             |
| Helm `tpl` | ❌                                                                             |
| Default    | unset                                                                          |
| Min Length | `1`                                                                            |

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.insecureSkipVerify`

No description provided.

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.insecureSkipVerify` |
| Type       | `boolean`                                                                |
| Required   | ✅                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | unset                                                                    |

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.tls`

No description provided.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.tls` |
| Type       | `map`                                                     |
| Required   | ✅                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | `{}`                                                      |

Example

```yaml
ingressMiddlewares:
  middlewares:
    traefik:
      forward-auth:
        tls:
          {}
```

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.trustForwardHeader`

No description provided.

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.trustForwardHeader` |
| Type       | `boolean`                                                                |
| Required   | ✅                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | `false`                                                                  |

Example

```yaml
ingressMiddlewares:
  middlewares:
    traefik:
      forward-auth:
        trustForwardHeader: false
```

---

### `ingressMiddlewares.middlewares.traefik.forward-auth.maxResponseBodySize`

Define the maxResponseBodySize

|            |                                                                           |
| ---------- | -----------------------------------------------------------               |
| Key        | `ingressMiddlewares.middlewares.traefik.forward-auth.maxResponseBodySize` |
| Type       | `int`                                                                     |
| Required   | ❌                                                                        |
| Helm `tpl` | ❌                                                                        |
| Default    | `-1` (unlimited)                                                          |

Example

```yaml
ingressMiddlewares:
  middlewares:
    traefik:
      forward-auth:
        maxResponseBodySize: 1048576 # 1MB
```

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: forward-auth
      data:
        address: some-address
        authResponseHeadersRegex: some-regex
        trustForwardHeader: true
        authResponseHeaders:
          - some-header
        authRequestHeaders:
          - some-header
        tls:
          insecureSkipVerify: true
```
