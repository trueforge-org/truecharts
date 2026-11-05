---
title: MariaDB
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/mariadb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`

---

## `mariadb`

The mariadb dependency.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |

---

## `depconfig.rootPassword`

Password of the `root` user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.rootPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERROOTPASSWORD"` |
| Length | 1 to … |

---

## `depconfig.mariadbUsername`

Name of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.mariadbUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"test"` |
| Length | 1 to … |

---

## `depconfig.mariadbDatabase`

Name of the database.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.mariadbDatabase` |
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
| Key | `dependencies.mariadb.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.mode` |
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
| Key | `dependencies.mariadb.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

```yaml
dependencies:
  mariadb:
    enabled: true
    depconfig:
      mariadbUsername: app
      mariadbDatabase: app
      password: "{{ .Values.dbPassword }}"
      rootPassword: "{{ .Values.dbRootPassword }}"
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
            DB_HOST: '{{ .Values.dependencies.mariadb.depconfig.creds.plainhost | trimAll "\"" }}'
            DB_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
                key: url
            DB_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
                key: mariadb-password
```

### Operator mode

MariaDB, MongoDB, ClickHouse and Memcached accept `mode: operator`. Their objects are then not merged into the chart, as an operator provides them. The credentials Secret, wait init container and notes still apply:

```yaml
dependencies:
  mariadb:
    enabled: true
    mode: operator
    depconfig:
      mariadbUsername: app
      mariadbDatabase: app
```
