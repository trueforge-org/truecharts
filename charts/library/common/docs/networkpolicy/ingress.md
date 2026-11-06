---
title: ingress
---

:::note

- See the [Full Examples](/truecharts-common/networkpolicy/ingress#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.$name.ingress`

---

## `ingress`

Ingress rules.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

An ingress rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from`

Peers allowed to send traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[]`

A peer that may send traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector`

Select pods in the policy namespace.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].podSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].from[].podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector`

Select namespaces by labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].from[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].ipBlock`

A CIDR, with exceptions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].ipBlock` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].ipBlock.cidr`

CIDR range to match.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].ipBlock.cidr` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].from[].ipBlock.except`

CIDR ranges excluded from the block.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].ipBlock.except` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports`

Ports allowed by this rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[]`

A port that traffic is allowed to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].protocol`

Protocol of the port, `TCP`, `UDP` or `SCTP`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports[].protocol` |
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
| Key | `networkpolicy.$name.ingress[].ports[].port` |
| Type | `int or string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].endPort`

End of an inclusive port range.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports[].endPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `[].fromEntities`

Cilium only: entities (for example `world`, `cluster`, `host` or `all`) allowed to send traffic. Ignored for Kubernetes NetworkPolicies.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromEndpoints`

Cilium only: endpoints, by labels, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromCIDR`

Cilium only: CIDRs the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromCIDRSet`

Cilium only: CIDRs with exceptions the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toPorts`

Cilium only: ports, with optional L7 rules, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].icmps`

Cilium only: ICMP types the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
networkpolicy:
  allow-same-namespace:
    ingress:
      - from:
          - podSelector: {}
```

```yaml
networkpolicy:
  deny-ingress:
    ingress:
      - fromEntities:
          - cluster
```

```yaml
networkpolicy:
  host-policy:
    ingress:
      - fromEntities:
          - cluster
```
