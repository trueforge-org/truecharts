---
title: Nginx Integration
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/ingress/integrations/nginx#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.$name.integrations.nginx`

---

## `nginx`

ingress-nginx integration, see [nginx](/truecharts-common/ingress/integrations/nginx).

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Add the ingress-nginx annotations of this integration to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `themepark`

Theme Park theme of the app. Old spelling of `themePark`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.themepark` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themepark.enabled`

Inject the Theme Park CSS into the responses of the app.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.themepark.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `themepark.css`

URL of the Theme Park CSS.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.themepark.css` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themePark`

Theme Park theme of the app.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.themePark` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themePark.enabled`

Inject the Theme Park CSS into the responses of the app.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.themePark.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `themePark.css`

URL of the Theme Park CSS.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.themePark.css` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `ipWhitelist`

CIDRs that are allowed. Everything else is rejected.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.ipWhitelist` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
ingress:
  example:
    integrations:
      nginx:
        ipWhitelist:
          - 192.168.1.0/24
```

---

## `auth`

Forward authentication with authelia or authentik.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.auth` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth.type`

Authentication service: `authelia` or `authentik`. Leave empty to disable.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.auth.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth.internalHost`

Internal host of the authentication service.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.auth.internalHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth.externalHost`

External host of the authentication service.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.auth.externalHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth.responseHeaders`

Headers of the authentication response that are copied to the request to the app.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.nginx.auth.responseHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Allow list and theme

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      nginx:
        enabled: true
        ipWhitelist:
          - 192.168.0.0/16
          - 10.0.0.0/8
        themePark:
          enabled: true
          css: https://theme-park.dev/css/base/sonarr/dark.css
```

### Authentication

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      nginx:
        enabled: true
        auth:
          type: authelia
          internalHost: authelia.auth.svc.cluster.local
          externalHost: auth.example.com
          responseHeaders:
            - Remote-User
            - Remote-Groups
```
