---
title: instanceSidecarConfiguration
---

## Appears in

- `.Values.dependencies.postgresql.operator.backups.instanceSidecarConfiguration`
- `.Values.dependencies.postgresql.operator.recovery.instanceSidecarConfiguration`

---

## Child Pages

- [env](/truecharts-common/dependencies/postgresql/operator/backups/instanceSidecarConfiguration/env)

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

## `additionalContainerArgs`

Extra command-line arguments appended to the sidecar container. Do not set `--log-level` here, use `logLevel`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.additionalContainerArgs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env`

Environment variables passed to the sidecar container.

See [env](/truecharts-common/dependencies/postgresql/operator/backups/instanceSidecarConfiguration/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `logLevel`

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

## `resources`

Compute resources of the sidecar container that runs in the instance pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.claims`

Resource claims used by the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.claims[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.claims[].name`

Name of a resource from `spec.resourceClaims` used by the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.claims[].request`

Name of the request in the referenced claim.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.claims[].request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.limits`

Maximum compute resources allowed for the sidecar container, such as `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.limits.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.limits.$name` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.requests`

Minimum compute resources required by the sidecar container, such as `cpu` or `memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.requests` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.requests.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.resources.requests.$name` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retentionPolicyIntervalSeconds`

Interval in seconds at which the sidecar checks and enforces retention policies.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.backups.instanceSidecarConfiguration.retentionPolicyIntervalSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
