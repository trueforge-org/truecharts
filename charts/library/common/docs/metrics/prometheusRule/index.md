---
title: prometheusRule
---

:::note

- See the [Full Examples](/truecharts-common/metrics/prometheusRule#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics.$name.prometheusRule`

---

## Child Pages

- [groups](/truecharts-common/metrics/prometheusRule/groups)

---

## `prometheusRule`

A PrometheusRule with alerting and recording rules.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `enabled`

Create a PrometheusRule for this metrics object. Nothing is created when there are no rules.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `labels`

Labels of the PrometheusRule. They take precedence over the `labels` of the metrics object.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `annotations`

Annotations of the PrometheusRule. They take precedence over the `annotations` of the metrics object.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules`

Rules of a group named after the PrometheusRule. Use `groups` for more than one group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[]`

An alerting or recording rule. Set `alert` or `record`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].alert`

Name of the alert rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].record`

Name of the recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].record` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].expr`

PromQL expression to evaluate.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].for`

Duration the expression must be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].keep_firing_for`

Duration the alert keeps firing after the expression is no longer true.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].keep_firing_for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].labels`

Labels added to the alert or recording rule.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rules[].annotations`

Annotations added to the alert or recording rule.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `groups`

Groups of rules, keyed by name.

See [groups](/truecharts-common/metrics/prometheusRule/groups) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `additionalgroups`

Additional groups of rules, as a list or as a map keyed by group name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups` |
| Type | `list of map or null or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name`

A group of rules, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.name`

Name of the group. Defaults to the key.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.rules`

Rules of the group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.rules[]`

An alerting rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.rules[].alert`

Name of the alert.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.rules[].expr`

PromQL expression.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.rules[].for`

How long the expression has to be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups.$name.additionalrules`

Additional rules of the group, next to `rules`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.additionalrules` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[]`

A group of rules.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].name`

Name of the group. Defaults to the key.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].rules`

Rules of the group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].rules[]`

An alerting rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].rules[].alert`

Name of the alert.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].rules[].expr`

PromQL expression.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].rules[].for`

How long the expression has to be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `additionalgroups[].additionalrules`

Additional rules of the group, next to `rules`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].additionalrules` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
metrics:
  example:
    prometheusRule:
      enabled: false
```
