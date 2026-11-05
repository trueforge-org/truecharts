---
title: PostgreSQL Cluster
---

## Appears in

- `.Values.dependencies.postgresql.operator.cluster`

---

## Child Pages

- [storage](/truecharts-common/dependencies/postgresql/operator/cluster/storage)
- [initdb](/truecharts-common/dependencies/postgresql/operator/cluster/initdb)

---

## `cluster`

Configuration of the CNPG cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labels`

Additional labels for CNPG cluster

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `annotations`

Additional annotations for CNPG cluster

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `env`

Environment variables of the PostgreSQL instances, keyed by name. See [env](/truecharts-common/workload/podSpec/containers/env).

See [Env](/truecharts-common/workload/podSpec/containers/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `envFrom`

ConfigMaps and Secrets whose keys become environment variables of the PostgreSQL instances. See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom).

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom` |
| Type | `list of map or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `envFrom[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].configMapRef`

A ConfigMap whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].configMapRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the configmap name

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[].configMapRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].configMapRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[].configMapRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].secretRef`

A Secret whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].secretRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[].secretRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].secretRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the secret name

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.envFrom[].secretRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instances`

Number of instances

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.instances` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `2` |

---

## `singleNode`

Whether this is a single-node cluster. Setting this to `true` would allow PVCs to be kept on instance restart.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.singleNode` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `primaryUpdateMethod`

Method to upgrade the primary server during a rolling update. `switchover` promotes an upgraded replica, `restart` restarts the primary in place.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.primaryUpdateMethod` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"switchover"` |
| Allowed values | `"switchover"`, `"restart"` |

---

## `primaryUpdateStrategy`

Strategy to upgrade the primary server after all replicas are updated. `unsupervised` switches over automatically, `supervised` requires a manual switchover.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.primaryUpdateStrategy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"unsupervised"` |
| Allowed values | `"supervised"`, `"unsupervised"` |

---

## `logLevel`

The log level of the CNPG instances. Available values: `error`, `warning`, `info`, `debug` and `trace`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.logLevel` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"info"` |
| Allowed values | `"error"`, `"warning"`, `"info"`, `"debug"`, `"trace"` |

---

## `postgresql`

Parameters of the PostgreSQL server. Each parameter is passed to CNPG as a string, so every value must be a string.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.postgresql` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |

---

## `postgresql.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.postgresql.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `initdb`

Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.

See [initdb](/truecharts-common/dependencies/postgresql/operator/cluster/initdb) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.initdb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `enableSuperuserAccess`

When enabled, the operator uses the superuser secret to set the password of the `postgres` user. When disabled, the password of the `postgres` user is blanked.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.enableSuperuserAccess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `imageName`

Container image of the PostgreSQL instances. When empty, the image is built from `type` and `pgVersion`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.imageName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `skipEmptyWalArchiveCheck`

Skips the check that the WAL archive is empty before the cluster starts. Needed when the cluster reuses an archive that is not empty.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.skipEmptyWalArchiveCheck` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postgresUID`

User ID of the PostgreSQL process. When not set, `26` is used.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.postgresUID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postgresGID`

Group ID of the PostgreSQL process. When not set, `26` is used.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.postgresGID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preloadLibraries`

Shared libraries to preload when the PostgreSQL server starts.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.preloadLibraries` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeMaintenanceWindow`

Node maintenance window of the CNPG cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.nodeMaintenanceWindow` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeMaintenanceWindow.inProgress`

Whether a node maintenance window is in progress.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.nodeMaintenanceWindow.inProgress` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeMaintenanceWindow.reusePVC`

Whether the PVCs of an instance are reused when the instance is recreated during the maintenance window.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.nodeMaintenanceWindow.reusePVC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

Resources of the PostgreSQL instances. Gets scaled to 0 if hibernation is true.

See [Resources](/truecharts-common/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `storage`

Storage of the data volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

See [storage](/truecharts-common/dependencies/postgresql/operator/cluster/storage) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.storage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `walStorage`

Storage of the WAL volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

See [storage](/truecharts-common/dependencies/postgresql/operator/cluster/storage) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.walStorage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
