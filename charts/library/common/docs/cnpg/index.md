---
title: CNPG
---

:::note

- See the [Full Examples](/truecharts-common/cnpg#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg`

---

## Child Pages

- [backups](/truecharts-common/cnpg/backups)
- [CNPG Cluster](/truecharts-common/cnpg/cluster)
- [creds](/truecharts-common/cnpg/creds)
- [monitoring](/truecharts-common/cnpg/monitoring)
- [recovery](/truecharts-common/cnpg/recovery)

---

## `cnpg`

CloudNativePG clusters, keyed by name (`main` by default). See [cnpg](/truecharts-common/cnpg).

| Field | Value |
| --- | --- |
| Key | `cnpg` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A CloudNativePG cluster, keyed by name.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Enables the CNPG cluster. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Marks this CNPG cluster as the primary one.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `$name.hibernate`

Puts the CNPG cluster in hibernation mode. Poolers and scheduled backups are stopped too.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.hibernate` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.instances`

Only validated, must be greater than 0 when set. The number of instances of the cluster is set with `cluster.instances`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.instances` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `$name.labels`

Additional labels for all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotations`

Additional annotations for all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the `labels` of all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the `annotations` of all CNPG objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.namespace`

Namespace of the CNPG objects. Supports Helm `tpl`, and overrides `namespace` and `global.namespace`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.type`

Type of the CNPG database, which selects the image: `postgres` for plain PostgreSQL, `postgis` with PostGIS, `timescaledb` with TimescaleDB, `vectors` with pgvecto.rs or `vectorchord` with VectorChord.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"postgres"` |
| Allowed values | `"postgres"`, `"postgis"`, `"timescaledb"`, `"vectors"`, `"vectorchord"` |

---

## `$name.pgVersion`

Major version of PostgreSQL to use. It selects the image (`postgres<type><version>Image`, eg `postgres16Image`) and changes the cluster naming scheme. Without a value, `global.fallbackDefaults.cnpg.pgVersion` is used.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pgVersion` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `16` |
| Allowed values | `15`, `16`, `"15"`, `"16"` |

---

## `$name.mode`

Cluster mode of operation. `standalone` creates a new or updates an existing CNPG cluster, `recovery` creates a cluster from a backup, object store or `pg_basebackup`. `replica` is accepted but not implemented yet.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"replica"`, `"recovery"` |

---

## `$name.upgradeMajor`

Reserved for major version upgrades. Accepted, but not acted on yet.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.upgradeMajor` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.database`

Name of the database, owned by `user`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.database` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"app"` |
| Length | 1 to … |

---

## `$name.user`

Name of the database user that owns the database.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"app"` |
| Length | 1 to … |

---

## `$name.password`

Password of the database user, written to a Secret. Change it from the default.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |
| Length | 1 to … |

---

## `$name.cluster`

Database cluster configuration. See [CNPG Cluster](/truecharts-common/cnpg/cluster).

See [CNPG Cluster](/truecharts-common/cnpg/cluster) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.monitoring`

Monitoring of the cluster.

See [monitoring](/truecharts-common/cnpg/monitoring) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enablePodMonitor": false, "disableDefaultQueries": false, "customQueries": []}` |

---

## `$name.recovery`

Recovery settings, used when `mode` is `recovery`.

See [recovery](/truecharts-common/cnpg/recovery) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.backups`

Backups of the cluster to a barman object store.

See [backups](/truecharts-common/cnpg/backups) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.pooler`

PgBouncer pooler in front of the cluster.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.pooler.enabled`

Enable the pooler.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.pooler.createRO`

Also create a pooler for the read-only instances.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.createRO` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.pooler.poolMode`

Pool mode of PgBouncer, `session` or `transaction`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.poolMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"session"` |
| Allowed values | `"session"`, `"transaction"` |

---

## `$name.pooler.instances`

Number of pooler instances. Gets scaled to 0 if hibernation is true.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.instances` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `2` |
| Range | 1 to … |

---

## `$name.pooler.parameters`

PgBouncer settings, keyed by name. Values support Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.parameters` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.pooler.parameters.$name`

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.parameters.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.pooler.labels`

Labels of the pooler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.pooler.annotations`

Annotations of the pooler.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.pooler.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.creds`

Credentials and URLs of the cluster, written by common so apps can use them. Read only.

See [creds](/truecharts-common/cnpg/creds) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
cnpg:
  main:
    enabled: true
    cluster:
      envFrom:
        - configMapRef:
            name: postgres-settings
        - secretRef:
            name: postgres-extra
            expandObjectName: false
```
