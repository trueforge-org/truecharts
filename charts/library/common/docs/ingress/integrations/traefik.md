---
title: Traefik Integration
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/ingress/integrations/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.$name.integrations.traefik`
- `.Values.addons.codeserver.ingress.integrations.traefik`
- `.Values.addons.codeserver.ingress.$name.integrations.traefik`

---

## `traefik`

Traefik integration. Adds annotations and middlewares to the Ingress, see [Traefik](/truecharts-common/ingress/integrations/traefik).

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Add the Traefik annotations and middlewares to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `entrypoints`

Traefik entrypoints the Ingress is exposed on, set in the `traefik.ingress.kubernetes.io/router.entrypoints` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.entrypoints` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `["websecure"]` |

Example

```yaml
ingress:
  example:
    integrations:
      traefik:
        entrypoints:
          - websecure
```

---

## `forceTLS`

Only accept TLS connections on the router. Adds the `traefik.ingress.kubernetes.io/router.tls` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.forceTLS` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `middlewares`

Traefik middlewares applied to the Ingress, in order. They can be created with `ingressMiddlewares.traefik`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.middlewares` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `middlewares[]`

A middleware applied to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.middlewares[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[].expandObjectName`

Prefix `name` with the release fullname. Set to `false` for a middleware that is not created by this chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.middlewares[].expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[].name`

Name of the middleware.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.middlewares[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[].namespace`

Namespace of the middleware. Defaults to the namespace of the Ingress.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.middlewares[].namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chartMiddlewares`

Same as `middlewares`, but meant for the chart developer to add middlewares specific to this Ingress. See [Traefik](/truecharts-common/ingress/integrations/traefik).

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.chartMiddlewares` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `chartMiddlewares[]`

A middleware applied to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.chartMiddlewares[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chartMiddlewares[].expandObjectName`

Prefix `name` with the release fullname. Set to `false` for a middleware that is not created by this chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.chartMiddlewares[].expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chartMiddlewares[].name`

Name of the middleware.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.chartMiddlewares[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chartMiddlewares[].namespace`

Namespace of the middleware. Defaults to the namespace of the Ingress.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.traefik.chartMiddlewares[].namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Entrypoints and TLS

```yaml
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
        entrypoints:
          - websecure
        forceTLS: true
```

### With middlewares

`middlewares` references middlewares that exist outside of the chart, `chartMiddlewares` references middlewares from [`ingressMiddlewares`](/truecharts-common/ingressMiddlewares/traefik) in the same chart.

```yaml
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
        entrypoints:
          - websecure
        forceTLS: true
        middlewares:
          - name: shared-auth
            namespace: traefik
            expandObjectName: false
        chartMiddlewares:
          - name: rate-limit

ingressMiddlewares:
  traefik:
    rate-limit:
      enabled: true
      type: rate-limit
      data:
        average: 100
        burst: 200
```
