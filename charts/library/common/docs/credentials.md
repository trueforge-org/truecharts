---
title: Credentials
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/credentials#full-examples) section for complete examples.

:::

## Appears in

- `.Values.credentials`

---

## `credentials`

Create credentials objects

| Field      | Value         |
| ---------- | ------------- |
| Key        | `credentials` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | unset         |

---

### `credentials.$name.accessKey`

Define the accessKey of the credentials

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `credentials.$name.accessKey` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |
| Min Length | `1`                           |

---

### `credentials.$name.bucket`

Define the bucket of the credentials

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `credentials.$name.bucket` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |
| Min Length | `1`                        |

---

### `credentials.$name.customCA`

Define a custom CA certificate to be used when connecting to the endpoint defined by `url` over HTTPS.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `credentials.$name.customCA` |
| Type       | `string`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `credentials.$name.customCASecretRef`

Reference a secret containing a custom CA to be used when connecting to the endpoint defined by `url` over HTTPS.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `credentials.$name.customCASecretRef` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `credentials.$name.encrKey`

Create credentials objects

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `credentials.$name.encrKey` |
| Type       | `string`                    |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |
| Min Length | `1`                         |

---

### `credentials.$name.path`

Define the optional path-override of the credentials

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `credentials.$name.path` |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `credentials.$name.region`

Override the region to use when connecting to the endpoint Setting this manually is usually not necessary as the region should normally

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `credentials.$name.region` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `credentials.$name.secretKey`

Define the secretKey of the credentials

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `credentials.$name.secretKey` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |
| Min Length | `1`                           |

---

### `credentials.$name.type`

Define the type of the credentials

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `credentials.$name.type` |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |
| Min Length | `1`                      |

---

### `credentials.$name.url`

Define the url of the credentials In some cases, such as when using an IP instead of a hostname, it might be

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `credentials.$name.url` |
| Type       | `string`                |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |
| Min Length | `1`                     |

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
