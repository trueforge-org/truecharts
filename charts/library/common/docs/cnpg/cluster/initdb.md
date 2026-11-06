---
title: initdb
---

:::note

- See the [Full Examples](/truecharts-common/cnpg/cluster/initdb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.cluster.initdb`

---

## `initdb`

Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `dataChecksums`

Whether to enable data checksums when the database is initialized.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.dataChecksums` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `encoding`

Encoding of the database, for example `UTF8`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.encoding` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `localeCollate`

Collation order of the database locale, for example `C`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.localeCollate` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `localeCtype`

Character classification of the database locale, for example `C`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.localeCtype` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `walSegmentSize`

Size of the WAL segments in MB, between 1 and 1024.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.walSegmentSize` |
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
| Key | `cnpg.$name.cluster.initdb.postInitSQL` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postInitApplicationSQL`

SQL statements to run after initialization, in the application database.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.postInitApplicationSQL` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postInitTemplateSQL`

SQL statements to run after initialization, in the `template1` database.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb.postInitTemplateSQL` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
cnpg:
  example:
    cluster:
      initdb:
        dataChecksums: true
        encoding: example
```
