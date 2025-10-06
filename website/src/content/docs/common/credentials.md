---
title: credentials
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/common/credentials#full-examples) section for complete examples.

:::

## Appears in

- `.Values.credentials`

## Naming scheme

- `$FullName-$credentialsName` (release-name-chart-name-credentials-name)

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `credentials`

Create credentials objects

|            |               |
| ---------- | ------------- |
| Key        | `credentials` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | `{}`          |

Example

```yaml
credentials: {}
```

---

### `$name`

Define credentials

|            |                     |
| ---------- | ------------------- |
| Key        | `credentials.$name` |
| Type       | `map`               |
| Required   | ✅                  |
| Helm `tpl` | ❌                  |
| Default    | `{}`                |

Example

```yaml
credentials:
  credentials-name: {}
```

---

#### `type`

Define the type of the credentials

|            |                          |
| ---------- | ------------------------ |
| Key        | `credentials.$name.type` |
| Type       | `string`                 |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Example    | `s3`                     |

```yaml
credentials:
  credentials-name:
    type: s3
```

---

#### `url`

Define the url of the credentials

|            |                          |
| ---------- | ------------------------ |
| Key        | `credentials.$name.url`  |
| Type       | `string`                 |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Example    | `https://mys3server.com` |

```yaml
credentials:
  credentials-name:
    url: "https://mys3server.com"
```

---

#### `customCASecretRef`

Reference a secret containing a custom CA to be used when connecting to the
endpoint defined by `url` over HTTPS.

:::note

Defining both this and [customCA](/common/credentials#customca) is invalid and
will result in an error.

:::

|            |                                                               |
| ---------- | ------------------------------------------------------------- |
| Key        | `credentials.$name.customCASecretRef`                         |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Example    | `{}`                                                          |

```yaml
credentials:
  credentials-name:
    customCASecretRef: {}
```

---

##### `customCASecretRef.name`

Define the secret name

:::note

This will be automatically expanded to `fullname-secret-name`.
You can opt out of this by setting [`expandObjectName`](/common/credentials#customcasecretrefexpandobjectname) to `false`

:::

|            |                                            |
| ---------- | ------------------------------------------ |
| Key        | `credentials.$name.customCASecretRef.name` |
| Type       | `string`                                   |
| Required   | ✅                                         |
| Helm `tpl` | ✅                                         |
| Example    | `""`                                       |

```yaml
credentials:
  credentials-name:
    customCASecretRef:
      name: secret-name
```

---

##### `customCASecretRef.key`

Define the key in the secret data containing the CA

|            |                                            |
| ---------- | ------------------------------------------ |
| Key        | `credentials.$name.customCASecretRef.key`  |
| Type       | `string`                                   |
| Required   | ✅                                         |
| Helm `tpl` | ❌                                         |
| Example    | `""`                                       |

```yaml
credentials:
  credentials-name:
    customCASecretRef:
      key: ca.crt
```

---

##### `customCASecretRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the secret name

|            |                                                        |
| ---------- | ------------------------------------------------------ |
| Key        | `credentials.$name.customCASecretRef.expandObjectName` |
| Type       | `bool`                                                 |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Example    | `true`                                                 |

```yaml
credentials:
  credentials-name:
    customCASecretRef:
      expandObjectName: false
```

---

#### `customCA`

Define a custom CA certificate to be used when connecting to the endpoint
defined by `url` over HTTPS.

:::note

Defining both this and [customCASecretRef](/common/credentials#customcasecretref)
is invalid and will result in an error.

:::

|            |                                                               |
| ---------- | ------------------------------------------------------------- |
| Key        | `credentials.$name.customCA`                                  |
| Type       | `string`                                                      |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Example    | `-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----` |

```yaml
credentials:
  credentials-name:
    customCA: |-
      -----BEGIN CERTIFICATE-----
      ...
      -----END CERTIFICATE-----
```

---

#### `path`

Define the optional path-override of the credentials

|            |                          |
| ---------- | ------------------------ |
| Key        | `credentials.$name.path` |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Example    | `/somecustompath`        |

```yaml
credentials:
  credentials-name:
    path: "/somecustompath"
```

---

#### `bucket`

Define the bucket of the credentials

|            |                            |
| ---------- | -------------------------- |
| Key        | `credentials.$name.bucket` |
| Type       | `string`                   |
| Required   | ✅                         |
| Helm `tpl` | ❌                         |
| Example    | `mybucket`                 |

```yaml
credentials:
  credentials-name:
    bucket: mybucket
```

---

#### `accessKey`

Define the accessKey of the credentials

|            |                               |
| ---------- | ----------------------------- |
| Key        | `credentials.$name.accessKey` |
| Type       | `string`                      |
| Required   | ✅                            |
| Helm `tpl` | ❌                            |
| Example    | `mysecretaccesskey`           |

```yaml
credentials:
  credentials-name:
    accessKey: myaccesskeyid
```

---

#### `secretKey`

Define the secretKey of the credentials

|            |                               |
| ---------- | ----------------------------- |
| Key        | `credentials.$name.secretKey` |
| Type       | `string`                      |
| Required   | ✅                            |
| Helm `tpl` | ❌                            |
| Example    | `mysecretkey`                 |

```yaml
credentials:
  credentials-name:
    secretKey: mysecretkey
```

---

#### `encrKey`

Define the encryption key of the credentials

|            |                             |
| ---------- | --------------------------- |
| Key        | `credentials.$name.encrKey` |
| Type       | `string`                    |
| Required   | ✅                          |
| Helm `tpl` | ❌                          |
| Example    | `myencryptionkey`           |

```yaml
credentials:
  credentials-name:
    encrKey: myencryptionkey
```

---

## Full Examples

```yaml
credentials:
  mys3:
    type: s3
    url: "https://mys3server.com"
    bucket: "mybucket"
    accessKey: "mysecretaccesskey"
    secretKey: "mysecretkey"
    encrKey: "myencryptionkey"
```
