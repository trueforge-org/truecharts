---
title: Certificate
---

:::note

- See the [Full Examples](/truecharts-common/certificate#full-examples) section for complete examples.

:::

## Appears in

- `.Values.certificate`

---

## `certificate`

cert-manager Certificates, keyed by name.

| Field | Value |
| --- | --- |
| Key | `certificate` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A Certificate.

| Field | Value |
| --- | --- |
| Key | `certificate.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.certificateSecretTemplate`

Labels and annotations to put on the Secret that cert-manager creates. Set at least one of them.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.certificateSecretTemplate` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.certificateSecretTemplate.annotations`

Annotations of the created Secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.certificateSecretTemplate.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.certificateSecretTemplate.labels`

Labels of the created Secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.certificateSecretTemplate.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.enabled`

Create this certificate when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `$name.labels`

Labels of the Certificate.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.labels` |
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
| Key | `certificate.$name.annotationsList` |
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
| Key | `certificate.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Annotations of the Certificate.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.certificateIssuer`

Name of the cert-manager (Cluster)Issuer that signs the certificate.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.certificateIssuer` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `$name.hosts`

Hosts (DNS names) the certificate is valid for.

| Field | Value |
| --- | --- |
| Key | `certificate.$name.hosts` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | `"false"` |

---

## Full Examples

### Basic certificate

A cert-manager `Certificate` for one or more hosts, signed by an issuer. Both can be read from other values with Helm `tpl`:

```yaml
certificate:
  my-certificate1:
    enabled: true
    hosts:
      - "{{ .Values.host }}"
    certificateIssuer: "{{ .Values.issuer }}"
```

### Multiple hosts and a secret template

`certificateSecretTemplate` sets the labels and annotations of the Secret that cert-manager creates:

```yaml
certificate:
  my-certificate2:
    enabled: true
    hosts:
      - host1.example.com
      - host2.example.com
    certificateIssuer: some-other-issuer
    certificateSecretTemplate:
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
```

### Namespace, labels and annotations

```yaml
certificate:
  my-certificate3:
    enabled: true
    namespace: some-namespace
    hosts:
      - app.example.com
    certificateIssuer: letsencrypt-prod
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
    labelsList:
      - name: other-key
        value: other-value
    annotationsList:
      - name: other-annotation
        value: other-value
```
