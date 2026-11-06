---
title: Webhook
---

:::note

- See the [Full Examples](/truecharts-common/webhook#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook`

---

## Child Pages

- [mutating](/truecharts-common/webhook/mutating)
- [validating](/truecharts-common/webhook/validating)
- [webhooks](/truecharts-common/webhook/webhooks)

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

See [validating](/truecharts-common/webhook/validating) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.validating` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mutating`

A MutatingWebhookConfiguration.

See [mutating](/truecharts-common/webhook/mutating) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating` |
| Type | `map` |
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

See [webhooks](/truecharts-common/webhook/webhooks) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

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
            port: "443"
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
            port: "443"
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
