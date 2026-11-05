---
title: envoy
---

## Appears in

- `.Values.route.$name.integrations.envoy`

---

## `envoy`

Envoy Gateway policies that target the route. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `ipWhitelist`

Allowed source IPs, everything else is rejected.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.ipWhitelist` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth`

Authentication through Authelia or Authentik.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth.type`

Auth provider, empty to disable.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `""`, `"authentik"`, `"authelia"` |

---

## `auth.internalHost`

`service:port` or `service.namespace.svc.cluster.local:port`. A service in another namespace needs a `ReferenceGrant` in that namespace.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth.internalHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `auth.responseHeaders`

Override the default response headers passed on to the app.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth.responseHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themePark`

`css` URL added to HTML responses with Lua. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.themePark` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `themePark.enabled`

Enable the theme.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.themePark.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `themePark.css`

URL of the CSS file added to HTML responses.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.themePark.css` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `redirectRegex`

List of `regex`, `replacement` and `permanent`. Only for `HTTPRoute`. The regex must match the whole path, and each one is its own rule. The replacement must be a fixed target without capture groups.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[]`

A redirect rule of the envoy integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[].regex`

Regex matching the whole path of the request.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[].regex` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[].replacement`

Fixed URL to redirect to. Capture groups, a query and a fragment are not supported.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[].replacement` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `redirectRegex[].permanent`

Use a permanent redirect (301) instead of a temporary one (302).

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[].permanent` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityPolicy`

Other `SecurityPolicy` settings, without a target. Merged with `ipWhitelist` and `auth`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.securityPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityPolicy.$name`

A setting of the policy, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.securityPolicy.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendTrafficPolicy`

`BackendTrafficPolicy` settings, without a target.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.backendTrafficPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendTrafficPolicy.$name`

A setting of the policy, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.backendTrafficPolicy.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `extensionPolicy`

`EnvoyExtensionPolicy` settings, without a target. Merged with `themePark`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.extensionPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `extensionPolicy.$name`

A setting of the policy, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.extensionPolicy.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
