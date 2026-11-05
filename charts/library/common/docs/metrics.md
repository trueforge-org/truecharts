---
title: Metrics
---

:::note

- See the [Full Examples](/truecharts-common/metrics#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics`

---

## `metrics`

ServiceMonitors, PodMonitors and PrometheusRules, keyed by name. See [metrics](/truecharts-common/metrics).

| Field | Value |
| --- | --- |
| Key | `metrics` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A ServiceMonitor or PodMonitor, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this monitor. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Make this the primary metrics object. Only 1 can be primary.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.type`

Type of the monitor, `servicemonitor` or `podmonitor`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"servicemonitor"` |
| Allowed values | `"servicemonitor"`, `"podmonitor"` |

---

## `$name.selector`

Labels that select the service or pods, instead of `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.selector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.matchLabels`

Labels that select the service or pods.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.matchLabels` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints`

Endpoints that are scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[]`

An endpoint that is scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].port`

Name of the port that is scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].port` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].interval`

Interval between scrapes, eg `30s`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].interval` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].scrapeTimeout`

Timeout of a scrape, eg `10s`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].scrapeTimeout` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].path`

HTTP path that is scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].honorLabels`

Keep the labels of the scraped metrics when they conflict with the labels of the target.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].honorLabels` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].scheme`

Scheme of the scrape request, `http` or `https`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].params`

Query parameters of the scrape request, keyed by name. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].params` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.endpoints[].params.$name`

Values of the query parameter

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].params.$name` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].tlsConfig`

TLS settings of the scrape request, passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].tlsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].tlsConfig.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].tlsConfig.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].relabelings`

Relabelings applied before scraping. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].relabelings` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.endpoints[].relabelings[]`

A relabel config, passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].relabelings[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].relabelings[].$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].relabelings[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].metricRelabelings`

Relabelings applied to the scraped metrics. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].metricRelabelings` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.endpoints[].metricRelabelings[]`

A relabel config, passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].metricRelabelings[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints[].metricRelabelings[].$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].metricRelabelings[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule`

A PrometheusRule with alerting and recording rules.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `$name.prometheusRule.enabled`

Create a PrometheusRule for this metrics object. Nothing is created when there are no rules.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.prometheusRule.labels`

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

## `$name.prometheusRule.annotations`

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

## `$name.prometheusRule.rules`

Rules of a group named after the PrometheusRule. Use `groups` for more than one group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[]`

An alerting or recording rule. Set `alert` or `record`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[].alert`

Name of the alert rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[].record`

Name of the recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].record` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[].expr`

PromQL expression to evaluate.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[].for`

Duration the expression must be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[].keep_firing_for`

Duration the alert keeps firing after the expression is no longer true.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.rules[].keep_firing_for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.rules[].labels`

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

## `$name.prometheusRule.rules[].annotations`

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

## `$name.prometheusRule.groups`

Groups of rules, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.prometheusRule.groups.$name`

A group of rules, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.name`

Name of the group. Defaults to the key.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules`

Rules of the group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[]`

An alerting or recording rule. Set `alert` or `record`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[].alert`

Name of the alert rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[].record`

Name of the recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].record` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[].expr`

PromQL expression to evaluate.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[].for`

Duration the expression must be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[].keep_firing_for`

Duration the alert keeps firing after the expression is no longer true.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.rules[].keep_firing_for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.rules[].labels`

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

## `$name.prometheusRule.groups.$name.rules[].annotations`

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

## `$name.prometheusRule.groups.$name.additionalrules`

Additional rules of the group, next to `rules`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[]`

An alerting or recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[].alert`

Name of the alert rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[].record`

Name of the recording rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].record` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[].expr`

PromQL expression to evaluate.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[].for`

Duration the expression must be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[].keep_firing_for`

Duration the alert keeps firing after the expression is no longer true.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.groups.$name.additionalrules[].keep_firing_for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.groups.$name.additionalrules[].labels`

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

## `$name.prometheusRule.groups.$name.additionalrules[].annotations`

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

## `$name.prometheusRule.additionalgroups`

Additional groups of rules, as a list or as a map keyed by group name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups` |
| Type | `list of map or null or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name`

A group of rules, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.name`

Name of the group. Defaults to the key.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.rules`

Rules of the group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.rules[]`

An alerting rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.rules[].alert`

Name of the alert.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.rules[].expr`

PromQL expression.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.rules[].for`

How long the expression has to be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups.$name.additionalrules`

Additional rules of the group, next to `rules`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups.$name.additionalrules` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[]`

A group of rules.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].name`

Name of the group. Defaults to the key.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].rules`

Rules of the group.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].rules[]`

An alerting rule.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].rules[].alert`

Name of the alert.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[].alert` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].rules[].expr`

PromQL expression.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[].expr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].rules[].for`

How long the expression has to be true before the alert fires.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].rules[].for` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.prometheusRule.additionalgroups[].additionalrules`

Additional rules of the group, next to `rules`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule.additionalgroups[].additionalrules` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Service or workload the monitor selects. Defaults to the primary one.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Additional labels, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nameOverride`

Suffix of the name, instead of the name of the object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.nameOverride` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.apiKey`

API key the exporter needs.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.apiKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### ServiceMonitor

```yaml
metrics:
  main:
    enabled: true
    primary: true
    type: servicemonitor
    targetSelector: main
    selector:
      matchLabels:
        app.kubernetes.io/name: my-app
    endpoints:
      - port: main
        interval: 30s
        scrapeTimeout: 10s
        path: /metrics
        scheme: http
        honorLabels: false
```

### ServiceMonitor with relabeling and TLS

```yaml
metrics:
  secure:
    enabled: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: https
        interval: 1m
        path: /metrics
        scheme: https
        params:
          format:
            - prometheus
        tlsConfig:
          insecureSkipVerify: true
        relabelings:
          - sourceLabels:
              - __meta_kubernetes_pod_node_name
            targetLabel: node
        metricRelabelings:
          - sourceLabels:
              - __name__
            regex: go_.*
            action: drop
```

### PodMonitor

```yaml
metrics:
  pods:
    enabled: true
    type: podmonitor
    targetSelector: main
    endpoints:
      - port: metrics
        interval: 15s
        path: /metrics
```

### Prometheus rules

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
      labels:
        release: prometheus
      groups:
        availability:
          rules:
            - alert: AppDown
              expr: up{job="my-app"} == 0
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: my-app is down
                description: The target {{ "{{ $labels.instance }}" }} has been unreachable for 5 minutes.
            - record: my_app:requests:rate5m
              expr: sum(rate(http_requests_total{job="my-app"}[5m]))
