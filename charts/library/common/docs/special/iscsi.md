---
title: Iscsi
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/special/iscsi#full-examples) section for complete examples.

:::

## Appears in

- `.Values.special.iscsi`

---

## `special.iscsi`

Settings of the iSCSI target, for `type: iscsi`.

| Field      | Value           |
| ---------- | --------------- |
| Key        | `special.iscsi` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

---

### `special.iscsi.authDiscovery`

CHAP authentication of the discovery session.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `special.iscsi.authDiscovery` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `special.iscsi.authSession`

CHAP authentication of the iSCSI session.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `special.iscsi.authSession` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `special.iscsi.fsType`

File system of the volume, eg `ext4`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `special.iscsi.fsType` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `special.iscsi.initiatorName`

iSCSI initiator name of the node.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `special.iscsi.initiatorName` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `special.iscsi.iqn`

iSCSI qualified name of the target.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `special.iscsi.iqn` |
| Type       | `string`            |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `special.iscsi.iscsiInterface`

iSCSI interface of the node, eg `default`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `special.iscsi.iscsiInterface` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `special.iscsi.lun`

LUN number of the target.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `special.iscsi.lun` |
| Type       | `integer, string`   |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `special.iscsi.portals`

Additional portals of the target, as `host:port`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `special.iscsi.portals` |
| Type       | `list of string`        |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `special.iscsi.targetPortal`

Portal of the target, as `host:port`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `special.iscsi.targetPortal` |
| Type       | `string`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---
