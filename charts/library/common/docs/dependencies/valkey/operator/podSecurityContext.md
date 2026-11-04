---
title: Podsecuritycontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/podSecurityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.podSecurityContext`

---

## `dependencies.valkey.operator.podSecurityContext`

No description provided.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `dependencies.valkey.operator.podSecurityContext.appArmorProfile`

AppArmor profile of the containers of the pod.

| Field      | Value                                                             |
| ---------- | ----------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.appArmorProfile` |
| Type       | `map`                                                             |
| Required   | ❌                                                                |
| Helm `tpl` | ❌                                                                |
| Default    | unset                                                             |

---

### `dependencies.valkey.operator.podSecurityContext.fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.fsGroup` |
| Type       | `integer`                                                 |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `dependencies.valkey.operator.podSecurityContext.fsGroupChangePolicy`

Whether the ownership of the volumes is changed on mount.

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.fsGroupChangePolicy` |
| Type       | `string`                                                              |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |
| Enum       | `OnRootMismatch`, `Always`                                            |

---

### `dependencies.valkey.operator.podSecurityContext.runAsGroup`

Group ID of the first process of the containers of the pod.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.podSecurityContext.runAsGroup` |
| Type       | `integer`                                                    |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `dependencies.valkey.operator.podSecurityContext.runAsNonRoot`

Whether the containers of the pod must run as a non-root user.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.runAsNonRoot` |
| Type       | `boolean`                                                      |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.valkey.operator.podSecurityContext.runAsUser`

User ID of the first process of the containers of the pod.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.runAsUser` |
| Type       | `integer`                                                   |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `dependencies.valkey.operator.podSecurityContext.seLinuxChangePolicy`

How the SELinux labels of the volumes are changed.

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.seLinuxChangePolicy` |
| Type       | `string`                                                              |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |
| Enum       | `Recursive`, `MountOption`                                            |

---

### `dependencies.valkey.operator.podSecurityContext.seLinuxOptions`

SELinux options of the containers of the pod.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.seLinuxOptions` |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.valkey.operator.podSecurityContext.seccompProfile`

Seccomp profile of the containers of the pod.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.seccompProfile` |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.valkey.operator.podSecurityContext.supplementalGroups`

Additional group IDs of the containers of the pod.

| Field      | Value                                                                |
| ---------- | -------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.supplementalGroups` |
| Type       | `list of integer`                                                    |
| Required   | ❌                                                                   |
| Helm `tpl` | ❌                                                                   |
| Default    | unset                                                                |

---

### `dependencies.valkey.operator.podSecurityContext.supplementalGroupsPolicy`

How the supplemental groups are computed, with the groups of the image.

| Field      | Value                                                                      |
| ---------- | -------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.supplementalGroupsPolicy` |
| Type       | `string`                                                                   |
| Required   | ❌                                                                         |
| Helm `tpl` | ❌                                                                         |
| Default    | unset                                                                      |
| Enum       | `Merge`, `Strict`                                                          |

---

### `dependencies.valkey.operator.podSecurityContext.sysctls`

Namespaced sysctls set for the pod.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.sysctls` |
| Type       | `list of map`                                             |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `dependencies.valkey.operator.podSecurityContext.windowsOptions`

Windows specific options of the pod.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext.windowsOptions` |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---
