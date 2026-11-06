---
title: rules
---

:::note

- See the [Full Examples](/truecharts-common/route/rules#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules`

---

## `rules`

Routing rules.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A routing rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs`

Where to send requests. Defaults to the primary service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[]`

A backend the requests are sent to.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].group`

API group of the backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `[].backendRefs[].kind`

Kind of the backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Service"` |

---

## `[].backendRefs[].name`

Name of the backend. Defaults to the primary service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].namespace`

Namespace of the backend. Defaults to the release namespace.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].port`

Port of the backend. Defaults to the primary port of the primary service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].port` |
| Type | `null or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].weight`

Share of the requests for this backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `1` |

---

## `[].matches`

Conditions for matching requests. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[]`

A condition that a request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].path`

Path condition for the match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].path.type`

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

## `[].matches[].path.value`

Path that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path.value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].headers`

Headers the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].headers[]`

A header the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].headers[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].headers[].value`

Value that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].headers[].type`

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

## `[].matches[].queryParams`

Query parameters the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].queryParams[]`

A query parameter the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].queryParams[].name`

Name of the query parameter.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].queryParams[].value`

Value that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches[].queryParams[].type`

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

## `[].matches[].method`

HTTP method of the request.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].method` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  grpc:
    rules:
      - backendRefs:
          - port: 50051
```

```yaml
route:
  mqtt:
    rules:
      - backendRefs:
          - port: 1883
```

```yaml
route:
  main:
    rules:
      - backendRefs:
          - port: 8080
        matches:
          - path:
              type: PathPrefix
              value: /
```
