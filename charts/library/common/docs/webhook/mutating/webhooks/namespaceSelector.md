---
title: namespaceSelector
---

:::note

- See the [Full Examples](/truecharts-common/webhook/mutating/webhooks/namespaceSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.topologySpreadConstraints[].labelSelector`
- `.Values.webhook.$name.webhooks[].namespaceSelector`
- `.Values.webhook.$name.webhooks[].objectSelector`
- `.Values.webhook.mutating.webhooks[].namespaceSelector`
- `.Values.webhook.mutating.webhooks[].objectSelector`
- `.Values.webhook.validating.webhooks[].namespaceSelector`
- `.Values.webhook.validating.webhooks[].objectSelector`
- `.Values.workload.$name.podSpec.topologySpreadConstraints[].labelSelector`

---

## `namespaceSelector`

Namespaces the webhook applies to, by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `webhook.mutating.webhooks[].namespaceSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Only namespaces with a label

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: inject.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: inject-webhook
            namespace: inject-system
            path: /mutate
            port: 443
        namespaceSelector:
          matchLabels:
            injection: enabled
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

### Skip system namespaces with matchExpressions

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: inject.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: inject-webhook
            namespace: inject-system
            path: /mutate
            port: 443
        namespaceSelector:
          matchExpressions:
            - key: kubernetes.io/metadata.name
              operator: NotIn
              values:
                - kube-system
                - kube-public
                - inject-system
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
