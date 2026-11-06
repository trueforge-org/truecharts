---
title: Traefik Middlewares
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik`

---

## Child Pages

- [add-prefix](/truecharts-common/ingressMiddlewares/traefik/add-prefix)
- [basic-auth](/truecharts-common/ingressMiddlewares/traefik/basic-auth)
- [buffering](/truecharts-common/ingressMiddlewares/traefik/buffering)
- [chain](/truecharts-common/ingressMiddlewares/traefik/chain)
- [compress](/truecharts-common/ingressMiddlewares/traefik/compress)
- [content-type](/truecharts-common/ingressMiddlewares/traefik/content-type)
- [forward-auth](/truecharts-common/ingressMiddlewares/traefik/forward-auth)
- [headers](/truecharts-common/ingressMiddlewares/traefik/headers)
- [ip-allow-list](/truecharts-common/ingressMiddlewares/traefik/ip-allow-list)
- [plugin-bouncer](/truecharts-common/ingressMiddlewares/traefik/plugin-bouncer)
- [plugin-geoblock](/truecharts-common/ingressMiddlewares/traefik/plugin-geoblock)
- [plugin-mod-security](/truecharts-common/ingressMiddlewares/traefik/plugin-mod-security)
- [plugin-real-ip](/truecharts-common/ingressMiddlewares/traefik/plugin-real-ip)
- [plugin-rewrite-response-headers](/truecharts-common/ingressMiddlewares/traefik/plugin-rewrite-response-headers)
- [plugin-theme-park](/truecharts-common/ingressMiddlewares/traefik/plugin-theme-park)
- [rate-limit](/truecharts-common/ingressMiddlewares/traefik/rate-limit)
- [redirect-regex](/truecharts-common/ingressMiddlewares/traefik/redirect-regex)
- [redirect-scheme](/truecharts-common/ingressMiddlewares/traefik/redirect-scheme)
- [replace-path](/truecharts-common/ingressMiddlewares/traefik/replace-path)
- [replace-path-regex](/truecharts-common/ingressMiddlewares/traefik/replace-path-regex)
- [retry](/truecharts-common/ingressMiddlewares/traefik/retry)
- [strip-prefix](/truecharts-common/ingressMiddlewares/traefik/strip-prefix)
- [strip-prefix-regex](/truecharts-common/ingressMiddlewares/traefik/strip-prefix-regex)

---

## `traefik`

Traefik middlewares, keyed by name.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers`

A middleware with basic security headers, shipped by common.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.enabled`

Enable the middleware.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tc-basic-secure-headers.type`

Type of the middleware.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"add-prefix"`, `"basic-auth"`, `"buffering"`, `"chain"`, `"compress"`, `"content-type"`, `"forward-auth"`, `"headers"`, `"ip-allow-list"`, `"plugin-bouncer"`, `"plugin-geoblock"`, `"plugin-mod-security"`, `"plugin-real-ip"`, `"plugin-rewrite-response-headers"`, `"plugin-theme-park"`, `"rate-limit"`, `"redirect-regex"`, `"redirect-scheme"`, `"replace-path-regex"`, `"replace-path"`, `"retry"`, `"strip-prefix-regex"`, `"strip-prefix"` |

---

## `tc-basic-secure-headers.data`

Settings of the middleware, depending on its `type`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.accessControlAllowMethods`

Request methods allowed by CORS, for `Access-Control-Allow-Methods`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.accessControlAllowMethods` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.accessControlMaxAge`

Seconds a CORS preflight request can be cached, for `Access-Control-Max-Age`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.accessControlMaxAge` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.stsSeconds`

`max-age` of the `Strict-Transport-Security` header, in seconds. `0` disables it.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.stsSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.forceSTSHeader`

Also add the `Strict-Transport-Security` header on plain HTTP requests.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.forceSTSHeader` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.contentTypeNosniff`

Set `X-Content-Type-Options: nosniff`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.contentTypeNosniff` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.browserXssFilter`

Set `X-XSS-Protection: 1; mode=block`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.browserXssFilter` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.referrerPolicy`

Value of the `Referrer-Policy` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.referrerPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.customRequestHeaders`

Headers added to the request, keyed by name. An empty value removes the header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.customRequestHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tc-basic-secure-headers.data.customRequestHeaders.X-Forwarded-Proto`

Value of the `X-Forwarded-Proto` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.tc-basic-secure-headers.data.customRequestHeaders.X-Forwarded-Proto` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A Traefik Middleware, keyed by name.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this Middleware. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.type`

Type of the Middleware, for example `basicAuth` or `redirectScheme`. It decides which `data` keys are used, see [Traefik middlewares](/truecharts-common/ingressMiddlewares/traefik).

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"add-prefix"`, `"basic-auth"`, `"buffering"`, `"chain"`, `"compress"`, `"content-type"`, `"forward-auth"`, `"headers"`, `"ip-allow-list"`, `"plugin-bouncer"`, `"plugin-geoblock"`, `"plugin-mod-security"`, `"plugin-real-ip"`, `"plugin-rewrite-response-headers"`, `"plugin-theme-park"`, `"rate-limit"`, `"redirect-regex"`, `"redirect-scheme"`, `"replace-path-regex"`, `"replace-path"`, `"retry"`, `"strip-prefix-regex"`, `"strip-prefix"` |

---

## `$name.namespace`

Namespace of the Middleware. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Additional labels of the Middleware.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations of the Middleware.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.expandObjectName`

Prefix the name of the Middleware with the release fullname.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.expandObjectName` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.data`

Settings of the middleware, depending on its `type`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Several middlewares

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      expandObjectName: false
      labels:
        key: value
      annotations:
        key: value
      data:
        maxRequestBodyBytes: 1024

    other-middleware-name:
      enabled: true
      type: buffering
      namespace: some-namespace
      data:
        maxRequestBodyBytes: 1024
```

### Combine middlewares in a chain and use it on an ingress

```yaml
ingressMiddlewares:
  traefik:
    secure-headers:
      enabled: true
      type: headers
      data:
        stsSeconds: 31536000
        stsIncludeSubdomains: true
        frameDeny: true
    limit:
      enabled: true
      type: rate-limit
      data:
        average: 100
        burst: 200
    default-chain:
      enabled: true
      type: chain
      data:
        middlewares:
          - name: secure-headers
          - name: limit

ingress:
  main:
    enabled: true
    ingressClassName: traefik
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      traefik:
        enabled: true
        chartMiddlewares:
          - name: default-chain
```
