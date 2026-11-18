---
title: backendRefs
---

:::note

- See the [Full Examples](/truecharts-common/route/rules/backendRefs#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules[].backendRefs`

---

## Child Pages

- [filters](/truecharts-common/route/rules/backendRefs/filters)

---

## `backendRefs`

Where to send requests. Without this and without `filters`, the rule uses the primary service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A backend the requests are sent to.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].group`

API group of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].kind`

Kind of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the object, without any expanding. Cannot be used with `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespace`

Namespace of the backend. Defaults to the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].port`

Port of the backend. Defaults to the primary port of the selected service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].port` |
| Type | `null or int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].weight`

Share of the requests for this backend. Set to `0` to stop sending traffic to it. Defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].targetSelector`

Name of a service in this chart, or a map of `service: port` to select a port by name. Cannot be used with `name`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].targetSelector` |
| Type | `null or string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].targetSelector.$name`

Name of the port of the Service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].targetSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].filters`

Filters applied only to this backend. Only for `HTTPRoute` and `GRPCRoute`.

See [filters](/truecharts-common/route/rules/backendRefs/filters) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  dns:
    rules:
      - backendRefs:
          - targetSelector: dns
```

```yaml
route:
  grpc:
    rules:
      - backendRefs:
          - targetSelector: grpc
```

```yaml
route:
  mqtt:
    rules:
      - backendRefs:
          - targetSelector: mqtt
```
