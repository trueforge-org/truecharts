---
title: MariaDB
---

:::note

- See the [Full Examples](/truecharts-common/mariadb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.mariadb`

---

## `mariadb`

MariaDB dependency configuration. See [mariadb](/truecharts-common/mariadb).

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. They come from the Helm subchart dependency that defines this object: Helm adds the default values of the subchart here. Do not set them in the values of the chart.

:::

| Field | Value |
| --- | --- |
| Key | `mariadb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the MariaDB dependency. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `mariadb.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `includeCommon`

Marker for charts that the dependency uses common. Not read by common.

| Field | Value |
| --- | --- |
| Key | `mariadb.includeCommon` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `mariadb.password` |
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
| Key | `mariadb.rootPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERROOTPASSWORD"` |
| Length | 1 to … |

---

## `mariadbUsername`

Name of the database user, used in the connection URLs.

| Field | Value |
| --- | --- |
| Key | `mariadb.mariadbUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mariadbDatabase`

Name of the database, used in the connection URLs.

| Field | Value |
| --- | --- |
| Key | `mariadb.mariadbDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds`

Connection details written by common, so apps using the dependency can use them. Read only.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `creds.mariadbPassword`

Password.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.mariadbPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.mariadbRootPassword`

Password of the `root` user.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.mariadbRootPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plain`

Hostname.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.plain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainhost`

Hostname.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.plainhost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainport`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.plainport` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainporthost`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.plainporthost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.complete`

Connection URL.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.complete` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.urlnossl`

Connection URL with `sslmode=disable`.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.urlnossl` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.jdbc`

JDBC URL.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.jdbc` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.jdbcmysql`

JDBC URL for MySQL.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.jdbcmysql` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.jdbcmariadb`

JDBC URL for MariaDB.

| Field | Value |
| --- | --- |
| Key | `mariadb.creds.jdbcmariadb` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### MariaDB with an application database

Creates the user and the database in the connection URLs. Both passwords are placeholders:

```yaml
mariadb:
  enabled: true
  password: example-placeholder-password
  rootPassword: example-placeholder-root-password
  mariadbUsername: app
  mariadbDatabase: app
```
