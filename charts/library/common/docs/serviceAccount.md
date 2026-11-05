---
title: Service Account
---

:::note

- See the [Full Examples](/truecharts-common/serviceAccount#full-examples) section for complete examples.

:::

## Appears in

- `.Values.serviceAccount`

---

## `serviceAccount`

ServiceAccounts, keyed by name.

| Field | Value |
| --- | --- |
| Key | `serviceAccount` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A ServiceAccount.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Names of the workloads that use this service account.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.enabled`

Create this ServiceAccount when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Mark this service account as the primary one, used by workloads that select none.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.labels`

Additional labels for service account

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.labels` |
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
| Key | `serviceAccount.$name.annotationsList` |
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
| Key | `serviceAccount.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for service account

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.targetSelectAll`

Use this service account for all workloads.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.automountServiceAccountToken`

Whether pods automatically mount the API token of this service account.

| Field | Value |
| --- | --- |
| Key | `serviceAccount.$name.automountServiceAccountToken` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

### Primary service account for all workloads

```yaml
serviceAccount:
  sa-name:
    enabled: true
    primary: true
    namespace: some-namespace
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    targetSelectAll: true
```

### Selected workloads

```yaml
serviceAccount:
  other-sa-name:
    enabled: true
    namespace: some-namespace
    targetSelector:
      - pod-name
      - other-pod-name
```

### Mount the token

The token of the service account is only mounted when the app needs to talk to the Kubernetes API:

```yaml
serviceAccount:
  api-access:
    enabled: true
    primary: true
    automountServiceAccountToken: true
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::123456789012:role/my-role
```
