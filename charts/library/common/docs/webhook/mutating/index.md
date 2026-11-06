---
title: mutating
---

:::note

- See the [Full Examples](/truecharts-common/webhook/mutating#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook.mutating`

---

## Child Pages

- [webhooks](/truecharts-common/webhook/mutating/webhooks)

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

## `enabled`

Enable the webhook configuration.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `type`

Type of the webhook configuration, `validating` or `mutating`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `webhooks`

Webhooks of the configuration.

See [webhooks](/truecharts-common/webhook/mutating/webhooks) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Mutating webhook served by a service

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
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
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - pods
```

### Mutating webhook served by an external URL

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
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
