---
title: nodeSelector
---

:::note

- See the [Full Examples](/truecharts-common/networkPolicy/nodeSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkPolicy.$name.nodeSelector`

---

## `nodeSelector`

Cilium only. Host policy, select the nodes to which this policy applies instead of pods. Requires `clusterwide: true`, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `matchLabels`

Match nodes by labels

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions`

Match nodes by label expressions

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchExpressions` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
networkPolicy:
  host-policy:
    nodeSelector:
      matchLabels:
        node-role.kubernetes.io/control-plane: ''
```
