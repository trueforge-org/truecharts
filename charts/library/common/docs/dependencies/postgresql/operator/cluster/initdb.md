---
title: Initdb
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster/initdb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.initdb`

---

## `dependencies.postgresql.operator.cluster.initdb`

Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `dependencies.postgresql.operator.cluster.initdb.dataChecksums`

Whether to enable data checksums when the database is initialized.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.dataChecksums` |
| Type       | `boolean`                                                       |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.postgresql.operator.cluster.initdb.encoding`

Encoding of the database, for example `UTF8`.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.encoding` |
| Type       | `string`                                                   |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `dependencies.postgresql.operator.cluster.initdb.localeCollate`

Collation order of the database locale, for example `C`.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.localeCollate` |
| Type       | `string`                                                        |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.postgresql.operator.cluster.initdb.localeCtype`

Character classification of the database locale, for example `C`.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.localeCtype` |
| Type       | `string`                                                      |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.postgresql.operator.cluster.initdb.postInitApplicationSQL`

SQL statements to run after initialization, in the application database.

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster.initdb.postInitApplicationSQL` |
| Type       | `list of string`                                                         |
| Required   | ❌                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | unset                                                                    |

---

### `dependencies.postgresql.operator.cluster.initdb.postInitSQL`

SQL statements to run after initialization, in the `postgres` database.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.postInitSQL` |
| Type       | `list of string`                                              |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.postgresql.operator.cluster.initdb.postInitTemplateSQL`

SQL statements to run after initialization, in the `template1` database.

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.postInitTemplateSQL` |
| Type       | `list of string`                                                      |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |

---

### `dependencies.postgresql.operator.cluster.initdb.walSegmentSize`

Size of the WAL segments in MB, between 1 and 1024.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb.walSegmentSize` |
| Type       | `integer`                                                        |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |
| Minimum    | `1`                                                              |
| Maximum    | `1024`                                                           |

---

## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        initdb:
          encoding: UTF8
          localeCollate: C
          localeCtype: C
          dataChecksums: true
          postInitApplicationSQL:
            - CREATE EXTENSION IF NOT EXISTS pg_trgm;
```
