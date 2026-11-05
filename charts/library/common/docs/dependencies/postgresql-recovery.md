---
title: PostgreSQL Recovery
---

## Appears in

- `.Values.dependencies.postgresql.operator.recovery`

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

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.additionalContainerArgs`

Extra command-line arguments appended to the sidecar container. Do not set `--log-level` here, use `logLevel`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.additionalContainerArgs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env`

Environment variables passed to the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].name`

Name of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].value`

Value of the environment variable. Cannot be used together with `valueFrom`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom`

Source for the environment variable's value. Cannot be used if `value` is set.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef`

Selects a key of a ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.key`

The key to select from the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.optional`

Whether the ConfigMap or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fieldRef`

Selects a field of the Pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fieldRef.apiVersion`

Version of the schema the field path is written in, defaults to `v1`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fieldRef.fieldPath`

Path of the Pod field to select.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef`

Selects a key of an env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.key`

The key within the env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.optional`

Whether the file or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.path`

Path within the volume to select the file from. Must be relative.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.volumeName`

Name of the volume mount containing the env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.volumeName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef`

Selects a resource of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.containerName`

Container name, optional for env vars.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.divisor`

Output format of the exposed resource, defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.divisor` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.resource`

Resource to select, such as `limits.cpu` or `requests.memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.resource` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef`

Selects a key of a Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.key`

The key of the Secret to select from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.optional`

Whether the Secret or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.logLevel`

Log level of the PostgreSQL instance sidecar.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.logLevel` |
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
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims`

Resource claims used by the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.claims` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.claims[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims[].name`

Name of a resource from `spec.resourceClaims` used by the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.claims[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.claims[].request`

Name of the request in the referenced claim.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.claims[].request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.limits`

Maximum compute resources allowed for the sidecar container, such as `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.limits.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.limits.$name` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.requests`

Minimum compute resources required by the sidecar container, such as `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.requests` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.resources.requests.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.resources.requests.$name` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `instanceSidecarConfiguration.retentionPolicyIntervalSeconds`

Interval in seconds at which the sidecar checks and enforces retention policies.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.retentionPolicyIntervalSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
