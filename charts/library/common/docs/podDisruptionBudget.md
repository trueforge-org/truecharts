---
title: Pod Disruption Budget
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/podDisruptionBudget#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podDisruptionBudget`

---

## `podDisruptionBudget`

Pod Disruption Budgets, keyed by name.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A Pod Disruption Budget.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.unhealthyPodEvictionPolicy`

Whether unhealthy pods may be evicted regardless of the budget. Leave empty to use the Kubernetes default.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.unhealthyPodEvictionPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |
| Allowed values | `"IfHealthyBudget"`, `"AlwaysAllow"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.enabled`

Create this Pod Disruption Budget when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.labels`

Additional labels for Pod Disruption Budget

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.annotationsList` |
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
| Key | `podDisruptionBudget.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for Pod Disruption Budget

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.minAvailable`

Minimum number or percentage of pods that must stay available during a disruption. Do not combine with `maxUnavailable`.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.minAvailable` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

Example

```yaml
podDisruptionBudget:
  example:
    minAvailable: 50%
```

---

## `$name.maxUnavailable`

Maximum number or percentage of pods that may be unavailable during a disruption. Do not combine with `minAvailable`.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.maxUnavailable` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

Example

```yaml
podDisruptionBudget:
  example:
    maxUnavailable: '1'
```

---

## `$name.targetSelector`

Name of the workload the budget applies to. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.customLabels`

Labels used to select the pods covered by the budget, replacing the automatically selected pod labels.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podDisruptionBudget.$name.customLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### minAvailable

Keep at least one pod of the primary workload running during a voluntary disruption:

```yaml
podDisruptionBudget:
  pdb-name:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    minAvailable: 1
    unhealthyPodEvictionPolicy: IfHealthyBudget
```

### maxUnavailable and a percentage

Do not combine `minAvailable` and `maxUnavailable`. Both also accept a percentage:

```yaml
podDisruptionBudget:
  other-pdb-name:
    enabled: true
    namespace: some-namespace
    maxUnavailable: 25%
    unhealthyPodEvictionPolicy: AlwaysAllow
```

### Another workload

`targetSelector` is the name of the workload the budget applies to, and defaults to the primary workload:

```yaml
podDisruptionBudget:
  worker-pdb:
    enabled: true
    targetSelector: worker
    minAvailable: 50%

workload:
  worker:
    enabled: true
    type: Deployment
    podSpec:
      containers:
        worker:
          enabled: true
          primary: true
          imageSelector: image
```

### Custom pod labels

`customLabels` replaces the automatically selected pod labels:

```yaml
podDisruptionBudget:
  custom-pdb:
    enabled: true
    minAvailable: 1
    customLabels:
      app.kubernetes.io/name: my-app
      tier: backend
```
