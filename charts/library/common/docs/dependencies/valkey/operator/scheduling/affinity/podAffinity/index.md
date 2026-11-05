---
title: podAffinity
---

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity.podAffinity`
- `.Values.dependencies.valkey.operator.scheduling.affinity.podAntiAffinity`

---

## Child Pages

- [preferredDuringSchedulingIgnoredDuringExecution](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinity/preferredDuringSchedulingIgnoredDuringExecution)

---

## `podAffinity`

Pod affinity of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution`

Terms the pod must match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[]`

A pod affinity term: which pods to be close to or away from, and the topology domain that is compared.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector`

Pods the term matches.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaces` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector`

Namespaces the term matches, by their labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].topologyKey`

Node label key that defines the domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requiredDuringSchedulingIgnoredDuringExecution[].mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].mismatchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preferredDuringSchedulingIgnoredDuringExecution`

Terms the pod should match.

See [preferredDuringSchedulingIgnoredDuringExecution](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinity/preferredDuringSchedulingIgnoredDuringExecution) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
