---
title: Hostpath
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/hostPath#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.hostPath`

---

## `persistence.hostPath`

Configuration for `persistence` entries with `type: hostPath`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `persistence.hostPath` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `persistence.hostPath.hostPath`

No description provided.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `persistence.hostPath.hostPath` |
| Type       | `string`                        |
| Required   | ✅                              |
| Helm `tpl` | ❌                              |
| Default    | `""`                            |
| Min Length | `1`                             |

Example

```yaml
persistence:
  hostPath:
    hostPath: ""
```

---

## Full Examples

```yaml
persistence:
  hostpath-vol:
    enabled: true
    type: hostPath
    mountPath: /path
    hostPath: /path/to/host
    hostPathType: DirectoryOrCreate
```
