---
title: Securitycontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.securityContext`

---

## `dependencies.valkey.operator.securityContext`

No description provided.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `dependencies.valkey.operator.securityContext.allowPrivilegeEscalation`

Whether the process can gain more privileges than its parent process.

| Field      | Value                                                                   |
| ---------- | ----------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.allowPrivilegeEscalation` |
| Type       | `boolean`                                                               |
| Required   | ❌                                                                      |
| Helm `tpl` | ❌                                                                      |
| Default    | unset                                                                   |

---

### `dependencies.valkey.operator.securityContext.appArmorProfile`

AppArmor profile of the container.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.appArmorProfile` |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.valkey.operator.securityContext.capabilities`

Linux capabilities added to or dropped from the container.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.capabilities` |
| Type       | `map`                                                       |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `dependencies.valkey.operator.securityContext.privileged`

Whether the container runs in privileged mode.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.privileged` |
| Type       | `boolean`                                                 |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `dependencies.valkey.operator.securityContext.procMount`

Type of the proc mount of the container.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.procMount` |
| Type       | `string`                                                 |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |
| Enum       | `Default`, `Unmasked`                                    |

---

### `dependencies.valkey.operator.securityContext.readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only.

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.readOnlyRootFilesystem` |
| Type       | `boolean`                                                             |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |

---

### `dependencies.valkey.operator.securityContext.runAsGroup`

Group ID of the first process of the container.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.runAsGroup` |
| Type       | `integer`                                                 |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `dependencies.valkey.operator.securityContext.runAsNonRoot`

Whether the container must run as a non-root user.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.runAsNonRoot` |
| Type       | `boolean`                                                   |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `dependencies.valkey.operator.securityContext.runAsUser`

User ID of the first process of the container.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.runAsUser` |
| Type       | `integer`                                                |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `dependencies.valkey.operator.securityContext.seLinuxOptions`

SELinux options of the container.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.seLinuxOptions` |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.valkey.operator.securityContext.seccompProfile`

Seccomp profile of the container.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.seccompProfile` |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.valkey.operator.securityContext.windowsOptions`

Windows specific options of the container.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.securityContext.windowsOptions` |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---
