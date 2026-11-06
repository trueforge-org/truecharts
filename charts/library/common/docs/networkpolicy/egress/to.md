---
title: to
---

:::note

- See the [Full Examples](/truecharts-common/networkpolicy/egress/to#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.$name.egress[].to`

---

## `to`

Peers that may receive traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A peer that may receive traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector`

Select pods in the policy namespace.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector`

Select namespaces by labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ipBlock`

A CIDR, with exceptions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].ipBlock` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ipBlock.cidr`

CIDR range to match.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].ipBlock.cidr` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ipBlock.except`

CIDR ranges excluded from the block.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].ipBlock.except` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
networkpolicy:
  allow-database:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
```

```yaml
networkpolicy:
  api-policy:
    egress:
      - to:
          - namespaceSelector:
              matchLabels:
                name: kube-system
```

```yaml
networkpolicy:
  api-policy:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
```
