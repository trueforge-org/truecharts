---
title: Other Dependencies
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/other#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`
- `.Values.dependencies.$name`

---

## `dependencies.mariadb`

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

## `dependencies.mariadb.depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mariadb.depconfig.password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |

---

## `dependencies.mariadb.depconfig.rootPassword`

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

## `dependencies.mariadb.depconfig.mariadbUsername`

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

## `dependencies.mariadb.depconfig.mariadbDatabase`

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

## `dependencies.mariadb.depconfig.creds`

Connection details populated by the library (eg `plainhost`, `complete`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mariadb.depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mariadb.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `dependencies.mariadb.mode`

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

## `dependencies.mariadb.operator`

Settings specific to the operator providing the dependency (see `mode`). Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.mariadb.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mongodb`

The mongodb dependency.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mongodb.depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mongodb.depconfig.password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |

---

## `dependencies.mongodb.depconfig.rootPassword`

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

## `dependencies.mongodb.depconfig.mongodbUsername`

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

## `dependencies.mongodb.depconfig.mongodbDatabase`

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

## `dependencies.mongodb.depconfig.creds`

Connection details populated by the library (eg `plainhost`, `complete`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mongodb.depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.mongodb.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `dependencies.mongodb.mode`

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

## `dependencies.mongodb.operator`

Settings specific to the operator providing the dependency (see `mode`). Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.mongodb.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.clickhouse`

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

## `dependencies.clickhouse.depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.clickhouse.depconfig.password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |

---

## `dependencies.clickhouse.depconfig.clickhouseUsername`

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

## `dependencies.clickhouse.depconfig.clickhouseDatabase`

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

## `dependencies.clickhouse.depconfig.clickhouseDefaultAccessManagement`

Set to `1` to allow the user to manage users and grants with SQL.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.clickhouseDefaultAccessManagement` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `0` |

---

## `dependencies.clickhouse.depconfig.creds`

Connection details populated by the library (eg `plainhost`, `complete`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.clickhouse.depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.clickhouse.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `dependencies.clickhouse.mode`

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

## `dependencies.clickhouse.operator`

Settings specific to the operator providing the dependency (see `mode`). Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.clickhouse.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.memcached`

The memcached dependency. It has no credentials, the chart connects to its primary service.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.memcached.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `dependencies.memcached.mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"operator"` |

---

## `dependencies.memcached.depconfig`

Configuration of the dependency itself. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.memcached.depconfig.password`

Password used by the dependency. Defaults to `PLACEHOLDERPASSWORD`.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.memcached.depconfig.creds`

Connection details populated by the dependency (eg `plainhost`, `url`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.memcached.depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.memcached.operator`

Settings specific to the operator providing the dependency (see `mode`). Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name`

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.depconfig.password`

Password of the dependency.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.depconfig.creds`

Connection details set by the dependency, eg `plainhost` and `url`. Read only.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.operator`

Settings for the operator that provides the dependency. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.operator.$name`

A setting for the operator. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.operator.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dependencies.$name.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `dependencies.$name.mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"operator"` |

---

## Full Examples

Every dependency merges the objects it defines (workload, service, persistence and so on) into the chart, named `<dependency>-<object>`. The credentials Secrets are named `<release>-<dependency>creds`. See [Dependencies](/truecharts-common/dependencies) for how they work.

### MariaDB

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

### MongoDB

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

### ClickHouse

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

### Memcached

Memcached has no credentials. The app connects to the service of the dependency on port `11211`:

```yaml
dependencies:
  memcached:
    enabled: true

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
            MEMCACHED_HOST: "{{ .Release.Name }}-memcached-main"
            MEMCACHED_PORT: 11211
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

### Custom dependency

Any other name is a dependency with a complete chart values structure. Its objects are merged into the chart as `<name>-<object>`, and the references between them are rewritten. There is no credentials Secret or wait init container:

```yaml
redisImage:
  repository: oci.trueforge.org/containerforge/redis
  pullPolicy: IfNotPresent
  tag: 8.0.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

dependencies:
  redis:
    enabled: true
    workload:
      main:
        replicas: 1
        type: StatefulSet
        podSpec:
          containers:
            main:
              imageSelector: redisImage
    service:
      main:
        ports:
          main:
            protocol: tcp
            port: 6379
            targetPort: 6379
    persistence:
      data:
        mountPath: /data
        size: 1Gi
```
