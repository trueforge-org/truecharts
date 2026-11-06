---
title: forward-auth
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/forward-auth#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: forward-auth`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.address`

URL of the authentication service the request is forwarded to.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.address` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `forward-auth` |

---

## `data.authResponseHeadersRegex`

Regular expression of the authentication response headers that are copied to the request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.authResponseHeadersRegex` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `forward-auth` |

---

## `data.trustForwardHeader`

Trust the `X-Forwarded-*` headers of the request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.trustForwardHeader` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `forward-auth` |

---

## `data.authResponseHeaders`

Headers of the authentication response that are copied to the request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.authResponseHeaders` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `forward-auth` |

---

## `data.authRequestHeaders`

Request headers sent to the authentication service. Empty sends all.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.authRequestHeaders` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `forward-auth` |

---

## `data.tls`

TLS settings of the connection to the authentication service.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.tls` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `forward-auth` |

---

## `data.tls.insecureSkipVerify`

Skip the verification of the certificate of the authentication service.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.tls.insecureSkipVerify` |
| Type | `bool` |
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
