---
title: VPA
---

:::note

- See the [Full Examples](/truecharts-common/vpa#full-examples) section for complete examples.

:::

## Appears in

- `.Values.vpa`

---

## `vpa`

VerticalPodAutoscalers, keyed by name. Each one scales the resources of a workload.

| Field | Value |
| --- | --- |
| Key | `vpa` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A VerticalPodAutoscaler, keyed by name.

| Field | Value |
| --- | --- |
| Key | `vpa.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this VerticalPodAutoscaler. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.labels`

Additional labels of the VerticalPodAutoscaler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations of the VerticalPodAutoscaler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Workloads the VerticalPodAutoscaler applies to. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.updatePolicy`

How the recommendations are applied.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.updatePolicy.updateMode`

How recommendations are applied: `Off`, `Initial`, `Recreate` or `Auto`.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy.updateMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Auto"`, `"Off"`, `"Initial"`, `"Recreate"` |

---

## `$name.updatePolicy.minReplicas`

Minimum number of replicas that have to be running before pods are evicted.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy.minReplicas` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `$name.updatePolicy.evictionRequirements`

Conditions for evicting a pod to apply a recommendation.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy.evictionRequirements` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.updatePolicy.evictionRequirements[]`

A condition for evicting a pod.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy.evictionRequirements[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.updatePolicy.evictionRequirements[].resources`

Resources the requirement applies to.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy.evictionRequirements[].resources` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"cpu"`, `"memory"` |

---

## `$name.updatePolicy.evictionRequirements[].changeRequirement`

Which change allows an eviction: `TargetHigherThanRequests` or `TargetLowerThanRequests`.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.updatePolicy.evictionRequirements[].changeRequirement` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"TargetHigherThanRequests"`, `"TargetLowerThanRequests"` |

---

## `$name.resourcePolicy`

Limits of the recommendations, per container.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.resourcePolicy.containerPolicies`

Policies per container.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[]`

The policy for one container.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].containerName`

Name of the container, `*` for all.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].mode`

Recommendations for the container, `Auto` or `Off`.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Auto"`, `"Off"` |

---

## `$name.resourcePolicy.containerPolicies[].controlledValues`

Which values are set: `RequestsAndLimits` or `RequestsOnly`.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].controlledValues` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"RequestsAndLimits"`, `"RequestsOnly"` |

---

## `$name.resourcePolicy.containerPolicies[].minAllowed`

Minimum recommendation.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].minAllowed` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].minAllowed.cpu`

CPU, as a quantity.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].minAllowed.cpu` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].minAllowed.memory`

Memory, as a quantity.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].minAllowed.memory` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].maxAllowed`

Maximum recommendation.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].maxAllowed` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].maxAllowed.cpu`

CPU, as a quantity.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].maxAllowed.cpu` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].maxAllowed.memory`

Memory, as a quantity.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].maxAllowed.memory` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.resourcePolicy.containerPolicies[].controlledResources`

Resources that are recommended, `cpu` and `memory`.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.resourcePolicy.containerPolicies[].controlledResources` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.namespace`

Namespace of the VerticalPodAutoscaler. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `vpa.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## Full Examples

### Automatic updates

```yaml
vpa:
  main:
    enabled: true
    targetSelector:
      - main
    updatePolicy:
      updateMode: Auto
    resourcePolicy:
      containerPolicies:
        - containerName: "*"
          minAllowed:
            cpu: 50m
            memory: 50Mi
          maxAllowed:
            cpu: 8000m
            memory: 20Gi
          controlledResources:
            - cpu
            - memory
```

### Recommendations only

```yaml
vpa:
  main:
    enabled: true
    labels:
      key: value
    annotations:
      key: value
    targetSelector:
      - main
    updatePolicy:
      updateMode: "Off"
```

### Per container policy with eviction requirements

```yaml
vpa:
  main:
    enabled: true
    targetSelector:
      - main
    updatePolicy:
      updateMode: Recreate
      minReplicas: 2
      evictionRequirements:
        - resources:
            - cpu
            - memory
          changeRequirement: TargetHigherThanRequests
    resourcePolicy:
      containerPolicies:
        - containerName: main
          mode: Auto
          controlledValues: RequestsOnly
          minAllowed:
            cpu: 100m
            memory: 128Mi
          maxAllowed:
            cpu: 2
            memory: 4Gi
          controlledResources:
            - cpu
            - memory
        - containerName: sidecar
          mode: "Off"
```
