---
title: ClickHouse
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/clickhouse#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`

---

## `clickhouse`

The clickhouse dependency.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |

---

## `depconfig.clickhouseUsername`

Name of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.clickhouseUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"test"` |
| Length | 1 to … |

---

## `depconfig.clickhouseDatabase`

Name of the database.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.clickhouseDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"test"` |
| Length | 1 to … |

---

## `depconfig.clickhouseDefaultAccessManagement`

Set to `1` to allow the user to manage users and grants with SQL.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.clickhouseDefaultAccessManagement` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `0` |

---

## `depconfig.creds`

Connection details populated by the library (eg `plainhost`, `complete`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"operator"` |

---

## `operator`

Settings specific to the operator providing the dependency (see `mode`). Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

```yaml
dependencies:
  clickhouse:
    enabled: true
    depconfig:
      clickhouseUsername: app
      clickhouseDatabase: app
      clickhouseDefaultAccessManagement: 1

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
          env:
            CLICKHOUSE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
                key: url
            CLICKHOUSE_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
                key: clickhouse-password
```
