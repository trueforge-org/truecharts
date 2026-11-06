---
title: iSCSI Authentication
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/iscsiConfig#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.iscsi`
- `.Values.persistence.devshm.iscsi`
- `.Values.persistence.shared.iscsi`
- `.Values.persistence.tmp.iscsi`
- `.Values.persistence.varlogs.iscsi`
- `.Values.persistence.varrun.iscsi`

---

## `iscsi`

Settings of the iSCSI target, for `type: iscsi`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `authSession`

CHAP authentication of the iSCSI session.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authSession` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `authSession.password`

CHAP password of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authSession.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `authSession.username`

CHAP user name of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authSession.username` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `authSession.usernameInitiator`

CHAP user name of the initiator.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authSession.usernameInitiator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `authSession.passwordInitiator`

CHAP password of the initiator.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authSession.passwordInitiator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `authDiscovery`

CHAP authentication of the discovery session.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authDiscovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `authDiscovery.username`

CHAP user name of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authDiscovery.username` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `authDiscovery.password`

CHAP password of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authDiscovery.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `authDiscovery.usernameInitiator`

CHAP user name of the initiator.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authDiscovery.usernameInitiator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `authDiscovery.passwordInitiator`

CHAP password of the initiator.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.authDiscovery.passwordInitiator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `fsType`

File system of the volume, eg `ext4`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.fsType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    iscsi:
      fsType: ext4
```

---

## `targetPortal`

Portal of the target, as `host:port`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.targetPortal` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    iscsi:
      targetPortal: 10.0.0.5:3260
```

---

## `iqn`

iSCSI qualified name of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.iqn` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    iscsi:
      iqn: iqn.2001-04.com.example:storage.disk1
```

---

## `lun`

LUN number of the target.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.lun` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    iscsi:
      lun: 0
```

---

## `initiatorName`

iSCSI initiator name of the node.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.initiatorName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `iscsiInterface`

iSCSI interface of the node, eg `default`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.iscsiInterface` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `portals`

Additional portals of the target, as `host:port`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.iscsi.portals` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Session authentication

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    mountPath: /data
    iscsi:
      fsType: ext4
      targetPortal: some.target.portal
      iqn: some.iqn
      lun: 0
      authSession:
        username: some.username
        password: some.password
        usernameInitiator: some.usernameInitiator
        passwordInitiator: some.passwordInitiator
```

### Discovery authentication

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    mountPath: /data
    iscsi:
      fsType: ext4
      targetPortal: some.target.portal
      iqn: some.iqn
      lun: 1
      authDiscovery:
        username: some.username
        password: some.password
```
