---
title: initdb
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster/initdb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.initdb`

---

## `initdb`

Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `dataChecksums`

Whether to enable data checksums when the database is initialized.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.dataChecksums` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `encoding`

Encoding of the database, for example `UTF8`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.encoding` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `localeCollate`

Collation order of the database locale, for example `C`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.localeCollate` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `localeCtype`

Character classification of the database locale, for example `C`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.localeCtype` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `walSegmentSize`

Size of the WAL segments in MB, between 1 and 1024.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.walSegmentSize` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 1024 |

---

## `postInitSQL`

SQL statements to run after initialization, in the `postgres` database.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.postInitSQL` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postInitApplicationSQL`

SQL statements to run after initialization, in the application database.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.postInitApplicationSQL` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postInitTemplateSQL`

SQL statements to run after initialization, in the `template1` database.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb.postInitTemplateSQL` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

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
