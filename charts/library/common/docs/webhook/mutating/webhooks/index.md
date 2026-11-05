---
title: webhooks
---

## Appears in

- `.Values.webhook.mutating.webhooks`

---

## Child Pages

- [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector)

---

## `webhooks`

Webhooks of the configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

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

## `[].rules`

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

## `[].rules[]`

A rule of the webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rules[].apiGroups`

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

## `[].rules[].apiVersions`

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

## `[].rules[].operations`

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

## `[].rules[].resources`

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

## `[].rules[].scope`

Scope of the rule: `Cluster`, `Namespaced` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].rules[].scope` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].failurePolicy`

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

## `[].matchPolicy`

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

## `[].sideEffects`

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

## `[].reinvocationPolicy`

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

## `[].timeoutSeconds`

Timeout of a call to the webhook, in seconds.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].admissionReviewVersions`

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

## `[].clientConfig`

How the API server reaches the webhook, by `url` or `service`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].clientConfig` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].clientConfig.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].clientConfig.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector`

Namespaces the webhook applies to, by labels.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].objectSelector`

Objects the webhook applies to, by labels.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].objectSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
