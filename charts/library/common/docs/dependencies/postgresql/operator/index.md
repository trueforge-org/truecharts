---
title: Operator
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator`

---

## `dependencies.postgresql.operator`

Settings of the CloudNativePG cluster that provides the `postgresql` dependency in `operator` mode. Never merged into the chart values.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.postgresql.operator` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `dependencies.postgresql.operator.annotations`

Additional annotations for all CNPG objects.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.postgresql.operator.annotations` |
| Type       | `map, string`                                  |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | `{}`                                           |

Example

```yaml
dependencies:
  postgresql:
    operator:
      annotations:
        {}
```

---

### `dependencies.postgresql.operator.backups`

Configuration for `dependencies.postgresql.operator.backups`.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.operator.backups` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.postgresql.operator.cluster`

Configuration of the CNPG cluster.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.postgresql.operator.hibernate`

Puts the CNPG cluster in hibernation mode.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.operator.hibernate` |
| Type       | `boolean`                                    |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | `false`                                      |

Example

```yaml
dependencies:
  postgresql:
    operator:
      hibernate: false
```

---

### `dependencies.postgresql.operator.labels`

Additional labels for all CNPG objects.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.operator.labels` |
| Type       | `map, string`                             |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `{}`                                      |

Example

```yaml
dependencies:
  postgresql:
    operator:
      labels:
        {}
```

---

### `dependencies.postgresql.operator.mode`

Cluster mode of operation. `standalone` creates a new or updates an existing CNPG cluster, `recovery` creates a cluster from a backup or object store. Not to be confused with `dependencies.postgresql.mode`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.operator.mode` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `"standalone"`                          |
| Enum       | `standalone`, `recovery`                |

Example

```yaml
dependencies:
  postgresql:
    operator:
      mode: standalone
```

---

### `dependencies.postgresql.operator.monitoring`

Configuration for `dependencies.postgresql.operator.monitoring`.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.postgresql.operator.monitoring` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `dependencies.postgresql.operator.pgVersion`

Version of PostgreSQL to use, changes the cluster naming scheme. Without a value, `global.fallbackDefaults.cnpg.pgVersion` is used, and `type: vectors` uses `16` as it has no image for PostgreSQL 18.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.operator.pgVersion` |
| Type       | `integer`                                    |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | `18`                                         |
| Enum       | `15`, `16`, `17`, `18`                       |

Without a value, `global.fallbackDefaults.cnpg.pgVersion` is used. `type: vectors` has no image for PostgreSQL 18, so without a value it uses `16`.

:::caution[Changing the version of an existing cluster]

CloudNativePG upgrades an existing cluster in place when its major version changes, with `pg_upgrade`. This also happens when a cluster has no `pgVersion` set and the default changes, so **set `pgVersion` to keep a cluster on its current version**.

- Take a full backup first, and a new one afterwards. Older backups can't be used for point-in-time recovery across major versions.
- All instances are stopped during the upgrade, and replicas are cloned again afterwards.
- It needs CloudNativePG 1.26 or newer.
- CloudNativePG only supports this between images on the same OS distribution. The images of this version of common moved to Debian 13, so a cluster on an older image should stay on its major version through that change, and upgrade afterwards.
- Check that the extensions of the cluster can be upgraded, such as PostGIS or VectorChord.
- If the upgrade fails, set `pgVersion` back to the previous version. CloudNativePG then starts the cluster on that version again.
- Run `ANALYZE` afterwards, as `pg_upgrade` does not keep the statistics.

:::

Example

```yaml
dependencies:
  postgresql:
    operator:
      pgVersion: 18
```

---

### `dependencies.postgresql.operator.pooler`

Configuration for `dependencies.postgresql.operator.pooler`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.operator.pooler` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `dependencies.postgresql.operator.recovery`

Configuration for `dependencies.postgresql.operator.recovery`.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.postgresql.operator.recovery` |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `dependencies.postgresql.operator.type`

Type of the CNPG database.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.type`                        |
| Type       | `string`                                                       |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | `"postgres"`                                                   |
| Enum       | `postgres`, `postgis`, `timescaledb`, `vectors`, `vectorchord` |

Example

```yaml
dependencies:
  postgresql:
    operator:
      type: postgres
```

---

## Child Pages

- [Cluster](cluster/)

---

## Full Examples

```yaml
dependencies:
  postgresql:
    enabled: true
    mode: operator
    depconfig:
      postgresqlUsername: "app"
      postgresqlDatabase: "app"
      password: "PLACEHOLDERPASSWORD"
    operator:
      hibernate: false
      type: postgres
      pgVersion: 18
      mode: standalone
      cluster: {}
      monitoring: {}
      recovery: {}
      backups: {}
      pooler: {}
```

With labels and annotations on all CNPG objects:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: "my-user"
      postgresqlDatabase: "my-app"
      password: "supersecret"
    operator:
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
```

Backups through the Barman Cloud plugin, recovering from a previous archive:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: "my-user"
      postgresqlDatabase: "my-app"
      password: "supersecret"
    operator:
      mode: recovery
      recovery:
        method: object_store
        credentials: my-s3
      backups:
        enabled: true
        credentials: my-s3
        # Prevents archiving on top of the archive it recovers from
        revision: "1"
        retentionPolicy: "30d"
        scheduledBackups:
          - name: daily-backup
            schedule: "0 0 0 * * *"
            backupOwnerReference: self
```
