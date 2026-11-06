---
title: webhooks
---

:::note

- See the [Full Examples](/truecharts-common/webhook/webhooks#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook.$name.webhooks`

---

## Child Pages

- [clientConfig](/truecharts-common/webhook/webhooks/clientConfig)

---

## `webhooks`

Webhooks of the configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rules`

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

## `[].rules[]`

A rule of the webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rules[].resources`

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

## `[].rules[].scope`

Scope of the rule: `Cluster`, `Namespaced` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].rules[].scope` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].rules[].apiGroups`

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

## `[].rules[].apiVersions`

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

## `[].rules[].operations`

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

## `[].name`

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

## `[].failurePolicy`

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

## `[].matchPolicy`

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

## `[].sideEffects`

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

## `[].reinvocationPolicy`

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

## `[].timeoutSeconds`

Timeout of a call to the webhook, in seconds.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].admissionReviewVersions`

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

## `[].clientConfig`

How the API server reaches the webhook, by `url` or `service`.

See [clientConfig](/truecharts-common/webhook/webhooks/clientConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].namespaceSelector`

Namespaces the webhook applies to, by labels.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `[].objectSelector`

Objects the webhook applies to, by labels.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].objectSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
webhook:
  mutating:
    webhooks:
      - name: defaults.example.com
        failurePolicy: Fail
        sideEffects: None
        reinvocationPolicy: IfNeeded
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/mutate
        rules:
          - apiGroups:
              - apps
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - deployments
```

```yaml
webhook:
  mutating:
    webhooks:
      - name: sidecar-injector.example.com
        failurePolicy: Ignore
        sideEffects: None
        timeoutSeconds: 10
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: sidecar-injector
            namespace: injector-system
            path: /mutate
            port: 443
        rules:
          - apiGroups:
              - ''
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - pods
```

```yaml
webhook:
  validating:
    webhooks:
      - name: policy.example.com
        failurePolicy: Fail
        sideEffects: None
        timeoutSeconds: 10
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: policy-webhook
            namespace: policy-system
            path: /validate
            port: 443
        rules:
          - apiGroups:
              - ''
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - pods
```
