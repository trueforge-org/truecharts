---
title: filters
---

:::note

- See the [Full Examples](/truecharts-common/route/rules/backendRefs/filters#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules[].backendRefs[].filters`

---

## Child Pages

- [requestMirror](/truecharts-common/route/rules/backendRefs/filters/requestMirror)

---

## `filters`

Filters applied only to this backend. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A filter applied to this backend only.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].type`

Type of the filter. Sets which of the other keys is used. `RequestRedirect`, `URLRewrite` and `CORS` are only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"RequestHeaderModifier"`, `"ResponseHeaderModifier"`, `"RequestMirror"`, `"RequestRedirect"`, `"URLRewrite"`, `"ExtensionRef"`, `"CORS"` |

---

## `[].requestHeaderModifier`

Used with type `RequestHeaderModifier`.

See [requestHeaderModifier](/truecharts-common/route/rules/filters/requestHeaderModifier) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestHeaderModifier` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].responseHeaderModifier`

Used with type `ResponseHeaderModifier`.

See [requestHeaderModifier](/truecharts-common/route/rules/filters/requestHeaderModifier) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].responseHeaderModifier` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestMirror`

Used with type `RequestMirror`.

See [requestMirror](/truecharts-common/route/rules/backendRefs/filters/requestMirror) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect`

Used with type `RequestRedirect`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.scheme`

Scheme of the redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"http"`, `"https"` |

---

## `[].requestRedirect.hostname`

Hostname of the redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.hostname` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.path`

Modification of the path.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.path.type`

How the path is modified: `ReplaceFullPath` or `ReplacePrefixMatch`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.path.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"ReplaceFullPath"`, `"ReplacePrefixMatch"` |

---

## `[].requestRedirect.path.replaceFullPath`

Path that replaces the full path.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.path.replaceFullPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.path.replacePrefixMatch`

Path that replaces the matched prefix.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.path.replacePrefixMatch` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.port`

Port of the redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.statusCode`

Status code of the redirect, `301` or `302`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestRedirect.statusCode` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `301`, `302` |

---

## `[].urlRewrite`

Used with type `URLRewrite`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].urlRewrite` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.hostname`

Hostname that replaces the one of the request.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].urlRewrite.hostname` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.path`

Modification of the path.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].urlRewrite.path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.path.type`

How the path is modified: `ReplaceFullPath` or `ReplacePrefixMatch`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].urlRewrite.path.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"ReplaceFullPath"`, `"ReplacePrefixMatch"` |

---

## `[].urlRewrite.path.replaceFullPath`

Path that replaces the full path.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].urlRewrite.path.replaceFullPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.path.replacePrefixMatch`

Path that replaces the matched prefix.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].urlRewrite.path.replacePrefixMatch` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef`

Used with type `ExtensionRef`, a reference to an object in the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].extensionRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef.group`

API group of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].extensionRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef.kind`

Kind of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].extensionRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef.name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].extensionRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors`

Used with type `CORS`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowOrigins`

Origins that are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors.allowOrigins` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowCredentials`

Whether credentials are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors.allowCredentials` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowMethods`

Methods that are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors.allowMethods` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowHeaders`

Request headers that are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors.allowHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.exposeHeaders`

Response headers that are exposed to the client.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors.exposeHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.maxAge`

Seconds a preflight response can be cached.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].cors.maxAge` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
route:
  example:
    rules:
      - backendRefs:
          - filters:
              - type: RequestHeaderModifier
```
