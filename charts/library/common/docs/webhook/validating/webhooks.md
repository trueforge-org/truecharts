---
title: webhooks
---

:::note

- See the [Full Examples](/truecharts-common/webhook/validating/webhooks#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook.validating.webhooks`

---

## `webhooks`

Webhooks of the configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

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

## `[].rules`

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

## `[].rules[]`

A rule of the webhook.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rules[].apiGroups`

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

## `[].rules[].apiVersions`

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

## `[].rules[].operations`

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

## `[].rules[].resources`

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

## `[].rules[].scope`

Scope of the rule: `Cluster`, `Namespaced` or `*`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].rules[].scope` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].failurePolicy`

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

## `[].matchPolicy`

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

## `[].sideEffects`

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

## `[].timeoutSeconds`

Timeout of a call to the webhook, in seconds.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].admissionReviewVersions`

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

## `[].clientConfig`

How the API server reaches the webhook, by `url` or `service`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].clientConfig` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].clientConfig.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks[].clientConfig.$name` |
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
| Key | `webhook.validating.webhooks[].namespaceSelector` |
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
| Key | `webhook.validating.webhooks[].objectSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Webhook with all common options

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: deployments.example.com
        failurePolicy: Fail
        matchPolicy: Equivalent
        sideEffects: None
        timeoutSeconds: 15
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          service:
            name: policy-webhook
            namespace: policy-system
            path: /validate-deployments
            port: 8443
        rules:
          - scope: Namespaced
            apiGroups:
              - apps
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - deployments
              - statefulsets
              - daemonsets
```

### Two webhooks, one with a URL

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: secrets.example.com
        failurePolicy: Fail
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: policy-webhook
            namespace: policy-system
            path: /validate-secrets
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
              - secrets
      - name: external.example.com
        failurePolicy: Ignore
        sideEffects: None
        timeoutSeconds: 5
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/validate
        rules:
          - scope: "*"
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - DELETE
            resources:
              - namespaces
```
