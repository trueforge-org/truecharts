---
title: Device
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/device#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.device`

---

## `persistence.device`

Configuration for `persistence` entries with `type: device`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `persistence.device` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `persistence.device.hostPath`

No description provided.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `persistence.device.hostPath` |
| Type       | `string`                      |
| Required   | ✅                            |
| Helm `tpl` | ❌                            |
| Default    | `""`                          |
| Min Length | `1`                           |

Example

```yaml
persistence:
  device:
    hostPath: ""
```

---

## Full Examples

```yaml
persistence:
  dev-vol:
    enabled: true
    type: device
    hostPath: /path/to/host
    hostPathType: BlockDevice
```
