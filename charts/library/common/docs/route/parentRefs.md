---
title: parentRefs
---

:::note

- See the [Full Examples](/truecharts-common/route/parentRefs#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.parentRefs`

---

## `parentRefs`

Gateways or ListenerSets the route attaches to.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A Gateway or ListenerSet the route attaches to.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].group`

API group of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].kind`

Kind of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the parent.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].namespace`

Namespace of the parent. Defaults to the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].sectionName`

Attach to a single listener of the gateway. With `targetSelector` it must be a listener of that gateway.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].sectionName` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].targetSelector`

Name of a gateway in this chart. Takes the place of `name` and `namespace`.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].targetSelector` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].port`

Attach to the listeners of the gateway on this port.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].port` |
| Type | `null or int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  dns:
    parentRefs:
      - targetSelector: main
        sectionName: dns
```

```yaml
route:
  grpc:
    parentRefs:
      - targetSelector: main
        sectionName: https
```

```yaml
route:
  mqtt:
    parentRefs:
      - targetSelector: main
        sectionName: mqtt
```
