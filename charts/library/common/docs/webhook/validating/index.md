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

A small example, built from the schema. It shows the keys that the page needs.

```yaml
webhook:
  validating:
    enabled: true
    type: example
```
