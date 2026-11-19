---
title: filters
---

:::note

- See the [Full Examples](/truecharts-common/route/rules/filters#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules[].filters`

---

## Child Pages

- [requestHeaderModifier](/truecharts-common/route/rules/filters/requestHeaderModifier)
- [requestMirror](/truecharts-common/route/rules/filters/requestMirror)

---

## `filters`

Filters applied to requests matching this rule. Only for `HTTPRoute` and `GRPCRoute`. A rule with only filters needs no `backendRefs`, eg a redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A filter applied to requests matching this rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].type`

Type of the filter. Sets which of the other keys is used. `RequestRedirect`, `URLRewrite` and `CORS` are only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].type` |
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
| Key | `route.$name.rules[].filters[].requestHeaderModifier` |
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
| Key | `route.$name.rules[].filters[].responseHeaderModifier` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestMirror`

Used with type `RequestMirror`.

See [requestMirror](/truecharts-common/route/rules/filters/requestMirror) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestMirror` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect`

Used with type `RequestRedirect`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.scheme`

Scheme of the redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect.scheme` |
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
| Key | `route.$name.rules[].filters[].requestRedirect.hostname` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.path`

Modification of the path.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect.path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.path.type`

How the path is modified: `ReplaceFullPath` or `ReplacePrefixMatch`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect.path.type` |
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
| Key | `route.$name.rules[].filters[].requestRedirect.path.replaceFullPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.path.replacePrefixMatch`

Path that replaces the matched prefix.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect.path.replacePrefixMatch` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.port`

Port of the redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect.port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].requestRedirect.statusCode`

Status code of the redirect, `301` or `302`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestRedirect.statusCode` |
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
| Key | `route.$name.rules[].filters[].urlRewrite` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.hostname`

Hostname that replaces the one of the request.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].urlRewrite.hostname` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.path`

Modification of the path.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].urlRewrite.path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.path.type`

How the path is modified: `ReplaceFullPath` or `ReplacePrefixMatch`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].urlRewrite.path.type` |
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
| Key | `route.$name.rules[].filters[].urlRewrite.path.replaceFullPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].urlRewrite.path.replacePrefixMatch`

Path that replaces the matched prefix.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].urlRewrite.path.replacePrefixMatch` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef`

Used with type `ExtensionRef`, a reference to an object in the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].extensionRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef.group`

API group of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].extensionRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef.kind`

Kind of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].extensionRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extensionRef.name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].extensionRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors`

Used with type `CORS`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowOrigins`

Origins that are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors.allowOrigins` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowCredentials`

Whether credentials are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors.allowCredentials` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowMethods`

Methods that are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors.allowMethods` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.allowHeaders`

Request headers that are allowed.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors.allowHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.exposeHeaders`

Response headers that are exposed to the client.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors.exposeHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].cors.maxAge`

Seconds a preflight response can be cached.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].cors.maxAge` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  redirect:
    rules:
      - filters:
          - type: RequestRedirect
            requestRedirect:
              scheme: https
              statusCode: 301
```

```yaml
route:
  web:
    rules:
      - filters:
          - type: RequestHeaderModifier
            requestHeaderModifier:
              add:
                - name: X-Example
                  value: example
```
