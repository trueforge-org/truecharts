---
title: Secret
---

:::note

- See the [Full Examples](/truecharts-common/secret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.secret`

---

## `secret`

Secrets, keyed by name.

| Field | Value |
| --- | --- |
| Key | `secret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A Secret.

| Field | Value |
| --- | --- |
| Key | `secret.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.expandObjectName`

Prefix the name of the Secret with the chart fullname.

| Field | Value |
| --- | --- |
| Key | `secret.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `$name.data`

Data of the Secret, keyed by name. Values are Helm `tpl` strings and are stored as plain text (`stringData`).

| Field | Value |
| --- | --- |
| Key | `secret.$name.data` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.data.$name`

Content of the key.

| Field | Value |
| --- | --- |
| Key | `secret.$name.data.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this Secret when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `secret.$name.enabled` |
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
| Key | `secret.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.labels`

Additional labels for secret

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `secret.$name.labels` |
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
| Key | `secret.$name.annotationsList` |
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
| Key | `secret.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for secret

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `secret.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.type`

Type of the Secret, eg `Opaque` or `kubernetes.io/tls`.

| Field | Value |
| --- | --- |
| Key | `secret.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `"Opaque"` |

---

## Full Examples

### Basic Secret

The name of the Secret is prefixed with the fullname of the chart. `type` defaults to `Opaque`:

```yaml
secret:
  secret-name:
    enabled: true
    type: CustomSecretType
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value
```

### Multi line values and a namespace

```yaml
secret:
  other-secret-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
```

### Secret types

```yaml
secret:
  tls-secret:
    enabled: true
    type: kubernetes.io/tls
    data:
      tls.crt: "{{ .Values.tlsCrt }}"
      tls.key: "{{ .Values.tlsKey }}"
  basic-auth:
    enabled: true
    type: kubernetes.io/basic-auth
    data:
      username: "{{ .Values.username }}"
      password: "{{ .Values.password }}"
```

### Use it in a container

```yaml
secret:
  app-secret:
    enabled: true
    data:
      API_TOKEN: "{{ .Values.apiToken }}"

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          envFrom:
            - secretRef:
                name: app-secret
```
