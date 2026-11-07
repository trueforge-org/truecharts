---
title: PostgreSQL Backups
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/backups#full-examples) section for complete examples.

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

See [instanceSidecarConfiguration](/truecharts-common/dependencies/postgresql/operator/recovery/instanceSidecarConfiguration) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  postgresql:
    operator:
      backups:
        enabled: true
        credentials: mys3
```

```yaml
dependencies:
  postgresql:
    operator:
      backups:
        enabled: true
        credentials: my-s3
        revision: '1'
        retentionPolicy: 30d
        scheduledBackups:
          - name: daily-backup
            schedule: 0 0 0 * * *
            backupOwnerReference: self
```

```yaml
dependencies:
  postgresql:
    operator:
      backups:
        enabled: true
        credentials: my-s3
        retentionPolicy: 30d
        target: prefer-standby
        jobs: 2
        compression:
          enabled: true
        encryption:
          enabled: true
        scheduledBackups:
          - name: daily-backup
            schedule: 0 0 0 * * *
            backupOwnerReference: self
            immediate: true
        manualBackups:
          - name: before-upgrade
```
