---
title: Volumemount
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/volumeMount#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.volumeMount`

---

## `dependencies.valkey.operator.container.volumeMount`

Volume mounted in the container.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `dependencies.valkey.operator.container.volumeMount.bindMountOptions`

Options of the bind mount.

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.bindMountOptions` |
| Type       | `list of string`                                                      |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |

---

### `dependencies.valkey.operator.container.volumeMount.mountPath`

Path in the container the volume is mounted at.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.mountPath` |
| Type       | `string`                                                       |
| Required   | ✅                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.valkey.operator.container.volumeMount.mountPropagation`

Mount propagation of the mount.

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.mountPropagation` |
| Type       | `string`                                                              |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |
| Enum       | `None`, `HostToContainer`, `Bidirectional`                            |

---

### `dependencies.valkey.operator.container.volumeMount.name`

Name of the volume to mount.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.name` |
| Type       | `string`                                                  |
| Required   | ✅                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `dependencies.valkey.operator.container.volumeMount.readOnly`

Whether the volume is mounted read-only.

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.readOnly` |
| Type       | `boolean`                                                     |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | unset                                                         |

---

### `dependencies.valkey.operator.container.volumeMount.recursiveReadOnly`

Whether the read-only mount is applied recursively to submounts.

| Field      | Value                                                                  |
| ---------- | ---------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.recursiveReadOnly` |
| Type       | `string`                                                               |
| Required   | ❌                                                                     |
| Helm `tpl` | ❌                                                                     |
| Default    | unset                                                                  |
| Enum       | `Disabled`, `IfPossible`, `Enabled`                                    |

---

### `dependencies.valkey.operator.container.volumeMount.subPath`

Path inside the volume to mount instead of its root.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.volumeMount.subPath` |
| Type       | `string`                                                     |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `dependencies.valkey.operator.container.volumeMount.subPathExpr`

Like `subPath`, but expanded from environment variables of the container. Mutually exclusive with `subPath`.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeMount.subPathExpr` |
| Type       | `string`                                                         |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---
