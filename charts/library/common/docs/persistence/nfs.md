---
title: Nfs
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/nfs#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.nfs`

---

## `persistence.nfs`

Configuration for `persistence` entries with `type: nfs`.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `persistence.nfs` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `persistence.nfs.path`

No description provided.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `persistence.nfs.path` |
| Type       | `string`               |
| Required   | ✅                     |
| Helm `tpl` | ❌                     |
| Default    | `""`                   |
| Min Length | `1`                    |

Example

```yaml
persistence:
  nfs:
    path: ""
```

---

### `persistence.nfs.server`

No description provided.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `persistence.nfs.server` |
| Type       | `string`                 |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Default    | `""`                     |
| Min Length | `1`                      |

Example

```yaml
persistence:
  nfs:
    server: ""
```

---

## Full Examples

```yaml
persistence:
  nfs-vol:
    enabled: true
    type: nfs
    path: /path/of/nfs/share
    server: nfs-server
```
