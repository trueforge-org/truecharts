---
title: traefik
---

:::note

- See the [Full Examples](/truecharts-common/route/integrations/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.integrations.traefik`

---

## `traefik`

Traefik `Middleware` objects attached to the route as `ExtensionRef` filters. Only for `HTTPRoute` and `GRPCRoute`. Needs the kubernetesCRD provider of Traefik enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `ipWhitelist`

Allowed source IPs, everything else is rejected.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipWhitelist` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `ipStrategy`

How Traefik determines the source IP.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `ipStrategy.depth`

Position of the IP to use in `X-Forwarded-For`, counted from the right.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy.depth` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `ipStrategy.excludedIPs`

IPs to skip in `X-Forwarded-For`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy.excludedIPs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `ipStrategy.ipv6Subnet`

Prefix length to group IPv6 addresses by.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy.ipv6Subnet` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth`

Authentication through Authelia or Authentik.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth.type`

Auth provider, empty to disable.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `""`, `"authentik"`, `"authelia"` |

---

## `auth.internalHost`

Internal domain name and port of the auth provider, excluding http(s).

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth.internalHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `auth.responseHeaders`

Override the default response headers passed on to the app.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth.responseHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themePark`

Theme park plugin, needs the plugin installed in Traefik. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themePark.enabled`

Enable the theme.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `themePark.app`

Name of the theme.park app.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark.app` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `themePark.theme`

Name of the theme.park theme.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark.theme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `redirectRegex`

List of `regex`, `replacement` and `permanent`. Only for `HTTPRoute`. The regex must match the whole path, and each one is its own rule. The replacement can use capture groups.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[]`

A redirect rule of the traefik integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[].regex`

Regex matching the whole path of the request. The `^` and `$` anchors are optional.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[].regex` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[].replacement`

URL to redirect to. Can use capture groups from the regex.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[].replacement` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[].permanent`

Use a permanent redirect (301) instead of a temporary one (302).

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[].permanent` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares`

Other middlewares from `ingressMiddlewares.traefik`, same as an ingress.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[]`

A middleware of the traefik integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[].name`

Name of the middleware. If expanded, it must be defined under `ingressMiddlewares.traefik`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[].namespace`

Namespace of the middleware. It must be the same as the route, which is also the default.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[].namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `middlewares[].expandObjectName`

Whether to expand the name with the chart name. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[].expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chartMiddlewares`

Middlewares set by the chart, same as an ingress.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.chartMiddlewares` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  main:
    integrations:
      traefik:
        enabled: true
        ipWhitelist:
          - 192.168.0.0/16
        ipStrategy:
          depth: 1
        auth:
          type: authelia
          internalHost: authelia.auth.svc.cluster.local
          responseHeaders:
            - Remote-User
        themePark:
          enabled: true
          app: sonarr
          theme: dark
        redirectRegex:
          - regex: ^/old/(.*)
            replacement: https://app.example.com/new/${1}
            permanent: true
        middlewares:
          - name: my-middleware
```
