---
title: Webhook
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/webhook#full-examples) section for complete examples.

:::

## Appears in

- `.Values.webhook`

---

## `webhook`

Create webhook objects

| Field      | Value     |
| ---------- | --------- |
| Key        | `webhook` |
| Type       | `map`     |
| Required   | ❌        |
| Helm `tpl` | ❌        |
| Default    | unset     |

---

### `webhook.$name.annotations`

Additional annotations for webhook

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `webhook.$name.annotations` |
| Type       | `map, string`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `{}`                        |

Example

```yaml
webhook:
  $name:
    annotations:
      {}
```

---

### `webhook.$name.enabled`

Enables or Disables the webhook

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `webhook.$name.enabled` |
| Type       | `boolean, string`       |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `false`                 |

Example

```yaml
webhook:
  $name:
    enabled: false
```

---

### `webhook.$name.labels`

Additional labels for webhook

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `webhook.$name.labels` |
| Type       | `map, string`          |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `{}`                   |

Example

```yaml
webhook:
  $name:
    labels:
      {}
```

---

### `webhook.$name.namespace`

Define the namespace for this object

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `webhook.$name.namespace` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `""`                      |

Example

```yaml
webhook:
  $name:
    namespace: ""
```

---

### `webhook.$name.type`

Define the type of the webhook.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `webhook.$name.type`     |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `""`                     |
| Enum       | `mutating`, `validating` |

Example

```yaml
webhook:
  $name:
    type: ""
```

---

### `webhook.$name.webhooks`

Define the webhooks.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `webhook.$name.webhooks` |
| Type       | `list of unknown`        |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `[]`                     |

Example

```yaml
webhook:
  $name:
    webhooks:
      []
```

---

### `webhook.mutating`

Create webhook objects

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `webhook.mutating` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `webhook.validating`

Create webhook objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `webhook.validating` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

## Full Examples

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
      - name: webhook-name
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        reinvocationPolicy: Never
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: ""
          url: ""
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

  other-webhook-name:
    enabled: true
    namespace: some-namespace
    type: validating
    webhooks:
      - name: other-webhook-name
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: ""
          service:
            name: ""
            namespace: ""
            path: ""
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
              - pods
              - pods/status
```
