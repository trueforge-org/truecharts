---
title: Image Pull Secret
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/imagePullSecret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.imagePullSecret`

---

## `imagePullSecret`

Image pull secrets, keyed by name, for pulling images from a private registry.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

An image pull secret.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.data`

Registry credentials to store in the Secret. Not used when `existingSecret` is set.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.data` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.data.email`

Email address for the registry account.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.data.email` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

Example

```yaml
imagePullSecret:
  example:
    data:
      email: user@example.com
```

---

## `$name.data.registry`

Registry host the credentials are for.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.data.registry` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

Example

```yaml
imagePullSecret:
  example:
    data:
      registry: ghcr.io
```

---

## `$name.data.username`

Username for the registry.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.data.username` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `$name.data.password`

Password or token for the registry.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.data.password` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `$name.enabled`

Create this image pull secret when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.existingSecret`

Name of an existing Secret to use instead of creating one. When set, only `enabled`, `targetSelectAll` and `targetSelector` are used.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.existingSecret` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `$name.labels`

Additional labels for image pull secret

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.labels` |
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
| Key | `imagePullSecret.$name.annotationsList` |
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
| Key | `imagePullSecret.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for image pull secret

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.targetSelectAll`

Add the pull secret to all pods.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Names of the workloads to add the pull secret to.

| Field | Value |
| --- | --- |
| Key | `imagePullSecret.$name.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## Full Examples

### Credentials in the values

Create a pull secret and attach it to all pods:

```yaml
imagePullSecret:
  pull-secret-name:
    enabled: true
    namespace: some-namespace
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      registry: quay.io
      username: my_user
      password: my_pass
      email: my_mail@example.com
    targetSelectAll: true
```

### Only some workloads, with Helm tpl

`targetSelector` attaches the secret to the listed workloads only, and the credentials can be read from other values:

```yaml
imagePullSecret:
  other-pull-secret-name:
    enabled: true
    data:
      registry: "{{ .Values.my_registry }}"
      username: "{{ .Values.my_user }}"
      password: "{{ .Values.my_pass }}"
      email: "{{ .Values.my_mail }}"
    targetSelector:
      - workload-name1
      - workload-name2
```

### Existing secret

With `existingSecret`, no secret is created. Only `enabled`, `targetSelectAll` and `targetSelector` are used:

```yaml
imagePullSecret:
  existing-pull-secret:
    enabled: true
    existingSecret: my-registry-secret
    targetSelectAll: true
```
