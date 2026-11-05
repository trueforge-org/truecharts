---
title: Certificate
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/certificate#full-examples) section for complete examples.

:::

## Appears in

- `.Values.certificate`

---

## `certificate`

Define certificates

| Field      | Value         |
| ---------- | ------------- |
| Key        | `certificate` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | unset         |

---

### `certificate.$name.annotations`

Define the annotations for this certificate

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `certificate.$name.annotations` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ✅ (On value only)               |
| Default    | `{}`                            |

Example

```yaml
certificate:
  $name:
    annotations:
      {}
```

---

### `certificate.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `certificate.$name.annotationsList` |
| Type       | `list of map`                       |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `certificate.$name.certificateIssuer`

Define the certificate issuer for this certificate

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `certificate.$name.certificateIssuer` |
| Type       | `string`                              |
| Required   | ✅                                    |
| Helm `tpl` | ✅                                    |
| Default    | `""`                                  |
| Min Length | `1`                                   |

Example

```yaml
certificate:
  $name:
    certificateIssuer: ""
```

---

### `certificate.$name.certificateSecretTemplate`

Define the certificate secret template for this certificate At least one of the following keys must be defined

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `certificate.$name.certificateSecretTemplate` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | `{}`                                          |

Example

```yaml
certificate:
  $name:
    certificateSecretTemplate:
      {}
```

---

### `certificate.$name.enabled`

Enables or Disables the certificate

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `certificate.$name.enabled` |
| Type       | `boolean, string`           |
| Required   | ✅                          |
| Helm `tpl` | ✅                          |
| Default    | `false`                     |

Example

```yaml
certificate:
  $name:
    enabled: false
```

---

### `certificate.$name.hosts`

Define the hosts for this certificate

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `certificate.$name.hosts` |
| Type       | `list of string`          |
| Required   | ✅                        |
| Helm `tpl` | ✅ (On each entry)         |
| Default    | `"false"`                 |

Example

```yaml
certificate:
  $name:
    hosts: false
```

---

### `certificate.$name.labels`

Define the labels for this certificate

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `certificate.$name.labels` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ✅ (On value only)          |
| Default    | `{}`                       |

Example

```yaml
certificate:
  $name:
    labels:
      {}
```

---

### `certificate.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `certificate.$name.labelsList` |
| Type       | `list of map`                  |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `certificate.$name.namespace`

Define the namespace for this object

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `certificate.$name.namespace` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ✅ (On value only)             |
| Default    | `""`                          |

Example

```yaml
certificate:
  $name:
    namespace: ""
```

---

## Full Examples

```yaml
certificate:
  my-certificate1:
    enabled: true
    hosts:
      - "{{ .Values.host }}"
    certificateIssuer: "{{ .Values.issuer }}"
  my-certificate2:
    enabled: true
    hosts:
      - host2
    certificateIssuer: some-other-issuer
    certificateSecretTemplate:
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
```
