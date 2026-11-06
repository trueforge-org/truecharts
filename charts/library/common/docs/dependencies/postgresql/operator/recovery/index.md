---
title: PostgreSQL Recovery
---

## Appears in

- `.Values.dependencies.postgresql.operator.recovery`

---

## Child Pages

- [instanceSidecarConfiguration](/truecharts-common/dependencies/postgresql/operator/recovery/instanceSidecarConfiguration)

---

## `recovery`

Create the cluster from a backup or an object store.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `method`

Recovery method of the CNPG cluster, such as `object_store`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.method` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"object_store"` |

---

## `serverName`

Overrides the `serverName` of the recovery object store.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.serverName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `pitrTarget`

Point in time recovery target.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.pitrTarget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"time": ""}` |

---

## `pitrTarget.time`

Point in time recovery target time.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.pitrTarget.time` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `destinationPath`

Destination path of the object store to recover from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.destinationPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `credentials`

Name of the credentials in `.Values.credentials` for the object store to recover from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.credentials` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `revision`

Revision appended to the `serverName` of the recovery archive, so restore and backup use different archives. Must be a string.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.revision` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration`

Settings of the Barman Cloud plugin sidecar.

See [instanceSidecarConfiguration](/truecharts-common/dependencies/postgresql/operator/recovery/instanceSidecarConfiguration) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
