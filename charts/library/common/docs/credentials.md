---
title: Credentials
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/credentials#full-examples) section for complete examples.

:::

## Appears in

- `.Values.credentials`

---

## `credentials`

Credentials for S3 compatible backup targets, keyed by name.

| Field | Value |
| --- | --- |
| Key | `credentials` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A set of credentials.

| Field | Value |
| --- | --- |
| Key | `credentials.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.encrKey`

Key that encrypts the backups.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.encrKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.type`

Type of the credentials. Only `s3` is supported.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"s3"` |
| Length | 1 to … |

Example

```yaml
credentials:
  example:
    type: s3
```

---

## `$name.url`

URL of the endpoint of the storage. Use `http://` or `https://` and include the port when it is not the default one.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.url` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

Example

```yaml
credentials:
  example:
    url: https://s3.example.com
```

---

## `$name.region`

Region to use when connecting to the endpoint. Usually not needed, as the region is normally detected.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.region` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
credentials:
  example:
    region: us-east-1
```

---

## `$name.customCASecretRef`

Reference to a Secret that holds a custom CA, used when connecting to the endpoint in `url` over HTTPS.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.customCASecretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.customCASecretRef.name`

Name of the Secret. Expanded to `fullname-name` unless `expandObjectName` is false.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.customCASecretRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `$name.customCASecretRef.key`

Key in the Secret that holds the CA certificate.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.customCASecretRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.customCASecretRef.expandObjectName`

Prefix the Secret name with the chart fullname.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.customCASecretRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `$name.customCA`

Custom CA certificate (PEM) to use when connecting to the endpoint in `url` over HTTPS.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.customCA` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.path`

Path within the bucket to use, overriding the default path.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
credentials:
  example:
    path: /backups
```

---

## `$name.bucket`

Name of the bucket.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.bucket` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.accessKey`

Access key of the credentials.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.accessKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.secretKey`

Secret key of the credentials.

| Field | Value |
| --- | --- |
| Key | `credentials.$name.secretKey` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## Full Examples

Credentials are referenced by name from the objects that back up to, or restore from, S3 compatible storage. `s3` is the only `type`, and each of the examples below is a variant of it.

### Basic S3 credentials

```yaml
credentials:
  mys3:
    type: s3
    url: https://s3.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
```

### Region and path

The region is normally detected, so only set it when the endpoint needs it. `path` is the path within the bucket to use:

```yaml
credentials:
  mys3-region:
    type: s3
    url: https://s3.us-east-1.amazonaws.com
    region: us-east-1
    bucket: mybucket
    path: /backups
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
```

### Endpoint with a port or an IP

Use `http://` or `https://` and include the port when it is not the default one:

```yaml
credentials:
  minio:
    type: s3
    url: http://10.0.0.20:9000
    bucket: backups
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
```

### Custom CA

An endpoint with a certificate from a private CA. Put the PEM certificate in `customCA`:

```yaml
credentials:
  private-s3:
    type: s3
    url: https://s3.internal.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
    customCA: |
      -----BEGIN CERTIFICATE-----
      MIIB...placeholder...
      -----END CERTIFICATE-----
```

Or reference a Secret that holds the CA with `customCASecretRef`. The name is prefixed with the fullname of the chart, unless `expandObjectName` is `false`:

```yaml
secret:
  s3-ca:
    enabled: true
    data:
      ca.crt: "{{ .Values.s3CA }}"

credentials:
  private-s3-secret:
    type: s3
    url: https://s3.internal.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
    customCASecretRef:
      name: s3-ca
      key: ca.crt
      expandObjectName: true
```

### Use them for backups

A CNPG cluster refers to the credentials by name, see [CNPG](/truecharts-common/cnpg):

```yaml
credentials:
  mys3:
    type: s3
    url: https://s3.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey

dependencies:
  postgresql:
    enabled: true
    operator:
      backups:
        enabled: true
        credentials: mys3
```
