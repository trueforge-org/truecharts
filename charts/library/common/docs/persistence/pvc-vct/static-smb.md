---
title: Static Smb
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/pvc-vct/static-smb#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.pvc-vct.static-smb`

---

## `persistence.pvc-vct.static-smb`

Static provisioning settings for PVC/VCT in `smb` mode.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.pvc-vct.static-smb` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `persistence.pvc-vct.static-smb.password`

No description provided.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `persistence.pvc-vct.static-smb.password` |
| Type       | `string`                                  |
| Required   | ✅                                        |
| Helm `tpl` | ❌                                        |
| Default    | `""`                                      |
| Min Length | `1`                                       |

Example

```yaml
persistence:
  pvc-vct:
    static-smb:
      password: ""
```

---

### `persistence.pvc-vct.static-smb.server`

No description provided.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `persistence.pvc-vct.static-smb.server` |
| Type       | `string`                                |
| Required   | ✅                                      |
| Helm `tpl` | ❌                                      |
| Default    | `""`                                    |
| Min Length | `1`                                     |

Example

```yaml
persistence:
  pvc-vct:
    static-smb:
      server: ""
```

---

### `persistence.pvc-vct.static-smb.share`

No description provided.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `persistence.pvc-vct.static-smb.share` |
| Type       | `string`                               |
| Required   | ✅                                     |
| Helm `tpl` | ❌                                     |
| Default    | `""`                                   |
| Min Length | `1`                                    |

Example

```yaml
persistence:
  pvc-vct:
    static-smb:
      share: ""
```

---

### `persistence.pvc-vct.static-smb.user`

No description provided.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `persistence.pvc-vct.static-smb.user` |
| Type       | `string`                              |
| Required   | ✅                                    |
| Helm `tpl` | ❌                                    |
| Default    | `""`                                  |
| Min Length | `1`                                   |

Example

```yaml
persistence:
  pvc-vct:
    static-smb:
      user: ""
```

---

## Full Examples

```yaml
persistence:
  smb-vol:
    type: pvc
    static:
      mode: smb
      user: user
      password: password
      domain: domain
      share: share
      server: /server
```
