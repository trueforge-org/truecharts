---
title: preferredDuringSchedulingIgnoredDuringExecution
---

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution`

---

## `preferredDuringSchedulingIgnoredDuringExecution`

Terms the pod should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].weight`

Weight of the term, from 1 to 100.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 100 |

---

## `[].podAffinityTerm`

Term the pod should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector`

Pods the term matches.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.labelSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].podAffinityTerm.labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaces` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector`

Namespaces the term matches, by their labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `[].podAffinityTerm.namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.topologyKey`

Node label key that defines the domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].podAffinityTerm.mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.mismatchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
