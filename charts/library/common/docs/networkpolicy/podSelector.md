---
title: podSelector
---

## Appears in

- `.Values.networkpolicy.$name.podSelector`

---

## `podSelector`

Custom Kubernetes label selector for pods to which this policy applies.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Pattern | `^\{\{.*\}\}$` |

---

## `matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
