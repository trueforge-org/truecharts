---
title: PostgreSQL Backups
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.dependencies.postgresql.operator.backups`

---

## `backups`

Backups of the cluster, through the Barman Cloud plugin.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the backups of the CNPG cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `encryption`

Encryption of the backups.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.encryption` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `encryption.enabled`

Encrypts the backups with AES256 when enabled.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.encryption.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `serverName`

Overrides the `serverName` in the object store of the backups.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.serverName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `destinationPath`

Destination path of the object store for the backups.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.destinationPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `target`

Target of the backups, `prefer-standby` or `primary`. Empty uses the default, `prefer-standby`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.target` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `credentials`

Name of the credentials in `.Values.credentials` for the object store of the backups.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.credentials` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `scheduledBackups`

Backups that are taken on a schedule.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
- name: daily-backup
  schedule: 0 0 0 * * *
  backupOwnerReference: self
  immediate: true
  suspend: false
```

---

## `scheduledBackups[]`

A recurring backup of the cluster, created as a CNPG `ScheduledBackup`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].name`

Name of the backup.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].schedule`

Cron schedule of the backup, with seconds, eg `0 0 0 * * *`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].schedule` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
dependencies:
  postgresql:
    operator:
      backups:
        scheduledBackups:
          - schedule: 0 0 0 * * *
```

---

## `scheduledBackups[].backupOwnerReference`

Owner of the created backups: `none`, `self` or `cluster`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].backupOwnerReference` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].immediate`

Also take a backup right away.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].immediate` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].suspend`

Pause the schedule.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].suspend` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].labels`

Additional labels for this scheduled backup, merged with `backups.labels`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].annotations`

Additional annotations for this scheduled backup, merged with `backups.annotations`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.scheduledBackups[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retentionPolicy`

Retention policy of the backups, for example `30d`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.retentionPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"30d"` |

---

## `labels`

Additional labels for the backup objects of the CNPG cluster, merged with the root `labels`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `annotations`

Additional annotations for the backup objects of the CNPG cluster, merged with the root `annotations`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `compression`

Compression of the backups.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.compression` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `compression.enabled`

Set to `false` to disable the `bzip2` compression of the backups.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.compression.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `revision`

Revision appended to the `serverName` of the backup archive, so restore and backup use different archives. Must be a string. Required when `cluster.skipEmptyWalArchiveCheck` is false and both use the same archive.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.revision` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `jobs`

Number of parallel jobs used to upload the backups. Uses `2` when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.jobs` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `manualBackups`

Backups that are taken once, when they are added.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.manualBackups` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `manualBackups[]`

A backup of the cluster that is taken once, created as a CNPG `Backup`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.manualBackups[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `manualBackups[].name`

Name of the backup.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.manualBackups[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `manualBackups[].labels`

Additional labels for this manual backup, merged with `backups.labels`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.manualBackups[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `manualBackups[].annotations`

Additional annotations for this manual backup, merged with `backups.annotations`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.manualBackups[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration`

Settings of the Barman Cloud plugin sidecar.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.additionalContainerArgs`

Extra command-line arguments appended to the sidecar container. Do not set `--log-level` here, use `logLevel`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.additionalContainerArgs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env`

Environment variables passed to the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].name`

Name of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].value`

Value of the environment variable. Cannot be used together with `valueFrom`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom`

Source for the environment variable's value. Cannot be used if `value` is set.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef`

Selects a key of a ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.key`

The key to select from the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.optional`

Whether the ConfigMap or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fieldRef`

Selects a field of the Pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fieldRef.apiVersion`

Version of the schema the field path is written in, defaults to `v1`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fieldRef.fieldPath`

Path of the Pod field to select.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef`

Selects a key of an env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.key`

The key within the env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.optional`

Whether the file or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.path`

Path within the volume to select the file from. Must be relative.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.volumeName`

Name of the volume mount containing the env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.volumeName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef`

Selects a resource of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.containerName`

Container name, optional for env vars.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.divisor`

Output format of the exposed resource, defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.divisor` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.resource`

Resource to select, such as `limits.cpu` or `requests.memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.resource` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef`

Selects a key of a Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.key`

The key of the Secret to select from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.optional`

Whether the Secret or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.logLevel`

Log level of the PostgreSQL instance sidecar.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.logLevel` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"error"`, `"warning"`, `"info"`, `"debug"`, `"trace"` |

---

## `instanceSidecarConfiguration.resources`

Compute resources of the sidecar container that runs in the instance pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims`

Resource claims used by the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims[].name`

Name of a resource from `spec.resourceClaims` used by the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims[].request`

Name of the request in the referenced claim.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims[].request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.limits`

Maximum compute resources allowed for the sidecar container, such as `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.limits.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.limits.$name` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.requests`

Minimum compute resources required by the sidecar container, such as `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.requests` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.requests.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.requests.$name` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.retentionPolicyIntervalSeconds`

Interval in seconds at which the sidecar checks and enforces retention policies.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.retentionPolicyIntervalSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
