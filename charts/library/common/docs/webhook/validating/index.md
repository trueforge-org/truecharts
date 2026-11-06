---
title: validating
---

:::note

- See the [Full Examples](/truecharts-common/webhook/validating#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook.validating`

---

## Child Pages

- [webhooks](/truecharts-common/webhook/validating/webhooks)

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

## `enabled`

Enable the webhook configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `type`

Type of the webhook configuration, `validating` or `mutating`.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `webhooks`

Webhooks of the configuration.

See [webhooks](/truecharts-common/webhook/validating/webhooks) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.validating.webhooks` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Validating webhook served by a service

```yaml
webhook:
  validating:
    enabled: true
    type: validating
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
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - pods
```

### Validating webhook limited by selectors

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: ingress.example.com
        failurePolicy: Ignore
        matchPolicy: Equivalent
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/validate
        namespaceSelector:
          matchLabels:
            policy: enforced
        objectSelector:
          matchExpressions:
            - key: skip-validation
              operator: DoesNotExist
        rules:
          - apiGroups:
              - networking.k8s.io
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - ingresses
```
