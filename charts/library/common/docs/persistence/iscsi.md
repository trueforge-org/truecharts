---
title: iSCSI
---

:::note

- See the [Full Examples](/truecharts-common/persistence/iscsi#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: iscsi`.

:::

## Appears in

- `.Values.persistence.$name`

---

## `iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `iscsi` |

---

## `fsType`

File system of the volume, eg `ext4`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.fsType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `iscsi` |

---

## `targetPortal`

Portal of the target, as `host:port`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetPortal` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `iscsi` |

---

## `iqn`

iSCSI qualified name of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iqn` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `iscsi` |

---

## `lun`

LUN number of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.lun` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `iscsi` |

---

## `initiatorName`

iSCSI initiator name of the node.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.initiatorName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `iscsi` |

---

## `iscsiInterface`

iSCSI interface of the node, eg `default`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsiInterface` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `iscsi` |

---

## `portals`

Additional portals of the target, as `host:port`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.portals` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Applies to | `iscsi` |

---

## Full Examples

Authentication is configured with `authSession` or `authDiscovery`, see [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig).

### With templates

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    mountPath: /data
    iscsi:
      fsType: "{{ .Values.some_fsType }}"
      targetPortal: "{{ .Values.some_targetPortal }}"
      iqn: "{{ .Values.some_iqn }}"
      lun: "{{ .Values.some_lun }}"
      initiatorName: "{{ .Values.some_initiatorName }}"
      iscsiInterface: "{{ .Values.some_interface }}"
      portals:
        - '{{ index .Values.some_portals 0 }}'
        - '{{ index .Values.some_portals 1 }}'
      authSession:
        username: "{{ .Values.username }}"
        password: "{{ .Values.password }}"
        usernameInitiator: '{{ printf "%s%s" .Values.username "Initiator" }}'
        passwordInitiator: '{{ printf "%s%s" .Values.password "Initiator" }}'
```

### With values

```yaml
persistence:
  iscsi-vol:
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
    targetSelector:
      workload-name:
        container-name:
          mountPath: /data
```
