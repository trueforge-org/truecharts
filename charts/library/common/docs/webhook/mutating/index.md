---
title: mutating
---

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
