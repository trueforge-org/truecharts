---
title: HPA
---

:::note

- See the [Full Examples](/truecharts-common/hpa#full-examples) section for complete examples.

:::

## Appears in

- `.Values.hpa`

---

## Child Pages

- [metrics](/truecharts-common/hpa/metrics)

---

## `hpa`

HorizontalPodAutoscalers, keyed by name. Each one scales the replicas of a workload.

| Field | Value |
| --- | --- |
| Key | `hpa` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A HorizontalPodAutoscaler, keyed by name.

| Field | Value |
| --- | --- |
| Key | `hpa.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this HorizontalPodAutoscaler. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.labels`

Additional labels of the HorizontalPodAutoscaler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations of the HorizontalPodAutoscaler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Workloads the HorizontalPodAutoscaler scales. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.minReplicas`

Minimum number of replicas.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.minReplicas` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.maxReplicas`

Maximum number of replicas.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.maxReplicas` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior`

Scaling behavior, for scaling up and down.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleUp`

Scaling behavior when scaling up.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleUp.selectPolicy`

Which policy wins: `Max`, `Min` or `Disabled`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.selectPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Max"`, `"Min"`, `"Disabled"` |

---

## `$name.behavior.scaleUp.stabilizationWindowSeconds`

Seconds of past recommendations considered, to avoid flapping.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.stabilizationWindowSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleUp.policies`

Policies that limit how fast the replicas change.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.policies` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleUp.policies[]`

A scaling policy.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.policies[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleUp.policies[].type`

Type of the policy, `Pods` or `Percent`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.policies[].type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Pods"`, `"Percent"` |

---

## `$name.behavior.scaleUp.policies[].value`

Number of pods or percentage the policy allows within `periodSeconds`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.policies[].value` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `$name.behavior.scaleUp.policies[].periodSeconds`

Seconds the policy looks back.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleUp.policies[].periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 1800 |

---

## `$name.behavior.scaleDown`

Scaling behavior when scaling down.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleDown.selectPolicy`

Which policy wins: `Max`, `Min` or `Disabled`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.selectPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Max"`, `"Min"`, `"Disabled"` |

---

## `$name.behavior.scaleDown.stabilizationWindowSeconds`

Seconds of past recommendations considered, to avoid flapping.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.stabilizationWindowSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleDown.policies`

Policies that limit how fast the replicas change.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.policies` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleDown.policies[]`

A scaling policy.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.policies[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.behavior.scaleDown.policies[].type`

Type of the policy, `Pods` or `Percent`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.policies[].type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Pods"`, `"Percent"` |

---

## `$name.behavior.scaleDown.policies[].value`

Number of pods or percentage the policy allows within `periodSeconds`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.policies[].value` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `$name.behavior.scaleDown.policies[].periodSeconds`

Seconds the policy looks back.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.behavior.scaleDown.policies[].periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 1800 |

---

## `$name.metrics`

Metrics the number of replicas is calculated from.

See [metrics](/truecharts-common/hpa/metrics) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.namespace`

Namespace of the HorizontalPodAutoscaler. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## Full Examples

### CPU utilization

```yaml
hpa:
  main:
    enabled: true
    targetSelector:
      - main
    minReplicas: 1
    maxReplicas: 3
    metrics:
      - type: Resource
        resource:
          name: cpu
          target:
            type: Utilization
            averageUtilization: 50
```

### Multiple metrics and scaling behavior

```yaml
hpa:
  main:
    enabled: true
    labels:
      key: value
    annotations:
      key: value
    targetSelector:
      - main
    minReplicas: 2
    maxReplicas: 10
    behavior:
      scaleUp:
        selectPolicy: Max
        stabilizationWindowSeconds: 0
        policies:
          - type: Percent
            value: 100
            periodSeconds: 60
          - type: Pods
            value: 4
            periodSeconds: 60
      scaleDown:
        selectPolicy: Min
        stabilizationWindowSeconds: 300
        policies:
          - type: Pods
            value: 1
            periodSeconds: 120
    metrics:
      - type: Resource
        resource:
          name: memory
          target:
            type: AverageValue
            averageValue: 500Mi
      - type: ContainerResource
        containerResource:
          name: cpu
          container: main
          target:
            type: Utilization
            averageUtilization: 70
```

### Custom and external metrics

```yaml
hpa:
  main:
    enabled: true
    targetSelector:
      - main
    minReplicas: 1
    maxReplicas: 5
    metrics:
      - type: Pods
        pods:
          metric:
            name: http_requests_per_second
          target:
            type: AverageValue
            averageValue: 100
      - type: Object
        object:
          metric:
            name: requests_per_second
          describedObject:
            apiVersion: networking.k8s.io/v1
            kind: Ingress
            name: main
          target:
            type: Value
            value: 2k
      - type: External
        external:
          metric:
            name: queue_messages_ready
            selector:
              matchLabels:
                queue: worker_tasks
          target:
            type: AverageValue
            averageValue: 30
```
