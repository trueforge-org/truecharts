---
title: egress
---

:::note

- See the [Full Examples](/truecharts-common/networkPolicy/egress#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkPolicy.$name.egress`

---

## `egress`

Egress rules.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

An egress rule.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to`

Peers that may receive traffic.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[]`

A peer that may receive traffic.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector`

Select pods in the policy namespace.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].podSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].to[].podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector`

Select namespaces by labels.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].to[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].ipBlock`

A CIDR, with exceptions.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].ipBlock` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].ipBlock.cidr`

CIDR range to match.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].ipBlock.cidr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to[].ipBlock.except`

CIDR ranges excluded from the block.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to[].ipBlock.except` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports`

Ports allowed by this rule.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[]`

A port that traffic is allowed to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].protocol`

Protocol of the port, `TCP`, `UDP` or `SCTP`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"TCP"`, `"UDP"`, `"SCTP"` |

---

## `[].ports[].port`

Port number or named port. Omit to match all ports.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[].port` |
| Type | `int or string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].endPort`

End of an inclusive port range.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[].endPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
networkPolicy:
  allow-external:
    egress:
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
```

```yaml
networkPolicy:
  allow-database:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
      - to:
          - namespaceSelector:
              matchLabels:
                kubernetes.io/metadata.name: kube-system
        ports:
          - protocol: UDP
            port: 53
```
