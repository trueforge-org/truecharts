---
title: topologySpreadConstraints
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/podOptions/topologySpreadConstraints#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.topologySpreadConstraints`
- `.Values.workload.$name.podSpec.topologySpreadConstraints`

---

## `topologySpreadConstraints`

How the pods are spread across topology domains such as nodes or zones (`topologySpreadConstraints`). Added after the constraints of `defaultSpread`. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A topology spread constraint.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].maxSkew`

Maximum difference in the number of matching pods between any two topology domains.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].maxSkew` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    - maxSkew: 1
```

---

## `[].topologyKey`

Node label of the topology domain, eg `kubernetes.io/hostname`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].topologyKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    - topologyKey: kubernetes.io/hostname
```

---

## `[].whenUnsatisfiable`

What happens when the constraint can not be met: `DoNotSchedule` or `ScheduleAnyway`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].whenUnsatisfiable` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    - whenUnsatisfiable: ScheduleAnyway
```

---

## `[].labelSelector`

Selects the pods that are counted when the skew is calculated.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].minDomains`

Minimum number of eligible domains. Only applies with `whenUnsatisfiable: DoNotSchedule`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].minDomains` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matchLabelKeys`

Label keys of the pod. Their values are combined with `labelSelector` to select the pods that are counted.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].nodeAffinityPolicy`

Whether the node affinity of the pod is honored when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].nodeAffinityPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## `[].nodeTaintsPolicy`

Whether the node taints are honored when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].nodeTaintsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
podOptions:
  topologySpreadConstraints:
    - maxSkew: 1
      topologyKey: topology.kubernetes.io/zone
      whenUnsatisfiable: DoNotSchedule
      labelSelector:
        matchLabels:
          app.kubernetes.io/name: my-app
    - maxSkew: 2
      topologyKey: kubernetes.io/hostname
      whenUnsatisfiable: ScheduleAnyway
      minDomains: 2
      nodeAffinityPolicy: Honor
      nodeTaintsPolicy: Ignore
      labelSelector:
        matchExpressions:
          - key: app.kubernetes.io/name
            operator: In
            values:
              - my-app
```
