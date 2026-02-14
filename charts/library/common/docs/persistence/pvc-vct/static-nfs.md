---
title: Static Nfs
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/pvc-vct/static-nfs#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.pvc-vct.static-nfs`

---

## `persistence.pvc-vct.static-nfs`

Static provisioning settings for PVC/VCT in `nfs` mode.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.pvc-vct.static-nfs` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `persistence.pvc-vct.static-nfs.server`

No description provided.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `persistence.pvc-vct.static-nfs.server` |
| Type       | `string`                                |
| Required   | ✅                                      |
| Helm `tpl` | ❌                                      |
| Default    | `""`                                    |
| Min Length | `1`                                     |

Example

```yaml
persistence:
  pvc-vct:
    static-nfs:
      server: ""
```

---

### `persistence.pvc-vct.static-nfs.share`

No description provided.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `persistence.pvc-vct.static-nfs.share` |
| Type       | `string`                               |
| Required   | ✅                                     |
| Helm `tpl` | ❌                                     |
| Default    | `""`                                   |
| Min Length | `1`                                    |

Example

```yaml
persistence:
  pvc-vct:
    static-nfs:
      share: ""
```

---

## Full Examples

```yaml
persistence:
  nfs-vol:
    type: pvc
    static:
      mode: nfs
      server: /server
      share: share
```
