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

Create a PrometheusRule for this metrics object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

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

### Alert rules

```yaml
metrics:
  main:
    enabled: true
    primary: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: main
        interval: 30s
        path: /metrics
    prometheusRule:
      enabled: true
      groups:
        availability:
          rules:
            - alert: MyAppDown
              expr: up{job="my-app"} == 0
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: my-app is down
                description: The target {{ "{{ $labels.instance }}" }} has been unreachable for 5 minutes.
            - alert: MyAppHighErrorRate
              expr: sum(rate(http_requests_total{job="my-app",code=~"5.."}[5m])) / sum(rate(http_requests_total{job="my-app"}[5m])) > 0.05
              for: 10m
              keep_firing_for: 5m
              labels:
                severity: warning
              annotations:
                summary: my-app returns many errors
```
