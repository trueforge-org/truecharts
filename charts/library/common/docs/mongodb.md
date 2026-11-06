---
title: MongoDB
---

:::note

- See the [Full Examples](/truecharts-common/mongodb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.mongodb`

---

## `mongodb`

MongoDB dependency configuration. See [mongodb](/truecharts-common/mongodb).

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. They come from the Helm subchart dependency that defines this object: Helm adds the default values of the subchart here. Do not set them in the values of the chart.

:::

| Field | Value |
| --- | --- |
| Key | `mongodb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the MongoDB dependency. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `mongodb.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `includeCommon`

Marker for charts that the dependency uses common. Not read by common.

| Field | Value |
| --- | --- |
| Key | `mongodb.includeCommon` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `mongodb.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |
| Length | 1 to … |

---

## `rootPassword`

Password of the `root` user.

| Field | Value |
| --- | --- |
| Key | `mongodb.rootPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERROOTPASSWORD"` |
| Length | 1 to … |

---

## `mongodbUsername`

Name of the database user, used in the connection URLs.

| Field | Value |
| --- | --- |
| Key | `mongodb.mongodbUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mongodbDatabase`

Name of the database, used in the connection URLs and the wait container.

| Field | Value |
| --- | --- |
| Key | `mongodb.mongodbDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds`

Connection details written by common, so apps using the dependency can use them. Read only.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `creds.mongodbPassword`

Password.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.mongodbPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.mongodbRootPassword`

Password of the `root` user.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.mongodbRootPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plain`

Hostname.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.plain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainhost`

Hostname.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.plainhost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainport`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.plainport` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainporthost`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.plainporthost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.complete`

Connection URL.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.complete` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.urlssl`

Connection URL with SSL.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.urlssl` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.urltls`

Connection URL with TLS.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.urltls` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.jdbc`

JDBC URL.

| Field | Value |
| --- | --- |
| Key | `mongodb.creds.jdbc` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### MongoDB with an application database

Creates the user and the database in the connection URLs. Both passwords are placeholders:

```yaml
mongodb:
  enabled: true
  password: example-placeholder-password
  rootPassword: example-placeholder-root-password
  mongodbUsername: app
  mongodbDatabase: app
```
