---
title: Persistence
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence`

---

## `persistence`

Define persistence objects

| Field      | Value         |
| ---------- | ------------- |
| Key        | `persistence` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | unset         |

---

### `persistence.$name.accessModes`

Define the accessModes of the PVC, if it's single can be defined as a string, multiple as a list

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `persistence.$name.accessModes` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `persistence.$name.annotations`

Additional annotations for persistence

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `persistence.$name.annotations` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `persistence.$name.dataSource`

Define dataSource for the pvc

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `persistence.$name.dataSource` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `persistence.$name.defaultMode`

Define the defaultMode (must be a string in format of "0777").

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `persistence.$name.defaultMode` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `persistence.$name.enabled`

Enables or Disables the persistence

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `persistence.$name.enabled` |
| Type       | `boolean, string`           |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `false`                     |

Example

```yaml
persistence:
  $name:
    enabled: false
```

---

### `persistence.$name.existingClaim`

Define an existing claim to use

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `persistence.$name.existingClaim` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `persistence.$name.expandObjectName`

Whether to expand (adding the fullname as prefix) the secret name.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `persistence.$name.expandObjectName` |
| Type       | `boolean`                            |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `persistence.$name.fsType`

Define the fsType

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `persistence.$name.fsType` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `persistence.$name.hostPath`

Define the hostPath

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `persistence.$name.hostPath` |
| Type       | `string`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `persistence.$name.hostPathType`

Define the hostPathType

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.$name.hostPathType` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `persistence.$name.initiatorName`

Define the initiatorName

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `persistence.$name.initiatorName` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `persistence.$name.iqn`

Define the iqn

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `persistence.$name.iqn` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `persistence.$name.iscsi`

Define the iSCSI

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `persistence.$name.iscsi` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `persistence.$name.iscsiInterface`

Define the iscsiInterface

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `persistence.$name.iscsiInterface` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `persistence.$name.items`

Define a list of items for secret.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `persistence.$name.items` |
| Type       | `list of map`             |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `persistence.$name.labels`

Additional labels for persistence

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `persistence.$name.labels` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `persistence.$name.lun`

Define the lun

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `persistence.$name.lun` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `persistence.$name.medium`

Define the medium of emptyDir (Memory, "")

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `persistence.$name.medium` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `persistence.$name.mountOptions`

Define mountOptions for the pvc. Available only for `static.mode: nfs|smb`

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.$name.mountOptions` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `persistence.$name.mountPath`

Define the mountPath for the persistence, applies to all containers that are selected

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `persistence.$name.mountPath` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `""`                          |
| Min Length | `1`                           |

Example

```yaml
persistence:
  $name:
    mountPath: ""
```

---

### `persistence.$name.mountPropagation`

Define the mountPropagation for the persistence, applies to all containers that are selected

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `persistence.$name.mountPropagation`       |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `""`                                       |
| Enum       | `None`, `HostToContainer`, `Bidirectional` |

Example

```yaml
persistence:
  $name:
    mountPropagation: ""
```

---

### `persistence.$name.namespace`

Define the namespace for this object

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `persistence.$name.namespace` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `persistence.$name.objectName`

Define the secret name.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `persistence.$name.objectName` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `persistence.$name.optional`

Whether the secret should be required or not.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `persistence.$name.optional` |
| Type       | `boolean`                    |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `persistence.$name.path`

Define the nfs export share path

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `persistence.$name.path` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `persistence.$name.portals`

Define the portals

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `persistence.$name.portals` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `persistence.$name.readOnly`

Define the readOnly for the persistence, applies to all containers that are selected

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `persistence.$name.readOnly` |
| Type       | `boolean`                    |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `false`                      |

Example

```yaml
persistence:
  $name:
    readOnly: false
```

---

### `persistence.$name.retain`

Define wether the to add helm annotation to retain resource on uninstall. This does not **guarantee** that the resource will be retained.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `persistence.$name.retain` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `persistence.$name.server`

Define the nfs server

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `persistence.$name.server` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `persistence.$name.size`

Define the sizeLimit of the emptyDir

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `persistence.$name.size` |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `persistence.$name.static`

Define static provisioning for the pvc

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `persistence.$name.static` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `persistence.$name.storageClass`

Define the storageClass to use - If storageClass is defined on the `persistence`

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.$name.storageClass` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `persistence.$name.subPath`

Define the subPath for the persistence, applies to all containers that are selected

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `persistence.$name.subPath` |
| Type       | `string`                    |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `""`                        |

Example

```yaml
persistence:
  $name:
    subPath: ""
```

---

### `persistence.$name.targetPortal`

Define the targetPortal

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `persistence.$name.targetPortal` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `persistence.$name.targetSelectAll`

Define wether to define this volume to all workloads and mount it on all containers

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `persistence.$name.targetSelectAll` |
| Type       | `boolean`                           |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `false`                             |

Example

```yaml
persistence:
  $name:
    targetSelectAll: false
```

---

### `persistence.$name.targetSelector`

Define a map with pod and containers to mount

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `persistence.$name.targetSelector` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `{}`                               |

Example

```yaml
persistence:
  $name:
    targetSelector:
      {}
```

---

### `persistence.$name.type`

Define the persistence type

| Field      | Value                                                                                 |
| ---------- | ------------------------------------------------------------------------------------- |
| Key        | `persistence.$name.type`                                                              |
| Type       | `string`                                                                              |
| Required   | ❌                                                                                    |
| Helm `tpl` | ❌                                                                                    |
| Default    | unset                                                                                 |
| Enum       | `pvc`, `hostPath`, `emptyDir`, `nfs`, `iscsi`, `device`, `configmap`, `secret`, `vct` |

---

### `persistence.$name.volumeName`

Define the volumeName of a PV, backing the claim

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `persistence.$name.volumeName` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `persistence.$name.volumeSnapshots`

Define volumeSnapshots for the pvc

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `persistence.$name.volumeSnapshots` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `persistence.crontab`

Define persistence objects

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `persistence.crontab` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `persistence.devshm`

Define persistence objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `persistence.devshm` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `persistence.shared`

Define persistence objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `persistence.shared` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `persistence.tmp`

Define persistence objects

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `persistence.tmp` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `persistence.varlogs`

Define persistence objects

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `persistence.varlogs` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `persistence.varrun`

Define persistence objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `persistence.varrun` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

## Child Pages

- [Configmap](configmap.md) - Create Configmap objects
- [Device](device.md) - Configuration for `persistence` entries with `type: device`.
- [Emptydir](emptyDir.md) - Configuration for `persistence` entries with `type: emptyDir`.
- [Hostpath](hostPath.md) - Configuration for `persistence` entries with `type: hostPath`.
- [Iscsi](iscsi.md) - Configuration for `persistence` entries with `type: iscsi`.
- [Nfs](nfs.md) - Configuration for `persistence` entries with `type: nfs`.
- [Pvc Vct](pvc-vct/) - Configuration for `persistence` entries with `type: pvc` or `type: vct`.
- [Secret](secret.md) - Create Secret objects

---

## Full Examples

Full examples can be found under each persistence type

- [hostPath](/truecharts-common/persistence/hostpath)
- [configmap](/truecharts-common/persistence/configmap)
- [secret](/truecharts-common/persistence/secret)
- [device](/truecharts-common/persistence/device)
- [pvc](/truecharts-common/persistence/pvc-vct)
- [vct](/truecharts-common/persistence/pvc-vct)
- [nfs](/truecharts-common/persistence/nfs)
- [emptyDir](/truecharts-common/persistence/emptydir)
- [iscsi](/truecharts-common/persistence/iscsi)
