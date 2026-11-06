---
title: topologySpreadConstraints
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/topologySpreadConstraints#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.topologySpreadConstraints`

---

## `topologySpreadConstraints`

Topology spread constraints of the pods, for topology keys other than the hostname and the zone (use `node.spread` and `zone.spread` for those).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A rule that spreads the valkey pods evenly across topology domains.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].maxSkew`

Maximum difference in the number of matching pods between two domains.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].maxSkew` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `[].topologyKey`

Node label key that defines a domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].whenUnsatisfiable`

What to do when the constraint can not be satisfied: keep the pod `Pending`, or schedule it anyway.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].whenUnsatisfiable` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"DoNotSchedule"`, `"ScheduleAnyway"` |

---

## `[].labelSelector`

Pods the constraint counts.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].labelSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].minDomains`

Minimum number of eligible domains.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].minDomains` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `[].nodeAffinityPolicy`

Whether the node affinity of the pod is honored when counting the domains.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].nodeAffinityPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## `[].nodeTaintsPolicy`

Whether the taints of the nodes are honored when counting the domains.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].nodeTaintsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## `[].matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
dependencies:
  valkey:
    operator:
      scheduling:
        topologySpreadConstraints:
          - maxSkew: 1
            topologyKey: example
            whenUnsatisfiable: DoNotSchedule
```
