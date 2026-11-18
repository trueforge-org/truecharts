---
title: requestMirror
---

:::note

- See the [Full Examples](/truecharts-common/route/rules/backendRefs/filters/requestMirror#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules[].backendRefs[].filters[].requestMirror`

---

## `requestMirror`

Used with type `RequestMirror`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendRef`

Backend that receives a copy of the requests. Needs a `port` for a Service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.backendRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendRef.group`

API group of the object. An empty string is the core group.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.backendRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendRef.kind`

Kind of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.backendRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendRef.name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.backendRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendRef.namespace`

Namespace of the object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.backendRef.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backendRef.port`

Port of the backend. Needed for a Service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.backendRef.port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `percent`

Percentage of the requests that is mirrored.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.percent` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fraction`

Fraction of the requests that is mirrored. Cannot be used with `percent`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.fraction` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fraction.numerator`

Numerator of the fraction.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.fraction.numerator` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fraction.denominator`

Denominator of the fraction. Defaults to 100.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].requestMirror.fraction.denominator` |
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
              - requestMirror:
                  backendRef:
                    group: example
                    kind: example
                  percent: 1
```
