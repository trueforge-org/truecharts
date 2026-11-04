---
title: Cluster
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster`

---

## `dependencies.postgresql.operator.cluster`

Define a CNPG cluster

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.postgresql.operator.cluster.annotations`

Additional annotations for CNPG cluster

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster.annotations` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ✅ (On value only)                                      |
| Default    | `{}`                                                   |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        annotations:
          {}
```

---

### `dependencies.postgresql.operator.cluster.enableSuperuserAccess`

When enabled, the operator uses the superuser secret to set the password of the `postgres` user. When disabled, the password of the `postgres` user is blanked.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.enableSuperuserAccess` |
| Type       | `boolean`                                                        |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.postgresql.operator.cluster.env`

See [env](/truecharts-common/workload/podSpec/containers/env)

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.env` |
| Type       | `map, null`                                    |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | `{}`                                           |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        env:
          {}
```

---

### `dependencies.postgresql.operator.cluster.envFrom`

See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom)

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.envFrom` |
| Type       | `list, map`                                        |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | `{}`                                               |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        envFrom:
          {}
```

---

### `dependencies.postgresql.operator.cluster.imageName`

Container image of the PostgreSQL instances. When empty, the image is built from `type` and `pgVersion`.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.imageName` |
| Type       | `string`                                             |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `dependencies.postgresql.operator.cluster.initdb`

Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `{}`                                              |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        initdb:
          {}
```

---

### `dependencies.postgresql.operator.cluster.instances`

Number of instances

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.instances` |
| Type       | `integer`                                            |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | `2`                                                  |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        instances: 2
```

---

### `dependencies.postgresql.operator.cluster.labels`

Additional labels for CNPG cluster

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.labels` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ✅ (On value only)                                 |
| Default    | `{}`                                              |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        labels:
          {}
```

---

### `dependencies.postgresql.operator.cluster.logLevel`

The log level of the CNPG instances. Available values: `error`, `warning`, `info`, `debug` and `trace`.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.logLevel` |
| Type       | `string`                                            |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | `"info"`                                            |
| Enum       | `error`, `warning`, `info`, `debug`, `trace`        |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        logLevel: info
```

---

### `dependencies.postgresql.operator.cluster.nodeMaintenanceWindow`

Node maintenance window of the CNPG cluster.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.nodeMaintenanceWindow` |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.postgresql.operator.cluster.postgresGID`

Group ID of the PostgreSQL process. When not set, `26` is used.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster.postgresGID` |
| Type       | `integer`                                              |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `dependencies.postgresql.operator.cluster.postgresUID`

User ID of the PostgreSQL process. When not set, `26` is used.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster.postgresUID` |
| Type       | `integer`                                              |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `dependencies.postgresql.operator.cluster.postgresql`

Parameters of the PostgreSQL server. Each parameter is passed to CNPG as a string, so every value must be a string.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.postgresql` |
| Type       | `map, null`                                           |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.postgresql.operator.cluster.preloadLibraries`

Shared libraries to preload when the PostgreSQL server starts.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.preloadLibraries` |
| Type       | `list of string`                                            |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `dependencies.postgresql.operator.cluster.primaryUpdateMethod`

Method to upgrade the primary server during a rolling update. `switchover` promotes an upgraded replica, `restart` restarts the primary in place.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.primaryUpdateMethod` |
| Type       | `string`                                                       |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | `"switchover"`                                                 |
| Enum       | `switchover`, `restart`                                        |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        primaryUpdateMethod: switchover
```

---

### `dependencies.postgresql.operator.cluster.primaryUpdateStrategy`

Strategy to upgrade the primary server after all replicas are updated. `unsupervised` switches over automatically, `supervised` requires a manual switchover.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.primaryUpdateStrategy` |
| Type       | `string`                                                         |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | `"unsupervised"`                                                 |
| Enum       | `supervised`, `unsupervised`                                     |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        primaryUpdateStrategy: unsupervised
```

---

### `dependencies.postgresql.operator.cluster.resources`

Resources of the PostgreSQL instances. Gets scaled to 0 if hibernation is true.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.resources` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `dependencies.postgresql.operator.cluster.singleNode`

Whether this is a single-node cluster. Setting this to `true` would allow PVCs to be kept on instance restart.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.singleNode` |
| Type       | `boolean`                                             |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | `false`                                               |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        singleNode: false
```

---

### `dependencies.postgresql.operator.cluster.skipEmptyWalArchiveCheck`

Skips the check that the WAL archive is empty before the cluster starts. Needed when the cluster reuses an archive that is not empty.

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.skipEmptyWalArchiveCheck` |
| Type       | `boolean`                                                           |
| Required   | ❌                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | unset                                                               |

---

### `dependencies.postgresql.operator.cluster.storage`

Storage of the data volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.storage` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.postgresql.operator.cluster.walStorage`

Storage of the WAL volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.walStorage` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

## Child Pages

- [Initdb](initdb.md) - Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.
- [Postgresql](postgresql.md) - Parameters of the PostgreSQL server. Each parameter is passed to CNPG as a string, so every value must be a string.
- [Primaryupdatemethod](primaryUpdateMethod.md) - Method to upgrade the primary server during a rolling update. `switchover` promotes an upgraded replica, `restart` restarts the primary in place.
- [Primaryupdatestrategy](primaryUpdateStrategy.md) - Strategy to upgrade the primary server after all replicas are updated. `unsupervised` switches over automatically, `supervised` requires a manual switchover.
- [Storage](storage.md) - Storage of the PostgreSQL data or WAL volumes. Follows the same spec as `persistence` with type `pvc`.

---

## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        labels:
          label1: label1
        annotations:
          annotation1: annotation1
        env:
          key: value
        envFrom:
          - secretRef:
              name: my-secret
              expandObjectName: true
          - configMapRef:
              name: my-configmap
              expandObjectName: false
        instances: 2
        singleNode: false
        logLevel: info
        primaryUpdateMethod: switchover
        primaryUpdateStrategy: unsupervised
        postgresql:
          max_connections: "200"
        initdb:
          encoding: UTF8
```
