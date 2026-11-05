---
title: external
---

## Appears in

- `.Values.hpa.$name.metrics[].external`

---

## `external`

A metric from outside of the cluster.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric`

The metric, by name and labels.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.metric` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.name`

Name of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.metric.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.selector`

Labels that select the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.metric.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.selector.matchLabels`

Labels of the metric, keyed by name.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.metric.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `metric.selector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.metric.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `target`

Target value of the metric.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `target.type`

Type of the target, `Utilization`, `AverageValue` or `Value`.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.target.type` |
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
| Key | `hpa.$name.metrics[].external.target.averageValue` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `target.value`

Target value, as a quantity.

| Field | Value |
| --- | --- |
| Key | `hpa.$name.metrics[].external.target.value` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
