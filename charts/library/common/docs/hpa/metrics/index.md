---
title: metrics
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/hpa/metrics#full-examples) section for complete examples.

:::

## Appears in

- `.Values.hpa.$name.metrics`

---

## Child Pages

- [external](/truecharts-common/hpa/metrics/external)
- [object](/truecharts-common/hpa/metrics/object)

---

## `metrics`

Metrics the number of replicas is calculated from.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A metric the number of replicas is calculated from. Set the block that matches `type`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].type`

Type of the metric: `Resource`, `ContainerResource`, `Pods`, `Object` or `External`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Resource"`, `"Pods"`, `"Object"`, `"External"`, `"ContainerResource"` |

---

## `[].resource`

A resource metric of the pods, like `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resource.name`

Name of the resource, `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"cpu"`, `"memory"` |

---

## `[].resource.target`

Target value of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resource.target.type`

Type of the target, `Utilization`, `AverageValue` or `Value`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource.target.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"AverageValue"`, `"Utilization"` |

---

## `[].resource.target.averageValue`

Target average value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource.target.averageValue` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
hpa:
  example:
    metrics:
      - resource:
          target:
            averageValue: 500m
```

---

## `[].resource.target.averageUtilization`

Target average utilization, in percent of the requests.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource.target.averageUtilization` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resource.target.value`

Target value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].resource.target.value` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].containerResource`

A resource metric of a single container of the pods.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].containerResource.name`

Name of the resource, `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"cpu"`, `"memory"` |

---

## `[].containerResource.container`

Name of the container.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.container` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].containerResource.target`

Target value of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].containerResource.target.type`

Type of the target, `Utilization`, `AverageValue` or `Value`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.target.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"AverageValue"`, `"Utilization"` |

---

## `[].containerResource.target.averageValue`

Target average value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.target.averageValue` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].containerResource.target.averageUtilization`

Target average utilization, in percent of the requests.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.target.averageUtilization` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].containerResource.target.value`

Target value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].containerResource.target.value` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods`

A metric of the pods, averaged over them.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.metric`

The metric, by name and labels.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.metric` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.metric.name`

Name of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.metric.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.metric.selector`

Labels that select the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.metric.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.metric.selector.matchLabels`

Labels of the metric, keyed by name.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.metric.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.metric.selector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.metric.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.target`

Target value of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].pods.target.type`

Type of the target, pods metrics only support `AverageValue`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.target.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"AverageValue"` |

---

## `[].pods.target.averageValue`

Target average value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].pods.target.averageValue` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].object`

A metric of another Kubernetes object.

See [object](/truecharts-common/hpa/metrics/object) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].external`

A metric from outside of the cluster.

See [external](/truecharts-common/hpa/metrics/external) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
hpa:
  main:
    metrics:
      - type: Resource
        resource:
          name: cpu
          target:
            type: Utilization
            averageUtilization: 50
```

```yaml
hpa:
  main:
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

```yaml
hpa:
  main:
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
