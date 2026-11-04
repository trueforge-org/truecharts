---
title: Volumedevice
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/volumeDevice#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.volumeDevice`

---

## `dependencies.valkey.operator.container.volumeDevice`

Block device mapped in the container.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeDevice` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.volumeDevice.devicePath`

Path the block device is mapped to in the container.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeDevice.devicePath` |
| Type       | `string`                                                         |
| Required   | ✅                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.valkey.operator.container.volumeDevice.name`

Name of the persistent volume claim that provides the block device.

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.volumeDevice.name` |
| Type       | `string`                                                   |
| Required   | ✅                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---
