---
title: ClickHouse
---

:::note

- See the [Full Examples](/truecharts-common/clickhouse#full-examples) section for complete examples.

:::

## Appears in

- `.Values.clickhouse`

---

## `clickhouse`

ClickHouse dependency configuration. See [clickhouse](/truecharts-common/clickhouse).

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. They come from the Helm subchart dependency that defines this object: Helm adds the default values of the subchart here. Do not set them in the values of the chart.

:::

| Field | Value |
| --- | --- |
| Key | `clickhouse` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the ClickHouse dependency. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `clickhouse.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `includeCommon`

Marker for charts that the dependency uses common. Not read by common.

| Field | Value |
| --- | --- |
| Key | `clickhouse.includeCommon` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `clickhouse.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |
| Length | 1 to … |

---

## `clickhouseUsername`

Name of the database user, used in the connection URLs.

| Field | Value |
| --- | --- |
| Key | `clickhouse.clickhouseUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `clickhouseDatabase`

Name of the database, used in the connection URLs.

| Field | Value |
| --- | --- |
| Key | `clickhouse.clickhouseDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds`

Connection details written by common, so apps using the dependency can use them. Read only.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `creds.clickhousePassword`

Password.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.clickhousePassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plain`

Hostname.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.plain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainhost`

Hostname.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.plainhost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainport`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.plainport` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainporthost`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.plainporthost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.ping`

URL of the ping endpoint, used by the wait container.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.ping` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.complete`

Connection URL.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.complete` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.jdbc`

JDBC URL.

| Field | Value |
| --- | --- |
| Key | `clickhouse.creds.jdbc` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### ClickHouse with an application database

Creates the user and the database in the connection URLs. The password is a placeholder:

```yaml
clickhouse:
  enabled: true
  password: example-placeholder-password
  clickhouseUsername: app
  clickhouseDatabase: app
```
