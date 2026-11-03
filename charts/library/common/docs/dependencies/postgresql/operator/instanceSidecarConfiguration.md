---
title: Instancesidecarconfiguration
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/instanceSidecarConfiguration#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.instanceSidecarConfiguration`

---

## `dependencies.postgresql.operator.instanceSidecarConfiguration`

Configuration of the sidecar that runs in the CNPG instance pods. Passed verbatim to the `instanceSidecarConfiguration` of the CNPG ObjectStore.

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.instanceSidecarConfiguration` |
| Type       | `map`                                                           |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | unset                                                           |

---

### `dependencies.postgresql.operator.instanceSidecarConfiguration.additionalContainerArgs`

Extra command-line arguments appended to the sidecar container. Do not set `--log-level` here, use `logLevel`.

| Field      | Value                                                                                   |
| ---------- | --------------------------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.instanceSidecarConfiguration.additionalContainerArgs` |
| Type       | `list of string`                                                                        |
| Required   | ❌                                                                                      |
| Helm `tpl` | ❌                                                                                      |
| Default    | unset                                                                                   |

---

### `dependencies.postgresql.operator.instanceSidecarConfiguration.env`

Environment variables passed to the sidecar container.

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.instanceSidecarConfiguration.env` |
| Type       | `list of map`                                                       |
| Required   | ❌                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | unset                                                               |

---

### `dependencies.postgresql.operator.instanceSidecarConfiguration.logLevel`

Log level of the PostgreSQL instance sidecar.

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `dependencies.postgresql.operator.instanceSidecarConfiguration.logLevel` |
| Type       | `string`                                                                 |
| Required   | ❌                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | unset                                                                    |
| Enum       | `error`, `warning`, `info`, `debug`, `trace`                             |

---

### `dependencies.postgresql.operator.instanceSidecarConfiguration.resources`

Compute resources of the sidecar container that runs in the instance pods.

| Field      | Value                                                                     |
| ---------- | ------------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.instanceSidecarConfiguration.resources` |
| Type       | `map`                                                                     |
| Required   | ❌                                                                        |
| Helm `tpl` | ❌                                                                        |
| Default    | unset                                                                     |

---

### `dependencies.postgresql.operator.instanceSidecarConfiguration.retentionPolicyIntervalSeconds`

Interval in seconds at which the sidecar checks and enforces retention policies.

| Field      | Value                                                                                          |
| ---------- | ---------------------------------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.instanceSidecarConfiguration.retentionPolicyIntervalSeconds` |
| Type       | `integer`                                                                                      |
| Required   | ❌                                                                                             |
| Helm `tpl` | ❌                                                                                             |
| Default    | unset                                                                                          |

---
