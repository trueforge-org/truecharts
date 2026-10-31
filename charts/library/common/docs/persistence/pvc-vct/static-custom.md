---
title: Static Custom
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/pvc-vct/static-custom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.pvc-vct.static-custom`

---

## `persistence.pvc-vct.static-custom`

Static provisioning settings for PVC/VCT in `custom` mode.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `persistence.pvc-vct.static-custom` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `persistence.pvc-vct.static-custom.driver`

No description provided.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `persistence.pvc-vct.static-custom.driver` |
| Type       | `string`                                   |
| Required   | ✅                                         |
| Helm `tpl` | ❌                                         |
| Default    | `""`                                       |
| Min Length | `1`                                        |

Example

```yaml
persistence:
  pvc-vct:
    static-custom:
      driver: ""
```

---

### `persistence.pvc-vct.static-custom.provisioner`

No description provided.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `persistence.pvc-vct.static-custom.provisioner` |
| Type       | `string`                                        |
| Required   | ✅                                              |
| Helm `tpl` | ❌                                              |
| Default    | `""`                                            |
| Min Length | `1`                                             |

Example

```yaml
persistence:
  pvc-vct:
    static-custom:
      provisioner: ""
```

---

## Full Examples

```yaml
persistence:
  smb-vol:
    type: pvc
    static:
      mode: custom
      driver: some-driver
      provisioner: some-provisioner
```
