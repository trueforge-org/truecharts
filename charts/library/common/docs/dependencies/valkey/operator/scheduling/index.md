---
title: Valkey Operator Scheduling
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling`

---

## Child Pages

- [affinity](/truecharts-common/dependencies/valkey/operator/scheduling/affinity)
- [topologySpreadConstraints](/truecharts-common/dependencies/valkey/operator/scheduling/topologySpreadConstraints)

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

See [affinity](/truecharts-common/dependencies/valkey/operator/scheduling/affinity) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.affinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints`

Topology spread constraints of the pods, for topology keys other than the hostname and the zone (use `node.spread` and `zone.spread` for those).

See [topologySpreadConstraints](/truecharts-common/dependencies/valkey/operator/scheduling/topologySpreadConstraints) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling.topologySpreadConstraints` |
| Type | `list of map` |
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

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  valkey:
    operator:
      scheduling:
        nodeSelector:
          kubernetes.io/arch: amd64
        tolerations:
          - key: dedicated
            operator: Equal
            value: cache
            effect: NoSchedule
        priorityClassName: system-cluster-critical
```
