---
title: Iscsi
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/iscsi#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.iscsi`

---

## `persistence.iscsi`

Configuration for `persistence` entries with `type: iscsi`.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `persistence.iscsi` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `persistence.iscsi.iqn`

No description provided.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `persistence.iscsi.iqn` |
| Type       | `string`                |
| Required   | ✅                      |
| Helm `tpl` | ❌                      |
| Default    | `""`                    |
| Min Length | `1`                     |

Example

```yaml
persistence:
  iscsi:
    iqn: ""
```

---

### `persistence.iscsi.iscsi`

No description provided.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `persistence.iscsi.iscsi` |
| Type       | `map`                     |
| Required   | ✅                        |
| Helm `tpl` | ❌                        |
| Default    | `{}`                      |

Example

```yaml
persistence:
  iscsi:
    iscsi:
      {}
```

---

### `persistence.iscsi.lun`

No description provided.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `persistence.iscsi.lun` |
| Type       | `integer, string`       |
| Required   | ✅                      |
| Helm `tpl` | ❌                      |
| Default    | `""`                    |
| Minimum    | `1`                     |

Example

```yaml
persistence:
  iscsi:
    lun: ""
```

---

### `persistence.iscsi.targetPortal`

No description provided.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.iscsi.targetPortal` |
| Type       | `string`                         |
| Required   | ✅                               |
| Helm `tpl` | ❌                               |
| Default    | `""`                             |
| Min Length | `1`                              |

Example

```yaml
persistence:
  iscsi:
    targetPortal: ""
```

---

## Full Examples

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    iscsi:
      fsType: "{{ .Values.some_fsType }}"
      targetPortal: "{{ .Values.some_targetPortal }}"
      iqn: "{{ .Values.some_iqn }}"
      lun: "{{ .Values.some_lun }}"
      initiatorName: "{{ .Values.some_initiatorName }}"
      iscsiInterface: "{{ .Values.some_interface }}"
      portals:
        - "{{ index .Values.some_portals 0 }}"
        - "{{ index .Values.some_portals 1 }}"
      authSession:
        username: "{{ .Values.username }}"
        password: "{{ .Values.password }}"
        usernameInitiator: '{{ printf "%s%s" .Values.username "Initiator" }}'
        passwordInitiator: '{{ printf "%s%s" .Values.password "Initiator" }}'
  iscsi-vol2:
    enabled: true
    type: iscsi
    iscsi:
      fsType: ext4
      targetPortal: some.target.portal
      iqn: some.iqn
      lun: 0
      initiatorName: some.initiator.name
      iscsiInterface: some.interface
      portals:
        - some.portal.1
        - some.portal.2
      authDiscovery:
        username: some.username
        password: some.password
        usernameInitiator: some.usernameInitiator
        passwordInitiator: some.passwordInitiator
```
