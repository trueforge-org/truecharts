---
title: backups
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/cnpg/backups#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.backups`

---

## `backups`

Backups of the cluster to a barman object store.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the backups of the CNPG cluster. Backups are not configured by default.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `encryption`

Encryption of the backups.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.encryption` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `encryption.enabled`

Encrypts the backups with AES256 when enabled.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.encryption.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `serverName`

Overrides the `serverName` in the object store of the backups.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.serverName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `destinationPath`

Overrides the provider specific default path of the object store for the backups. Defaults to `s3://<bucket>/<path>/<release name>/cnpg`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.destinationPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `target`

Instance the backups are taken from, `primary` or `prefer-standby`. Empty uses the default of CloudNativePG.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.target` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |
| Allowed values | `""`, `"primary"`, `"prefer-standby"` |

---

## `credentials`

Name of the credentials in `credentials` for the object store of the backups. Required when backups are enabled.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.credentials` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `scheduledBackups`

Backups that are taken on a schedule.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.scheduledBackups` |
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
| Key | `cnpg.$name.backups.scheduledBackups[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].name`

Name of the scheduled backup. Required.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.scheduledBackups[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].schedule`

Cron schedule of the backup, with seconds, eg `0 0 0 * * *`. Required.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.scheduledBackups[].schedule` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
cnpg:
  example:
    backups:
      scheduledBackups:
        - schedule: 0 0 0 * * *
```

---

## `scheduledBackups[].backupOwnerReference`

Owner of the created backups: `none`, `self` or `cluster`. Defaults to `none`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.scheduledBackups[].backupOwnerReference` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"none"`, `"self"`, `"cluster"` |

---

## `scheduledBackups[].immediate`

Also take a backup right away.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.scheduledBackups[].immediate` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `scheduledBackups[].suspend`

Pause the schedule.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.scheduledBackups[].suspend` |
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
| Key | `cnpg.$name.backups.scheduledBackups[].labels` |
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
| Key | `cnpg.$name.backups.scheduledBackups[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retentionPolicy`

Retention policy of the backups: a number followed by `d` (days), `w` (weeks) or `m` (months), eg `30d`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.retentionPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"30d"` |
| Pattern | `^[1-9][0-9]*[dwm]$` |

---

## `labels`

Additional labels for the backup objects of the CNPG cluster, merged with the root `labels`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.labels` |
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
| Key | `cnpg.$name.backups.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `compression`

Compression of the backups.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.compression` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `compression.enabled`

Set to `false` to disable the `bzip2` compression of the backups.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.compression.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `revision`

Revision appended to the `serverName` of the backup archive, so restore and backup use different archives. Must be a string. Can not match the revision of `recovery` in recovery mode.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.revision` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `jobs`

Number of parallel jobs used to upload the backups. Uses `2` when unset.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.jobs` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `manualBackups`

Backups that are taken once, when they are added.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.manualBackups` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `manualBackups[]`

A backup of the cluster that is taken once, created as a CNPG `Backup`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.manualBackups[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `manualBackups[].name`

Name of the backup. Required.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.manualBackups[].name` |
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
| Key | `cnpg.$name.backups.manualBackups[].labels` |
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
| Key | `cnpg.$name.backups.manualBackups[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `servername`

Not read by common, use `serverName`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.backups.servername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
cnpg:
  example:
    backups:
      enabled: false
      encryption:
        enabled: false
```
