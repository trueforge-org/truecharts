---
title: groups
---

:::note

- See the [Full Examples](/truecharts-common/metrics/prometheusRule/groups#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics.$name.prometheusRule.groups`

---

## `groups`

Groups of rules, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A group of rules, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.name`

Name of the group. Defaults to the key.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules`

Rules of the group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[]`

An alerting or recording rule. Set `alert` or `record`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].alert`

Name of the alert rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].record`

Name of the recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].record` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].expr`

PromQL expression to evaluate.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].for`

Duration the expression must be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].keep_firing_for`

Duration the alert keeps firing after the expression is no longer true.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].keep_firing_for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].labels`

Labels added to the alert or recording rule.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].annotations`

Annotations added to the alert or recording rule.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules`

Additional rules of the group, next to `rules`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[]`

An alerting or recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].alert`

Name of the alert rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].record`

Name of the recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].record` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].expr`

PromQL expression to evaluate.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].for`

Duration the expression must be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].keep_firing_for`

Duration the alert keeps firing after the expression is no longer true.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].keep_firing_for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].labels`

Labels added to the alert or recording rule.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.additionalrules[].annotations`

Annotations added to the alert or recording rule.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Alert and recording rules in two groups

```yaml
metrics:
  main:
    enabled: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: main
        interval: 30s
        path: /metrics
    prometheusRule:
      enabled: true
      groups:
        alerts:
          name: my-app.alerts
          rules:
            - alert: MyAppDown
              expr: up{job="my-app"} == 0
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: my-app is down
                description: The target {{ "{{ $labels.instance }}" }} has been unreachable for 5 minutes.
            - alert: MyAppSlowRequests
              expr: histogram_quantile(0.95, sum by (le) (rate(http_request_duration_seconds_bucket{job="my-app"}[5m]))) > 2
              for: 15m
              labels:
                severity: warning
              annotations:
                summary: 95th percentile latency is above 2 seconds
        recordings:
          name: my-app.rules
          rules:
            - record: my_app:requests:rate5m
              expr: sum(rate(http_requests_total{job="my-app"}[5m]))
              labels:
                team: platform
```
