---
title: endpointSelector
---

:::note

- See the [Full Examples](/truecharts-common/networkpolicy/endpointSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.$name.endpointSelector`

---

## `endpointSelector`

Cilium only. Select the endpoints to which this policy applies, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `matchLabels`

Match endpoints by labels

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions`

Match endpoints by label expressions

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
networkpolicy:
  example:
    endpointSelector:
      matchLabels:
        example: example
      matchExpressions:
        - key: example
          operator: example
```
