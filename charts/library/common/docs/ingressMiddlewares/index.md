---
title: Middlewares
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares`

---

## Child Pages

- [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik)

---

## `ingressMiddlewares`

Ingress middlewares (Traefik Middleware objects), keyed by ingress controller and then by name. See [middlewares](/truecharts-common/ingressMiddlewares).

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `traefik`

Traefik middlewares, keyed by name.

See [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

Middlewares of this provider, keyed by name. Available providers: `traefik`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.$name`

A Middleware, keyed by name.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.$name.type`

Type of the Middleware. It decides which `data` keys are used.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"add-prefix"`, `"basic-auth"`, `"buffering"`, `"chain"`, `"compress"`, `"content-type"`, `"forward-auth"`, `"headers"`, `"ip-allow-list"`, `"plugin-bouncer"`, `"plugin-geoblock"`, `"plugin-mod-security"`, `"plugin-real-ip"`, `"plugin-rewrite-response-headers"`, `"plugin-theme-park"`, `"rate-limit"`, `"redirect-regex"`, `"redirect-scheme"`, `"replace-path-regex"`, `"replace-path"`, `"retry"`, `"strip-prefix-regex"`, `"strip-prefix"` |

---

## `$name.$name.enabled`

Create this Middleware. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.$name.namespace`

Namespace of the Middleware. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.$name.labels`

Additional labels of the Middleware.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.$name.annotations`

Additional annotations of the Middleware.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.$name.expandObjectName`

Prefix the name of the Middleware with the release fullname.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.$name.data`

Settings of the Middleware, passed on to the spec. The keys depend on `type`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.data` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.$name.data.$name`

A setting of the middleware, passed on as is.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.$name.$name.data.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Middleware with labels and annotations

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      expandObjectName: false
      labels:
        key: value
        keytpl: "{{ .Values.some.value }}"
      annotations:
        key: value
        keytpl: "{{ .Values.some.value }}"
      data:
        maxRequestBodyBytes: 1024
```

### Middleware in another namespace

```yaml
ingressMiddlewares:
  traefik:
    other-middleware-name:
      enabled: true
      type: rate-limit
      namespace: some-namespace
      data:
        average: 100
        burst: 200
```

### Use a middleware on an ingress

```yaml
ingressMiddlewares:
  traefik:
    redirect-https:
      enabled: true
      type: redirect-scheme
      data:
        scheme: https
        permanent: true

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
          - name: redirect-https
```
