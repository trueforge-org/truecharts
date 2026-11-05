---
title: rules
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.route.$name.rules`

---

## Child Pages

- [matches](/truecharts-common/route/rules/matches)

---

## `rules`

Routing rules. Without rules everything goes to the primary service. Fields the route kind does not support fail rendering.

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

Where to send requests. Without this and without `filters`, the rule uses the primary service.

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

API group of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].kind`

Kind of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].name`

Name of the object, without any expanding. Cannot be used with `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].namespace`

Namespace of the backend. Defaults to the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].port`

Port of the backend. Defaults to the primary port of the selected service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].port` |
| Type | `null or int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].weight`

Share of the requests for this backend. Set to `0` to stop sending traffic to it. Defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].targetSelector`

Name of a service in this chart, or a map of `service: port` to select a port by name. Cannot be used with `name`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].targetSelector` |
| Type | `null or string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].targetSelector.$name`

Name of the port of the Service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].targetSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].filters`

Filters applied only to this backend. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].filters[]`

A filter applied to this backend only.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs[].filters[].$name`

A setting of the filter, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches`

Conditions for matching requests. Only for `HTTPRoute` and `GRPCRoute`.

See [matches](/truecharts-common/route/rules/matches) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].filters`

Filters applied to requests matching this rule. Only for `HTTPRoute` and `GRPCRoute`. A rule with only filters needs no `backendRefs`, eg a redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].filters[]`

A filter applied to requests matching this rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].filters[].$name`

A setting of the filter, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].timeouts`

`request` and `backendRequest` timeouts. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].timeouts.request`

Timeout for the complete request, expressed as a duration such as `10s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts.request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
route:
  example:
    rules:
      - timeouts:
          request: 30s
```

---

## `[].timeouts.backendRequest`

Timeout for a backend request, expressed as a duration such as `5s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts.backendRequest` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
route:
  example:
    rules:
      - timeouts:
          backendRequest: 10s
```

---

## `[].retry`

Retry configuration. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].retry.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence`

Session persistence, needs the experimental Gateway API channel. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
