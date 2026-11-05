---
title: storage
---

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.storage`
- `.Values.dependencies.postgresql.operator.cluster.walStorage`

---

## `storage`

Storage of the data volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `size`

Size of the PVC, for example `256Gi`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.size` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `accessModes`

Access modes of the PVC, as a list or as a single string.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.accessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `volumeName`

Name of the PersistentVolume to bind the PVC to.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.volumeName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `storageClass`

Name of the StorageClass to use for the PVC.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.storageClass` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSource`

Data source to populate the PVC from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSource` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSource.kind`

Kind of the data source.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSource.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSource.name`

Name of the data source.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSource.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSourceRef`

Data source reference to populate the PVC from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSourceRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSourceRef.kind`

Kind of the data source reference.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSourceRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSourceRef.name`

Name of the data source reference.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSourceRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSourceRef.apiGroup`

API group of the data source reference.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage.dataSourceRef.apiGroup` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
