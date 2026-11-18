---
title: matches
---

:::note

- See the [Full Examples](/truecharts-common/route/rules/matches#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules[].matches`

---

## `matches`

Conditions for matching requests. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A condition that a request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].path`

Path condition for the match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].path.type`

How the path is matched: `PathPrefix`, `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"PathPrefix"`, `"RegularExpression"` |

---

## `[].path.value`

Path that is matched. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path.value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].headers`

Headers the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].headers[]`

A header the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].headers[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].headers[].value`

Value that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].headers[].type`

How the value is matched: `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"RegularExpression"` |

---

## `[].queryParams`

Query parameters the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].queryParams[]`

A query parameter the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].queryParams[].name`

Name of the query parameter.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].queryParams[].value`

Value that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].queryParams[].type`

How the value is matched: `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"RegularExpression"` |

---

## `[].method`

HTTP method of the request for an `HTTPRoute`, or the gRPC service and method for a `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].method` |
| Type | `string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"GET"`, `"HEAD"`, `"POST"`, `"PUT"`, `"DELETE"`, `"CONNECT"`, `"OPTIONS"`, `"TRACE"`, `"PATCH"` |

---

## `[].method.type`

How the service and method are matched: `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].method.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"RegularExpression"` |

---

## `[].method.service`

Name of the gRPC service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].method.service` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].method.method`

Name of the gRPC method.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].method.method` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  admin:
    rules:
      - matches:
          - path:
              type: PathPrefix
              value: /admin
```

```yaml
route:
  grpc:
    rules:
      - matches:
          - method:
              service: my.package.Greeter
              method: SayHello
```

```yaml
route:
  main:
    rules:
      - matches:
          - path:
              type: PathPrefix
              value: /
```
