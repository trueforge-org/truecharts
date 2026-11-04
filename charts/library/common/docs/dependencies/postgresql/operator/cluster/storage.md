---
title: Storage
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster/storage#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.storage`

---

## `dependencies.postgresql.operator.cluster.storage`

Storage of the PostgreSQL data or WAL volumes. Follows the same spec as `persistence` with type `pvc`.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.postgresql.operator.cluster.storage.accessModes`

Access modes of the PVC, as a list or as a single string.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage.accessModes` |
| Type       | `list, string`                                                 |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.postgresql.operator.cluster.storage.dataSource`

Data source to populate the PVC from.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage.dataSource` |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.postgresql.operator.cluster.storage.dataSourceRef`

Data source reference to populate the PVC from.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage.dataSourceRef` |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.postgresql.operator.cluster.storage.size`

Size of the PVC, for example `256Gi`.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage.size` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `dependencies.postgresql.operator.cluster.storage.storageClass`

Name of the StorageClass to use for the PVC.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage.storageClass` |
| Type       | `string`                                                        |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.postgresql.operator.cluster.storage.volumeName`

Name of the PersistentVolume to bind the PVC to.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage.volumeName` |
| Type       | `string`                                                      |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---
