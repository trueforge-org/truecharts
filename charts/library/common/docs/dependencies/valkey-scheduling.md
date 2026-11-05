---
title: Valkey Operator Scheduling
---

## Appears in

- `.Values.dependencies.valkey.operator.scheduling`

---

## `scheduling`

Scheduling of the pods: `tolerations`, `nodeSelector`, `affinity`, `topologySpreadConstraints`, `priorityClassName`, `node` and `zone` (spreading and pinning).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `tolerations`

Tolerations of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[]`

A taint of a node that the valkey pods tolerate.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[].key`

Key of the taint the toleration matches. Matches all keys with `Exists` when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[].operator`

How the value of the taint is compared. Defaults to `Equal` in Kubernetes.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exists"`, `"Equal"`, `"Lt"`, `"Gt"` |

---

## `tolerations[].value`

Value of the taint the toleration matches, with `Equal`, `Lt` and `Gt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[].effect`

Effect of the taint the toleration matches. Matches all effects when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations[].effect` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"NoSchedule"`, `"PreferNoSchedule"`, `"NoExecute"` |

---

## `tolerations[].tolerationSeconds`

Seconds the pod stays on a node with a matching `NoExecute` taint.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.tolerations[].tolerationSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeSelector`

Labels the nodes of the pods must have.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.nodeSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeSelector.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.nodeSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity`

Node and pod affinity of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity`

Node affinity of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution`

Terms the node must match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms`

Terms, one of which the node must match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[]`

A node selector term: requirements on the labels or fields of a node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions`

Requirements on the labels of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].key`

Label key the requirement applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].operator`

Operator of the requirement.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"`, `"Gt"`, `"Lt"` |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].values`

Values of the label, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields`

Requirements on the fields of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].key`

Field the requirement applies to, for example `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].operator`

Operator of the requirement.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"`, `"Gt"`, `"Lt"` |

---

## `affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].values`

Values of the field, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution`

Terms the node should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight`

Weight of the term, from 1 to 100.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 100 |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference`

Term the node should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions`

Requirements on the labels of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].key`

Label key the requirement applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].operator`

Operator of the requirement.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"`, `"Gt"`, `"Lt"` |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].values`

Values of the label, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields`

Requirements on the fields of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].key`

Field the requirement applies to, for example `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].operator`

Operator of the requirement.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"`, `"Gt"`, `"Lt"` |

---

## `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].values`

Values of the field, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity`

Pod affinity of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution`

Terms the pod must match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[]`

A pod affinity term: which pods to be close to or away from, and the topology domain that is compared.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector`

Pods the term matches.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].operator`

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

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaces` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector`

Namespaces the term matches, by their labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].operator`

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

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].topologyKey`

Node label key that defines the domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[].mismatchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution`

Terms the pod should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight`

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

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm`

Term the pod should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector`

Pods the term matches.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].operator`

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

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaces` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector`

Namespaces the term matches, by their labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].operator`

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

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.topologyKey`

Node label key that defines the domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.mismatchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity`

Pod anti-affinity of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution`

Terms the pod must match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[]`

A pod affinity term: which pods to be close to or away from, and the topology domain that is compared.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector`

Pods the term matches.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaces` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector`

Namespaces the term matches, by their labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].topologyKey`

Node label key that defines the domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[].mismatchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution`

Terms the pod should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight`

Weight of the term, from 1 to 100.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 100 |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm`

Term the pod should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector`

Pods the term matches.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaces`

Namespaces the term matches. Defaults to the namespace of the pod when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaces` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector`

Namespaces the term matches, by their labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.topologyKey`

Node label key that defines the domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `In` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.mismatchLabelKeys`

Pod label keys whose values are combined with `labelSelector`, with the `NotIn` operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[].podAffinityTerm.mismatchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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

## `topologySpreadConstraints[]`

A rule that spreads the valkey pods evenly across topology domains.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].maxSkew`

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

## `topologySpreadConstraints[].topologyKey`

Node label key that defines a domain.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].topologyKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].whenUnsatisfiable`

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

## `topologySpreadConstraints[].labelSelector`

Pods the constraint counts.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].operator`

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

## `topologySpreadConstraints[].labelSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].minDomains`

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

## `topologySpreadConstraints[].nodeAffinityPolicy`

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

## `topologySpreadConstraints[].nodeTaintsPolicy`

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

## `topologySpreadConstraints[].matchLabelKeys`

Pod label keys whose values are combined with `labelSelector`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `priorityClassName`

Name of the PriorityClass of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.priorityClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `node`

Distribution of the pods across the nodes.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `node.spread`

Spread of the pods across the nodes.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `node.spread.shard`

Spread of the pods of each shard. Disabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread.shard` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `node.spread.shard.mode`

`Disabled`, `Preferred` (best effort) or `Required` (hard constraint).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread.shard.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"Preferred"`, `"Required"` |

---

## `node.spread.primaries`

Spread of the pod that starts as the primary of each shard (node-index 0). Disabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread.primaries` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `node.spread.primaries.mode`

`Disabled`, `Preferred` (best effort) or `Required` (hard constraint).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread.primaries.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"Preferred"`, `"Required"` |

---

## `node.spread.pods`

Spread of all the pods of the cluster. Disabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread.pods` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `node.spread.pods.mode`

`Disabled`, `Preferred` (best effort) or `Required` (hard constraint).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.node.spread.pods.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"Preferred"`, `"Required"` |

---

## `zone`

Distribution and pinning of the pods across the zones.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `zone.spread`

Spread of the pods across the zones.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `zone.spread.shard`

Spread of the pods of each shard. Disabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread.shard` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `zone.spread.shard.mode`

`Disabled`, `Preferred` (best effort) or `Required` (hard constraint).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread.shard.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"Preferred"`, `"Required"` |

---

## `zone.spread.primaries`

Spread of the pod that starts as the primary of each shard (node-index 0). Disabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread.primaries` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `zone.spread.primaries.mode`

`Disabled`, `Preferred` (best effort) or `Required` (hard constraint).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread.primaries.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"Preferred"`, `"Required"` |

---

## `zone.spread.pods`

Spread of all the pods of the cluster. Disabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread.pods` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `zone.spread.pods.mode`

`Disabled`, `Preferred` (best effort) or `Required` (hard constraint).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.spread.pods.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"Preferred"`, `"Required"` |

---

## `zone.pinning`

Pins the pods to zones.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.pinning` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `zone.pinning.zones`

Zones the pods are pinned to. Unique, at most 32 zones.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.zone.pinning.zones` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | `^[A-Za-z0-9]([-A-Za-z0-9_.]*[A-Za-z0-9])?$` |
| Items | 1 to 32 |

---
