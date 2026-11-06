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
- `.Values.gateway.$name.allowedListeners.namespaces.selector`
- and 3 more places

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

A small example, built from the schema. It shows the keys that the page needs.

```yaml
webhook:
  mutating:
    webhooks:
      - namespaceSelector:
          matchLabels:
            example: example
          matchExpressions:
            - key: example
              operator: example
```
