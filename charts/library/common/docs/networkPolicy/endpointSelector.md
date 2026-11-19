---
title: endpointSelector
---

:::note

- See the [Full Examples](/truecharts-common/networkPolicy/endpointSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkPolicy.$name.endpointSelector`

---

## `endpointSelector`

Cilium only. Select the endpoints to which this policy applies, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `matchLabels`

Match endpoints by labels

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions`

Match endpoints by label expressions

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchExpressions` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Select endpoints with matchLabels

```yaml
networkPolicy:
  protect-database:
    enabled: true
    type: cilium
    endpointSelector:
      matchLabels:
        app.kubernetes.io/name: postgresql
    ingress:
      - fromEndpoints:
          - matchLabels:
              app.kubernetes.io/name: my-app
        toPorts:
          - ports:
              - port: "5432"
                protocol: TCP
```

### Select endpoints with matchExpressions

```yaml
networkPolicy:
  protect-workers:
    enabled: true
    type: cilium
    endpointSelector:
      matchExpressions:
        - key: app.kubernetes.io/component
          operator: In
          values:
            - worker
            - scheduler
    ingress:
      - fromEntities:
          - cluster
```
