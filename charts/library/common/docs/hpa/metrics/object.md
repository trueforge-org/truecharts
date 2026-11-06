---
title: object
---

:::note

- See the [Full Examples](/truecharts-common/hpa/metrics/object#full-examples) section for complete examples.

:::

## Appears in

- `.Values.hpa.$name.metrics[].object`

---

## `object`

A metric of another Kubernetes object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric`

The metric, by name and labels.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.metric` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.name`

Name of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.metric.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.selector`

Labels that select the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.metric.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.selector.matchLabels`

Labels of the metric, keyed by name.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.metric.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.selector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.metric.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `target`

Target value of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `target.type`

Type of the target, `Utilization`, `AverageValue` or `Value`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.target.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"AverageValue"`, `"Value"` |

---

## `target.averageValue`

Target average value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.target.averageValue` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `target.value`

Target value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.target.value` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `describedObject`

The object the metric describes.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.describedObject` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `describedObject.apiVersion`

API version of the object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.describedObject.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `describedObject.kind`

Kind of the object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.describedObject.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `describedObject.name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].object.describedObject.name` |
| Type | `string` |
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
      - object:
          metric:
            name: requests_per_second
          describedObject:
            apiVersion: networking.k8s.io/v1
            kind: Ingress
            name: main
          target:
            type: Value
            value: 2k
```
