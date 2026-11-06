---
title: PostgreSQL Operator
---

## Appears in

- `.Values.dependencies.postgresql.operator`

---

## Child Pages

- [monitoring](/truecharts-common/dependencies/postgresql/operator/monitoring)
- [PostgreSQL Backups](/truecharts-common/dependencies/postgresql/operator/backups)
- [PostgreSQL Cluster](/truecharts-common/dependencies/postgresql/operator/cluster)
- [PostgreSQL Recovery](/truecharts-common/dependencies/postgresql/operator/recovery)

---

## `operator`

Settings of the CloudNativePG `Cluster`, used when `mode` is `operator`. The credentials stay in `depconfig`. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `cluster`

Configuration of the CNPG cluster.

See [PostgreSQL Cluster](/truecharts-common/dependencies/postgresql/operator/cluster) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hibernate`

Puts the CNPG cluster in hibernation mode.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.hibernate` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `labels`

Additional labels for all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `annotations`

Additional annotations for all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `annotationsList`

Additional annotations as a list of name and value pairs, merged into the `annotations` of all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labelsList`

Additional labels as a list of name and value pairs, merged into the `labels` of all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `namespace`

Namespace of the CNPG objects. Templated with `tpl`, and overrides `global.namespace` and `namespace`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instances`

Number of instances. Must be at least 1 when set. Only validated, the CNPG cluster uses `cluster.instances`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.instances` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `type`

Flavor of the CloudNativePG cluster, which selects the image: `postgres` for plain PostgreSQL, `postgis` with PostGIS, `vectors` with pgvecto.rs or `vectorchord` with VectorChord.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"postgres"` |
| Allowed values | `"postgres"`, `"postgis"`, `"vectors"`, `"vectorchord"` |

---

## `pgVersion`

Major version of PostgreSQL to use. It selects the image (`postgres<type><version>Image`, eg `postgres18Image`) and changes the cluster naming scheme. Without a value, `global.fallbackDefaults.cnpg.pgVersion` is used, except for `type: vectors`, which has no image for PostgreSQL 18 and uses `16`. It only applies to `operator` mode, and is ignored in `standalone` mode.

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

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pgVersion` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `18` |
| Allowed values | `15`, `16`, `17`, `18` |

---

## `mode`

Cluster mode of operation. `standalone` creates a new or updates an existing CNPG cluster, `recovery` creates a cluster from a backup or object store. Not to be confused with `dependencies.postgresql.mode`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"recovery"` |

---

## `monitoring`

Monitoring of the cluster.

See [monitoring](/truecharts-common/dependencies/postgresql/operator/monitoring) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.monitoring` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enablePodMonitor": false, "disableDefaultQueries": false, "customQueries": []}` |

---

## `recovery`

Create the cluster from a backup or an object store.

See [PostgreSQL Recovery](/truecharts-common/dependencies/postgresql/operator/recovery) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backups`

Backups of the cluster, through the Barman Cloud plugin.

See [PostgreSQL Backups](/truecharts-common/dependencies/postgresql/operator/backups) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `pooler`

PgBouncer pooler in front of the cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `pooler.enabled`

Enable the pooler.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `pooler.createRO`

Also create a pooler for the read-only instances.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.createRO` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `pooler.poolMode`

Pool mode of PgBouncer, `session` or `transaction`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.poolMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"session"` |

---

## `pooler.instances`

Number of pooler instances.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.instances` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `2` |

---

## `pooler.parameters`

PgBouncer settings, keyed by name.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.parameters` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `pooler.parameters.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.parameters.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `pooler.labels`

Labels of the pooler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `pooler.annotations`

Annotations of the pooler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.pooler.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---
