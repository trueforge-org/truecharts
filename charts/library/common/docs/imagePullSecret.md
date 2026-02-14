---
title: Imagepullsecret
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/imagePullSecret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.imagePullSecret`

---

## `imagePullSecret`

Define image pull secrets

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `imagePullSecret` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `imagePullSecret.$name.annotations`

Additional annotations for image pull secret

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `imagePullSecret.$name.annotations` |
| Type       | `map, string`                       |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `{}`                                |

Example

```yaml
imagePullSecret:
  $name:
    annotations:
      {}
```

---

### `imagePullSecret.$name.data`

Define the data of the image pull secret

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `imagePullSecret.$name.data` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Example

```yaml
imagePullSecret:
  $name:
    data:
      {}
```

---

### `imagePullSecret.$name.enabled`

Enables or Disables the image pull secret

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `imagePullSecret.$name.enabled` |
| Type       | `boolean, string`               |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `false`                         |

Example

```yaml
imagePullSecret:
  $name:
    enabled: false
```

---

### `imagePullSecret.$name.existingSecret`

Define the existing secret name If this is defined, only the following keys are used:

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `imagePullSecret.$name.existingSecret`         |
| Type       | `string`                                       |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |
| Enum       | `enabled`, `targetSelectAll`, `targetSelector` |

---

### `imagePullSecret.$name.labels`

Additional labels for image pull secret

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `imagePullSecret.$name.labels` |
| Type       | `map, string`                  |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `{}`                           |

Example

```yaml
imagePullSecret:
  $name:
    labels:
      {}
```

---

### `imagePullSecret.$name.namespace`

Define the namespace for this object

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `imagePullSecret.$name.namespace` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `""`                              |

Example

```yaml
imagePullSecret:
  $name:
    namespace: ""
```

---

### `imagePullSecret.$name.targetSelectAll`

Whether to assign the secret to all pods or not

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `imagePullSecret.$name.targetSelectAll` |
| Type       | `boolean`                               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `imagePullSecret.$name.targetSelector`

Define the pod(s) to assign the secret

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `imagePullSecret.$name.targetSelector` |
| Type       | `list of unknown`                      |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `[]`                                   |

Example

```yaml
imagePullSecret:
  $name:
    targetSelector:
      []
```

---

## Full Examples

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

  other-pull-secret-name:
    enabled: true
    namespace: some-namespace
      data:
        registry: "{{ .Values.my_registry }}"
        username: "{{ .Values.my_user }}"
        password: "{{ .Values.my_pass }}"
        email: "{{ .Values.my_mail }}"
      targetSelector:
        - workload-name1
        - workload-name2
```
