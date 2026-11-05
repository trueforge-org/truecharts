---
title: Webhook
---

:::note

- See the [Full Examples](/truecharts-common/webhook#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook`

---

## `webhook`

Webhook configurations (validating and mutating), keyed by name.

| Field | Value |
| --- | --- |
| Key | `webhook` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating`

A ValidatingWebhookConfiguration.

| Field | Value |
| --- | --- |
| Key | `webhook.validating` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.enabled`

Enable the webhook configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `validating.type`

Type of the webhook configuration, `validating` or `mutating`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks`

Webhooks of the configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[]`

A webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].name`

Name of the webhook, a fully qualified name like `check.example.com`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `validating.webhooks[].rules`

Operations and resources the webhook applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `validating.webhooks[].rules[]`

A rule of the webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].rules[].apiGroups`

API groups of the resources, `""` for the core group.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[].apiGroups` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `validating.webhooks[].rules[].apiVersions`

API versions of the resources.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[].apiVersions` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `validating.webhooks[].rules[].operations`

Operations, eg `CREATE`, `UPDATE`, `DELETE` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[].operations` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `validating.webhooks[].rules[].resources`

Resources, eg `pods` or `deployments/scale`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[].resources` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `validating.webhooks[].rules[].scope`

Scope of the rule: `Cluster`, `Namespaced` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[].scope` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].failurePolicy`

What happens when the webhook fails: `Ignore` or `Fail`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].failurePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Ignore"`, `"Fail"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `validating.webhooks[].matchPolicy`

How requests are matched to `rules`: `Exact` or `Equivalent`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].matchPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Exact"`, `"Equivalent"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `validating.webhooks[].sideEffects`

Side effects of the webhook: `None` or `NoneOnDryRun`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].sideEffects` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"None"`, `"NoneOnDryRun"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `validating.webhooks[].timeoutSeconds`

Timeout of a call to the webhook, in seconds.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].admissionReviewVersions`

AdmissionReview versions the webhook accepts, eg `v1`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].admissionReviewVersions` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `validating.webhooks[].clientConfig`

How the API server reaches the webhook, by `url` or `service`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].clientConfig` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].clientConfig.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].clientConfig.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector`

Namespaces the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].namespaceSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector`

Objects the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `validating.webhooks[].objectSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].objectSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating`

A MutatingWebhookConfiguration.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.enabled`

Enable the webhook configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mutating.type`

Type of the webhook configuration, `validating` or `mutating`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks`

Webhooks of the configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[]`

A webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].name`

Name of the webhook, a fully qualified name like `check.example.com`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `mutating.webhooks[].rules`

Operations and resources the webhook applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `mutating.webhooks[].rules[]`

A rule of the webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].rules[].apiGroups`

API groups of the resources, `""` for the core group.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[].apiGroups` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `mutating.webhooks[].rules[].apiVersions`

API versions of the resources.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[].apiVersions` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `mutating.webhooks[].rules[].operations`

Operations, eg `CREATE`, `UPDATE`, `DELETE` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[].operations` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `mutating.webhooks[].rules[].resources`

Resources, eg `pods` or `deployments/scale`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[].resources` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `mutating.webhooks[].rules[].scope`

Scope of the rule: `Cluster`, `Namespaced` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[].scope` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].failurePolicy`

What happens when the webhook fails: `Ignore` or `Fail`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].failurePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Ignore"`, `"Fail"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `mutating.webhooks[].matchPolicy`

How requests are matched to `rules`: `Exact` or `Equivalent`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].matchPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Exact"`, `"Equivalent"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `mutating.webhooks[].sideEffects`

Side effects of the webhook: `None` or `NoneOnDryRun`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].sideEffects` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"None"`, `"NoneOnDryRun"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `mutating.webhooks[].reinvocationPolicy`

Call the webhook again after other mutations: `Never` or `IfNeeded`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].reinvocationPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Never"`, `"IfNeeded"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `mutating.webhooks[].timeoutSeconds`

Timeout of a call to the webhook, in seconds.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].admissionReviewVersions`

AdmissionReview versions the webhook accepts, eg `v1`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].admissionReviewVersions` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `mutating.webhooks[].clientConfig`

How the API server reaches the webhook, by `url` or `service`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].clientConfig` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].clientConfig.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].clientConfig.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector`

Namespaces the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].namespaceSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector`

Objects the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating.webhooks[].objectSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A webhook configuration, keyed by name.

| Field | Value |
| --- | --- |
| Key | `webhook.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.webhooks`

Webhooks of the configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.webhooks[]`

A webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].rules`

Operations and resources the webhook applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `$name.webhooks[].rules[]`

A rule of the webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].rules[].resources`

Resources, eg `pods` or `deployments/scale`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[].resources` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | 1 to … |

---

## `$name.webhooks[].rules[].scope`

Scope of the rule: `Cluster`, `Namespaced` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[].scope` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].rules[].apiGroups`

API groups of the resources, `""` for the core group.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[].apiGroups` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | 1 to … |

---

## `$name.webhooks[].rules[].apiVersions`

API versions of the resources.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[].apiVersions` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | 1 to … |

---

## `$name.webhooks[].rules[].operations`

Operations, eg `CREATE`, `UPDATE`, `DELETE` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[].operations` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | 1 to … |

---

## `$name.webhooks[].name`

Name of the webhook, a fully qualified name like `check.example.com`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `$name.webhooks[].failurePolicy`

What happens when the webhook fails: `Ignore` or `Fail`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].failurePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Ignore"`, `"Fail"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.webhooks[].matchPolicy`

How requests are matched to `rules`: `Exact` or `Equivalent`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].matchPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Exact"`, `"Equivalent"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.webhooks[].sideEffects`

Side effects of the webhook: `None` or `NoneOnDryRun`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].sideEffects` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"None"`, `"NoneOnDryRun"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.webhooks[].reinvocationPolicy`

Call the webhook again after other mutations: `Never` or `IfNeeded`. Only for mutating webhooks.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].reinvocationPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Never"`, `"IfNeeded"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.webhooks[].timeoutSeconds`

Timeout of a call to the webhook, in seconds.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].admissionReviewVersions`

AdmissionReview versions the webhook accepts, eg `v1`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].admissionReviewVersions` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Items | 1 to … |

---

## `$name.webhooks[].clientConfig`

How the API server reaches the webhook, by `url` or `service`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].clientConfig.caBundle`

Base64 encoded CA bundle used to verify the webhook server.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.caBundle` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].clientConfig.url`

URL of the webhook. Required when `service` is not set.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].clientConfig.service`

Service of the webhook. Required when `url` is not set.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].clientConfig.service.name`

Name of the Service.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `$name.webhooks[].clientConfig.service.namespace`

Namespace of the Service.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.namespace` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].clientConfig.service.path`

Path on the Service the webhook is served on.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].clientConfig.service.port`

Port of the Service. Defaults to `443`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector`

Namespaces the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].namespaceSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector`

Objects the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.webhooks[].objectSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this webhook configuration. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace of the object. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `$name.labels`

Additional labels for webhook

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for webhook

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.type`

Type of the configuration: `validating` or `mutating`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `""` |
| Allowed values | `"mutating"`, `"validating"` |
| Pattern | `^\{\{.*\}\}$` |

---

## Full Examples

### Mutating webhook with a URL

```yaml
webhook:
  webhook-name:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    type: mutating
    webhooks:
      - name: webhook-name.example.com
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        reinvocationPolicy: Never
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: <base64 encoded ca bundle>
          url: https://webhook.example.com/mutate
        rules:
          - scope: Cluster
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - pods
              - pods/status
```

### Validating webhook with a service

```yaml
webhook:
  other-webhook-name:
    enabled: true
    namespace: some-namespace
    type: validating
    webhooks:
      - name: other-webhook-name.example.com
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: <base64 encoded ca bundle>
          service:
            name: my-webhook-service
            namespace: my-namespace
            path: /validate
            port: 443
        rules:
          - scope: Namespaced
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - pods
              - pods/status
```

### Limit the webhook with selectors

```yaml
webhook:
  selective-webhook:
    enabled: true
    type: validating
    webhooks:
      - name: selective.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: my-webhook-service
            namespace: my-namespace
            path: /validate
            port: 443
        namespaceSelector:
          matchLabels:
            admission: enabled
        objectSelector:
          matchExpressions:
            - key: skip-webhook
              operator: DoesNotExist
        rules:
          - scope: "*"
            apiGroups:
              - apps
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - deployments
              - statefulsets
```
