---
title: recovery
---

:::note

- See the [Full Examples](/truecharts-common/cnpg/recovery#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.recovery`

---

## `recovery`

Recovery settings, used when `mode` is `recovery`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `method`

Recovery method. `backup` recovers from a CNPG backup of the same cluster in the same namespace (needs `backupName`), `object_store` from a barman object store (needs `credentials`), `pg_basebackup` is accepted but not implemented yet.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.method` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"object_store"` |
| Allowed values | `"backup"`, `"object_store"`, `"pg_basebackup"` |

---

## `serverName`

Overrides the `serverName` of the recovery object store.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.serverName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `pitrTarget`

Point in time recovery target.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.pitrTarget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"time": ""}` |

---

## `pitrTarget.time`

Point in time recovery target time, in RFC3339 format.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.pitrTarget.time` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `destinationPath`

Overrides the provider specific default path of the object store to recover from. Defaults to `s3://<bucket>/<path>/<release name>/cnpg`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.destinationPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `credentials`

Name of the credentials in `.Values.credentials` for the object store to recover from.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.credentials` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `revision`

Revision appended to the `serverName` of the recovery archive, so restore and backup use different archives. Must be a string.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.revision` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backupName`

Name of the CNPG backup to recover from. Required when `method` is `backup`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.backupName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `servername`

Not read by common, use `serverName`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.servername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `clusterName`

Not read by common, the name of the cluster is generated.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.recovery.clusterName` |
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
    recovery:
      method: object_store
      serverName: example
```
