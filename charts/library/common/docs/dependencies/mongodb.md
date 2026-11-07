---
title: MongoDB
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/mongodb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`

---

## `mongodb`

The mongodb dependency.

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. Common sets them for the dependency. They are only for the internal use of common: do not use them in charts that are based on common.

:::

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |

---

## `depconfig.rootPassword`

Password of the `root` user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.rootPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERROOTPASSWORD"` |
| Length | 1 to … |

---

## `depconfig.mongodbUsername`

Name of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.mongodbUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"test"` |
| Length | 1 to … |

---

## `depconfig.mongodbDatabase`

Name of the database.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.mongodbDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"test"` |
| Length | 1 to … |

---

## `depconfig.creds`

Connection details populated by the library (eg `plainhost`, `complete`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.mode` |
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
| Key | `dependencies.mongodb.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

```yaml
dependencies:
  mongodb:
    enabled: true
    depconfig:
      mongodbUsername: app
      mongodbDatabase: app
    persistence:
      data:
        size: 5Gi

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
            MONGODB_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mongodbcreds" }}'
                key: url
```
