---
title: affinity
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/affinity#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity`

---

## Child Pages

- [podAffinity](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinity)

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

## `nodeAffinity`

Node affinity of the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution`

Terms the node must match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms`

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

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[]`

A node selector term: requirements on the labels or fields of a node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions`

Requirements on the labels of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].key`

Label key the requirement applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].operator`

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

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].values`

Values of the label, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields`

Requirements on the fields of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].key`

Field the requirement applies to, for example `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].operator`

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

## `nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].values`

Values of the field, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[].matchFields[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution`

Terms the node should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].weight`

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

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference`

Term the node should match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions`

Requirements on the labels of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].key`

Label key the requirement applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].operator`

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

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].values`

Values of the label, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields`

Requirements on the fields of the node.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].key`

Field the requirement applies to, for example `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].operator`

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

## `nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].values`

Values of the field, with `In`, `NotIn`, `Gt` and `Lt`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[].preference.matchFields[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podAffinity`

Pod affinity of the pods.

See [podAffinity](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinity) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podAntiAffinity`

Pod anti-affinity of the pods.

See [podAffinity](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinity) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity.podAntiAffinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Node affinity

Run the Valkey pods only on amd64 nodes, and prefer nodes in the `storage` pool:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
                - matchExpressions:
                    - key: kubernetes.io/arch
                      operator: In
                      values:
                        - amd64
            preferredDuringSchedulingIgnoredDuringExecution:
              - weight: 50
                preference:
                  matchExpressions:
                    - key: node-pool
                      operator: In
                      values:
                        - storage
```

### Pod affinity and anti-affinity

Place the Valkey pods close to the app, but never two of them on the same node:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        affinity:
          podAffinity:
            preferredDuringSchedulingIgnoredDuringExecution:
              - weight: 100
                podAffinityTerm:
                  topologyKey: kubernetes.io/hostname
                  labelSelector:
                    matchLabels:
                      app.kubernetes.io/name: myapp
          podAntiAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              - topologyKey: kubernetes.io/hostname
                labelSelector:
                  matchExpressions:
                    - key: app.kubernetes.io/name
                      operator: In
                      values:
                        - valkey
```
