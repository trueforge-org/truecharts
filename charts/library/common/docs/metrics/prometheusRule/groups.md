---
title: groups
---

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
