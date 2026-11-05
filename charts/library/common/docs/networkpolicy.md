---
title: Network Policy
---

:::note

- See the [Full Examples](/truecharts-common/networkpolicy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy`

---

## `networkpolicy`

Network policies, keyed by name. See [networkpolicy](/truecharts-common/networkpolicy).

| Field | Value |
| --- | --- |
| Key | `networkpolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A network policy, keyed by name.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this NetworkPolicy.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Mark this as the primary NetworkPolicy.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.primary` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.expandObjectName`

Prefix the name of the policy with the release fullname.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.namespace`

Namespace of the policy. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.labels`

Additional labels for this NetworkPolicy.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.annotations`

Additional annotations for this NetworkPolicy.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.type`

Type of policy to create. `kubernetes` creates a NetworkPolicy, `cilium` creates a CiliumNetworkPolicy and requires the Cilium CRDs

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `"kubernetes"` |
| Allowed values | `"kubernetes"`, `"cilium"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.clusterwide`

Cilium only. Create a CiliumClusterwideNetworkPolicy instead of a CiliumNetworkPolicy, chart based selectors are pinned to the namespace of the chart

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.clusterwide` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.description`

Cilium only. Free form description of the policy, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.podSelector`

Custom Kubernetes label selector for pods to which this policy applies.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `$name.podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Target one or more workloads from this chart by name.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.targetSelector` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.targetSelectorRegex`

Target workloads from this chart whose names match one or more regular expressions

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.targetSelectorRegex` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.targetAllPods`

Target all pods in the namespace.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.targetAllPods` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.endpointSelector`

Cilium only. Select the endpoints to which this policy applies, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.endpointSelector.matchLabels`

Match endpoints by labels

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpointSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpointSelector.matchExpressions`

Match endpoints by label expressions

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpointSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpointSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpointSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpointSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.endpointSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector`

Cilium only. Host policy, select the nodes to which this policy applies instead of pods. Requires `clusterwide: true`, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.nodeSelector.matchLabels`

Match nodes by labels

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector.matchExpressions`

Match nodes by label expressions

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchExpressions` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nodeSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.nodeSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.policyTypes`

Policy types. When omitted, types are inferred from the configured rules.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.policyTypes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Ingress"`, `"Egress"` |

---

## `$name.enableDefaultDeny`

Cilium only. Control whether the policy puts the selected endpoints in default deny mode

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.enableDefaultDeny` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enableDefaultDeny.ingress`

Put the selected endpoints in ingress default deny mode

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.enableDefaultDeny.ingress` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enableDefaultDeny.egress`

Put the selected endpoints in egress default deny mode

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.enableDefaultDeny.egress` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress`

Ingress rules.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.ingress[]`

An ingress rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from`

Peers allowed to send traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[]`

A peer that may send traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector`

Select pods in the policy namespace.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].podSelector.matchExpressions[].operator`

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

## `$name.ingress[].from[].podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector`

Select namespaces by labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].namespaceSelector.matchExpressions[].operator`

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

## `$name.ingress[].from[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].ipBlock`

A CIDR, with exceptions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].ipBlock` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].ipBlock.cidr`

CIDR range to match.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].ipBlock.cidr` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].from[].ipBlock.except`

CIDR ranges excluded from the block.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].from[].ipBlock.except` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].ports`

Ports allowed by this rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].ports[]`

A port that traffic is allowed to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].ports[].protocol`

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

## `$name.ingress[].ports[].port`

Port number or named port. Omit to match all ports.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].ports[].port` |
| Type | `int or string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].ports[].endPort`

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

## `$name.ingress[].fromEntities`

Cilium only: entities (for example `world`, `cluster`, `host` or `all`) allowed to send traffic. Ignored for Kubernetes NetworkPolicies.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].fromEndpoints`

Cilium only: endpoints, by labels, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].fromCIDR`

Cilium only: CIDRs the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].fromCIDRSet`

Cilium only: CIDRs with exceptions the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].fromCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].toPorts`

Cilium only: ports, with optional L7 rules, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress[].icmps`

Cilium only: ICMP types the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingress[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny`

Cilium only. List of ingress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.ingressDeny[]`

An ingress deny rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny[].fromEndpoints`

Endpoints the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny[].fromEntities`

Entities the rule applies to, e.g. `world` or `cluster`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny[].fromCIDR`

CIDRs the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny[].fromCIDRSet`

CIDRs with exceptions the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny[].toPorts`

Ports the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressDeny[].icmps`

ICMP types the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress`

Egress rules.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.egress[]`

An egress rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to`

Peers that may receive traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[]`

A peer that may receive traffic.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector`

Select pods in the policy namespace.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].podSelector.matchExpressions[].operator`

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

## `$name.egress[].to[].podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector`

Select namespaces by labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].namespaceSelector.matchExpressions[].operator`

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

## `$name.egress[].to[].namespaceSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].ipBlock`

A CIDR, with exceptions.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].ipBlock` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].ipBlock.cidr`

CIDR range to match.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].ipBlock.cidr` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].to[].ipBlock.except`

CIDR ranges excluded from the block.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].to[].ipBlock.except` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].ports`

Ports allowed by this rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].ports[]`

A port that traffic is allowed to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].ports[].protocol`

Protocol of the port, `TCP`, `UDP` or `SCTP`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].ports[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"TCP"`, `"UDP"`, `"SCTP"` |

---

## `$name.egress[].ports[].port`

Port number or named port. Omit to match all ports.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].ports[].port` |
| Type | `int or string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].ports[].endPort`

End of an inclusive port range.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].ports[].endPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `$name.egress[].toEntities`

Cilium only: entities (for example `world`, `cluster`, `host` or `all`) allowed to receive traffic. Ignored for Kubernetes NetworkPolicies.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].toEndpoints`

Cilium only: endpoints, by labels, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].toCIDR`

Cilium only: CIDRs the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].toCIDRSet`

Cilium only: CIDRs with exceptions the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].toPorts`

Cilium only: ports, with optional L7 rules, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].icmps`

Cilium only: ICMP types the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].toFQDNs`

Cilium only: domain names the rule allows, eg `matchName` or `matchPattern`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toFQDNs` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egress[].toServices`

Cilium only: kubernetes services the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egress[].toServices` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny`

Cilium only. List of egress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.egressDeny[]`

An egress deny rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny[].toEndpoints`

Endpoints the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny[].toEntities`

Entities the rule applies to, e.g. `world` or `cluster`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny[].toCIDR`

CIDRs the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny[].toCIDRSet`

CIDRs with exceptions the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny[].toPorts`

Ports the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.egressDeny[].icmps`

ICMP types the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Basic Ingress Policy

Allow traffic from pods with label `role: frontend` to port 8080:

```yaml
networkpolicy:
  allow-frontend:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
```

### Basic Egress Policy

Allow traffic to pods with label `role: database` on port 5432:

```yaml
networkpolicy:
  allow-database:
    enabled: true
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
```

### Allow Traffic from Specific Namespace

Allow ingress from all pods in the `production` namespace:

```yaml
networkpolicy:
  allow-production-namespace:
    enabled: true
    ingress:
      - from:
          - namespaceSelector:
              matchLabels:
                environment: production
```

### Allow Traffic to External IPs

Allow egress to external IPs (except metadata service):

```yaml
networkpolicy:
  allow-external:
    enabled: true
    egress:
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
```

### Combined Ingress and Egress

Allow specific ingress and egress traffic:

```yaml
networkpolicy:
  api-policy:
    enabled: true
    policyTypes:
      - Ingress
      - Egress
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
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
                name: kube-system
        ports:
          - protocol: UDP
            port: 53
```

### Allow Traffic from Pods in Specific Namespace

Allow ingress from pods with label `app: client` in namespace with label `team: platform`:

```yaml
networkpolicy:
  allow-platform-clients:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                app: client
            namespaceSelector:
              matchLabels:
                team: platform
        ports:
          - protocol: TCP
            port: 8080
```

### Multiple Rules (OR Logic)

Allow ingress from frontend OR from monitoring:

```yaml
networkpolicy:
  allow-multiple-sources:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
      - from:
          - namespaceSelector:
              matchLabels:
                name: monitoring
        ports:
          - protocol: TCP
            port: 9090
```

### Using matchExpressions

Use advanced label matching:

```yaml
networkpolicy:
  advanced-matching:
    enabled: true
    podSelector:
      matchExpressions:
        - key: environment
          operator: In
          values:
            - production
            - staging
        - key: app
          operator: Exists
    ingress:
      - from:
          - podSelector:
              matchExpressions:
                - key: tier
                  operator: NotIn
                  values:
                    - experimental
        ports:
          - protocol: TCP
            port: 8080
```

### Default Deny All

Deny all ingress and egress traffic (useful as a baseline):

```yaml
networkpolicy:
  default-deny-all:
    enabled: true
    policyTypes:
      - Ingress
      - Egress
    # No ingress or egress rules defined = deny all
```

### Allow All from Same Namespace

Allow all traffic from pods in the same namespace:

```yaml
networkpolicy:
  allow-same-namespace:
    enabled: true
    ingress:
      - from:
          - podSelector: {}
```

### Port Range Example (Kubernetes 1.25+)

Allow traffic on a range of ports:

```yaml
networkpolicy:
  port-range:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: client
        ports:
          - protocol: TCP
            port: 8000
            endPort: 9000
```

### Complete Example

Comprehensive network policy with multiple features:

```yaml
networkpolicy:
  comprehensive-policy:
    enabled: true
    primary: true
    labels:
      team: platform
      environment: production
    annotations:
      description: "Comprehensive network policy example"
    targetSelector: main-pod
    policyTypes:
      - Ingress
      - Egress
    ingress:
      # Allow from frontend in production namespace
      - from:
          - podSelector:
              matchLabels:
                role: frontend
            namespaceSelector:
              matchLabels:
                environment: production
        ports:
          - protocol: TCP
            port: 8080
          - protocol: TCP
            port: 8443
      # Allow from monitoring namespace
      - from:
          - namespaceSelector:
              matchLabels:
                name: monitoring
        ports:
          - protocol: TCP
            port: 9090
    egress:
      # Allow to database
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
      # Allow DNS
      - to:
          - namespaceSelector:
              matchLabels:
                name: kube-system
        ports:
          - protocol: UDP
            port: 53
      # Allow external HTTPS
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
                - 10.0.0.0/8
                - 192.168.0.0/16
        ports:
          - protocol: TCP
            port: 443
```

### Cilium Network Policy

Set `type: cilium` to create a `CiliumNetworkPolicy` instead of a `NetworkPolicy`. Requires the Cilium CRDs to be installed in the cluster.
Controller targeting with `targetSelector`, `targetSelectorRegex` and `targetAllPods` works the same as for Kubernetes policies.
Rules use the Cilium rule format:

```yaml
networkpolicy:
  allow-dns:
    enabled: true
    type: cilium
    description: Allow DNS lookups from the worker
    targetSelector: worker
    enableDefaultDeny:
      egress: false
    egress:
      - toEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: kube-system
              k8s-app: kube-dns
        toPorts:
          - ports:
              - port: "53"
                protocol: UDP
            rules:
              dns:
                - matchPattern: "*"
```

### Cilium Deny Rules

`ingressDeny` and `egressDeny` take precedence over allow rules:

```yaml
networkpolicy:
  deny-metadata:
    enabled: true
    type: cilium
    targetSelectorRegex: "^worker"
    egressDeny:
      - toCIDR:
          - 169.254.169.254/32
    egress:
      - toEntities:
          - world
```

### Cilium Clusterwide Network Policy

Set `clusterwide: true` to create a `CiliumClusterwideNetworkPolicy`. Selectors that are derived from this chart are pinned to the namespace of the chart.
Use `nodeSelector` for host policies:

```yaml
networkpolicy:
  allow-ingress-from-gateway:
    enabled: true
    type: cilium
    clusterwide: true
    ingress:
      - fromEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: gateway-system
  host-policy:
    enabled: true
    type: cilium
    clusterwide: true
    nodeSelector:
      matchLabels:
        node-role.kubernetes.io/control-plane: ""
    ingress:
      - fromEntities:
          - cluster
```
