---
title: CNPG Cluster
---

:::note

- See the [Full Examples](/truecharts-common/cnpg/cluster#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.cluster`

---

## Child Pages

- [envFrom](/truecharts-common/cnpg/cluster/envFrom)
- [initdb](/truecharts-common/cnpg/cluster/initdb)
- [storage](/truecharts-common/cnpg/cluster/storage)

---

## `cluster`

Database cluster configuration.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labels`

Additional labels for CNPG cluster

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.labels` |
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
| Key | `cnpg.$name.cluster.annotations` |
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
| Key | `cnpg.$name.cluster.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `envFrom`

ConfigMaps and Secrets whose keys become environment variables of the PostgreSQL instances. See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom).

See [envFrom](/truecharts-common/cnpg/cluster/envFrom) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom` |
| Type | `list of map or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `instances`

Number of instances

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.instances` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `2` |

---

## `singleNode`

Whether this is a single-node cluster. Setting this to `true` would allow PVCs to be kept on instance restart.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.singleNode` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `primaryUpdateMethod`

Method to upgrade the primary server during a rolling update. `switchover` promotes an upgraded replica, `restart` restarts the primary in place.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.primaryUpdateMethod` |
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
| Key | `cnpg.$name.cluster.primaryUpdateStrategy` |
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
| Key | `cnpg.$name.cluster.logLevel` |
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
| Key | `cnpg.$name.cluster.postgresql` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |

---

## `postgresql.$name`

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.postgresql.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `initdb`

Bootstrap settings of the database, used when the CNPG cluster is initialized with `initdb`.

See [initdb](/truecharts-common/cnpg/cluster/initdb) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.initdb` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `enableSuperuserAccess`

When enabled, the operator uses the superuser secret to set the password of the `postgres` user. When disabled, the password of the `postgres` user is blanked.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.enableSuperuserAccess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `imageName`

Container image of the PostgreSQL instances. When empty, the image is picked from `type` and `pgVersion`, eg `postgres16Image`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.imageName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `skipEmptyWalArchiveCheck`

Skips the check that the WAL archive is empty before the cluster starts. Needed when the cluster reuses an archive that is not empty.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.skipEmptyWalArchiveCheck` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postgresUID`

User ID of the PostgreSQL process. When not set, `26` is used.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.postgresUID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postgresGID`

Group ID of the PostgreSQL process. When not set, `26` is used.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.postgresGID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preloadLibraries`

Shared libraries to preload when the PostgreSQL server starts.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.preloadLibraries` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeMaintenanceWindow`

Node maintenance window of the CNPG cluster.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.nodeMaintenanceWindow` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeMaintenanceWindow.inProgress`

Whether a node maintenance window is in progress.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.nodeMaintenanceWindow.inProgress` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nodeMaintenanceWindow.reusePVC`

Whether the PVCs of an instance are reused when the instance is recreated during the maintenance window.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.nodeMaintenanceWindow.reusePVC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

Resources of the PostgreSQL instances. Gets scaled to 0 if hibernation is true.

See [Resources](/truecharts-common/workload/podSpec/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `storage`

Storage of the data volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

See [storage](/truecharts-common/cnpg/cluster/storage) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.storage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `walStorage`

Storage of the WAL volumes of the PostgreSQL instances. Follows the same spec as `persistence` with type `pvc`.

See [storage](/truecharts-common/cnpg/cluster/storage) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.walStorage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certificates`

Configuration of the CA and related certificates, see the [CloudNativePG documentation](https://cloudnative-pg.io/documentation/current/api_reference/#CertificatesConfiguration). Not read by common, so it is not passed on to the cluster.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.certificates` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |

---

## `certificates.serverCASecret`

Name of the Secret with the CA that signs the server certificate.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.certificates.serverCASecret` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certificates.serverTLSSecret`

Name of the Secret with the server certificate.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.certificates.serverTLSSecret` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certificates.replicationTLSSecret`

Name of the Secret with the replication client certificate.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.certificates.replicationTLSSecret` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certificates.clientCASecret`

Name of the Secret with the CA that signs the client certificates.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.certificates.clientCASecret` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certificates.serverAltDNSNames`

Additional DNS names of the server certificate.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.certificates.serverAltDNSNames` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
cnpg:
  main:
    cluster:
      envFrom:
        - configMapRef:
            name: postgres-settings
        - secretRef:
            name: postgres-extra
            expandObjectName: false
```
