---
title: clientConfig
---

:::note

- See the [Full Examples](/truecharts-common/webhook/webhooks/clientConfig#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook.$name.webhooks[].clientConfig`

---

## `clientConfig`

How the API server reaches the webhook, by `url` or `service`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `caBundle`

Base64 encoded CA bundle used to verify the webhook server.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.caBundle` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `url`

URL of the webhook. Required when `service` is not set.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `service`

Service of the webhook. Required when `url` is not set.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `service.name`

Name of the Service.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `service.namespace`

Namespace of the Service.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.namespace` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `service.path`

Path on the Service the webhook is served on.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `service.port`

Port of the Service. Defaults to `443`.

| Field | Value |
| --- | --- |
| Key | `webhook.$name.webhooks[].clientConfig.service.port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
webhook:
  webhook-name:
    webhooks:
      - clientConfig:
          caBundle: <base64 encoded ca bundle>
          url: https://webhook.example.com/mutate
```

```yaml
webhook:
  selective-webhook:
    webhooks:
      - clientConfig:
          service:
            name: my-webhook-service
            namespace: my-namespace
            path: /validate
            port: 443
```

```yaml
webhook:
  other-webhook-name:
    webhooks:
      - clientConfig:
          caBundle: <base64 encoded ca bundle>
          service:
            name: my-webhook-service
            namespace: my-namespace
            path: /validate
            port: 443
```
