---
title: Persistence
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence`

---

## Child Pages

- [ConfigMap](/truecharts-common/persistence/configmap)
- [Device](/truecharts-common/persistence/device)
- [EmptyDir](/truecharts-common/persistence/emptyDir)
- [HostPath](/truecharts-common/persistence/hostPath)
- [iSCSI](/truecharts-common/persistence/iscsi)
- [NFS](/truecharts-common/persistence/nfs)
- [Secret](/truecharts-common/persistence/secret)
- [PVC and VCT](/truecharts-common/persistence/pvc-vct)
- [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig)

---

## `persistence`

Volumes, keyed by name. Each one is a PVC, emptyDir, hostPath, secret, configmap or other volume type, mounted into containers. See [persistence](/truecharts-common/persistence).

| Field | Value |
| --- | --- |
| Key | `persistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `shared`

Built-in `emptyDir` volume mounted at `/shared` in all containers of all workloads, to share files between containers. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.shared` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `shared.enabled`

Create the built-in `shared` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.shared.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `shared.type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.shared.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `shared.mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/shared`.

| Field | Value |
| --- | --- |
| Key | `persistence.shared.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/shared"` |

---

## `shared.targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.shared.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `shared.iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.shared.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `varlogs`

Built-in in-memory `emptyDir` volume mounted at `/var/logs` in all containers of all workloads, so apps can write logs while the root filesystem is read-only. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `varlogs.enabled`

Create the built-in `varlogs` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `varlogs.type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `varlogs.mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/var/logs`.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/logs"` |

---

## `varlogs.medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `varlogs.targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `varlogs.iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `varrun`

Built-in in-memory `emptyDir` volume mounted at `/var/run` in all containers of all workloads, for PID files and sockets. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `varrun.enabled`

Create the built-in `varrun` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `varrun.type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `varrun.mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/var/run`.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/run"` |

---

## `varrun.medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `varrun.targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `varrun.iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tmp`

Built-in in-memory `emptyDir` volume mounted at `/tmp` in all containers of all workloads, as scratch space while the root filesystem is read-only. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tmp.enabled`

Create the built-in `tmp` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `tmp.type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `tmp.mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/tmp`.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/tmp"` |

---

## `tmp.medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `tmp.targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `tmp.iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `devshm`

Built-in in-memory `emptyDir` volume mounted at `/dev/shm` in all containers of all workloads, for shared memory. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `devshm.enabled`

Create the built-in `devshm` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `devshm.type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `devshm.mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/dev/shm`.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/dev/shm"` |

---

## `devshm.medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `devshm.targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `devshm.iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `crontab`

Built-in in-memory `emptyDir` volume mounted at `/var/spool/cron/crontabs/` in all containers of all workloads, so cron can write its crontabs. Enabled by default.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `crontab.enabled`

Create the built-in `crontab` volume. Set to `false` to remove it.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `crontab.type`

Type of the volume, `emptyDir` for the built-in volumes. See [Persistence](/truecharts-common/persistence) for the other types.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"emptyDir"` |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"` |

---

## `crontab.mountPath`

Path the volume is mounted at in the selected containers. Defaults to `/var/spool/cron/crontabs/`.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/spool/cron/crontabs/"` |

---

## `crontab.medium`

Medium of the `emptyDir`. `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Defaults to `Memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Memory"` |

---

## `crontab.targetSelectAll`

Mount the volume in all containers of all workloads. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `crontab.iscsi`

iSCSI settings, only used when `type` is `iscsi`. See [iSCSI](/truecharts-common/persistence/iscsi).

See [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.crontab.iscsi` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A volume, keyed by name. Its `type` decides which volume or claim is created and how it is mounted, see [Persistence](/truecharts-common/persistence).

| Field | Value |
| --- | --- |
| Key | `persistence.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.targetSelector`

Where the volume is mounted, as a map of workload name to a map of container name to mount settings. Defaults to the primary workload and its primary container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.targetSelector.$name`

Containers of this workload that mount the volume, keyed by container name.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.targetSelector.$name.$name`

Mount settings of this container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector.$name.$name.readOnly`

Mount the volume read-only in this container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.readOnly` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector.$name.$name.mountPath`

Path the volume is mounted at in this container.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.mountPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.targetSelector.$name.$name.mountPropagation`

Mount propagation in this container: `None`, `HostToContainer` or `Bidirectional`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.mountPropagation` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.targetSelector.$name.$name.subPath`

Path within the volume that is mounted instead of its root.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector.$name.$name.subPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.accessMode`

Legacy singular spelling of `accessModes`. Set by common-test fixtures (statefulset) but ignored by the templates, which read `accessModes`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.accessMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.copyMethod`

Define the VolSync copyMethod at item level. Set by common-test volsync fixtures, but the templates only read `copyMethod` inside `volsync` entries, so it is ignored here.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.copyMethod` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Clone"`, `"Direct"`, `"Snapshot"` |

---

## `$name.domain`

Domain of the SMB share, used by the SMB CSI driver.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.domain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.name`

Set by the chart, the name of the generated persistence resource. Do not set this manually

| Field | Value |
| --- | --- |
| Key | `persistence.$name.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.shortName`

Set by the chart, the short name of the persistence used in generated resource names. Do not set this manually

| Field | Value |
| --- | --- |
| Key | `persistence.$name.shortName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.autoPermissions`

Set the ownership and mode of the volume with an init container before the app starts.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.autoPermissions.enabled`

Run the permissions init container for this volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.autoPermissions.chown`

Change the owner of the volume to `user` and `group`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.chown` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.autoPermissions.chmod`

Mode to apply to the volume, for example `775`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.chmod` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    autoPermissions:
      chmod: '775'
```

---

## `$name.autoPermissions.recursive`

Apply the chown and chmod recursively.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.recursive` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.autoPermissions.user`

User ID to change the owner of the volume to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.user` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.autoPermissions.group`

Group ID to change the group of the volume to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.group` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync`

VolSync backups and restores of this PVC. Only for `type: pvc` and `type: vct`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[]`

A VolSync backup and restore pair.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].name`

Name of the VolSync backup, used in the names of the generated resources.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].type`

VolSync mover type, for example `restic`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"restic"` |

---

## `$name.volsync[].credentials`

Name of the entry in `credentials` that holds the backup repository settings.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].credentials` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].copyMethod`

How VolSync copies the data: `Snapshot`, `Clone` or `Direct`. Defaults to `Snapshot`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].copyMethod` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Clone"`, `"Direct"`, `"Snapshot"` |

---

## `$name.volsync[].cleanupTempPVC`

Delete the temporary PVC of the ReplicationDestination after the restore.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].cleanupTempPVC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].cleanupCachePVC`

Delete the cache PVC of the ReplicationDestination after the restore.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].cleanupCachePVC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].labels`

Additional labels for the VolSync resources

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].annotations`

Additional annotations for the VolSync resources

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].resources`

Define the resources of the VolSync mover

See [Resources](/truecharts-common/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src`

The ReplicationSource, which backs up the data.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.enabled`

Enables or Disables the VolSync source, which backs up the data

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.volsync[].src.trigger`

When the backup is triggered.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.trigger` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.trigger.schedule`

Cron schedule of the backup. Defaults to `0 0 * * *`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.trigger.schedule` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - src:
          trigger:
            schedule: 0 3 * * *
```

---

## `$name.volsync[].src.retain`

How many snapshots to keep per interval.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.retain.hourly`

Define the number of hourly snapshots to retain, defaults to 6

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.hourly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.retain.daily`

Define the number of daily snapshots to retain, defaults to 5

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.daily` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.retain.weekly`

Define the number of weekly snapshots to retain, defaults to 4

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.weekly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.retain.monthly`

Define the number of monthly snapshots to retain, defaults to 3

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.monthly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.retain.yearly`

Define the number of yearly snapshots to retain, defaults to 1

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.yearly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.pruneIntervalDays`

Days between prunes of old snapshots. Defaults to `7`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.pruneIntervalDays` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.accessModes`

Access modes of the PVC used for the source, a single mode as a string or a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.accessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.storageClassName`

Define the storageClassName of the source storage

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.storageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.volumeSnapshotClassName`

Define the volumeSnapshotClassName used for the source snapshots

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.cacheCapacity`

Size of the cache PVC, as a quantity. Defaults to `10Gi`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.cacheCapacity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - src:
          cacheCapacity: 10Gi
```

---

## `$name.volsync[].src.cacheStorageClassName`

Define the storageClassName of the cache PVC

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.cacheStorageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.cacheAccessModes`

Access modes of the cache PVC, a single mode as a string or a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.cacheAccessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext`

Pod security context of the VolSync mover pod of the source.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.appArmorProfile`

AppArmor profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.appArmorProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `$name.volsync[].src.moverSecurityContext.appArmorProfile.localhostProfile`

Name of the profile loaded on the node, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.fsGroupChangePolicy`

Whether the ownership of the volumes is changed on mount.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.fsGroupChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"OnRootMismatch"`, `"Always"` |

---

## `$name.volsync[].src.moverSecurityContext.runAsGroup`

Group ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.runAsNonRoot`

Whether the containers of the pod must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.runAsUser`

User ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seLinuxChangePolicy`

How the SELinux labels of the volumes are changed.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seLinuxChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Recursive"`, `"MountOption"` |

---

## `$name.volsync[].src.moverSecurityContext.seLinuxOptions`

SELinux options of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seccompProfile`

Seccomp profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `$name.volsync[].src.moverSecurityContext.seccompProfile.localhostProfile`

Path of the profile on the node, relative to the kubelet seccomp directory, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.supplementalGroups`

Additional group IDs of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.supplementalGroups` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.supplementalGroupsPolicy`

How the supplemental groups are computed, with the groups of the image.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.supplementalGroupsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Merge"`, `"Strict"` |

---

## `$name.volsync[].src.moverSecurityContext.sysctls`

Namespaced sysctls set for the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.sysctls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.sysctls[]`

A sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.sysctls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.sysctls[].name`

Name of the sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.sysctls[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.sysctls[].value`

Value of the sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.sysctls[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.windowsOptions`

Windows specific options of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.windowsOptions.hostProcess`

Whether the containers run as HostProcess containers, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].src.moverSecurityContext.windowsOptions.runAsUserName`

User name the first process of the containers runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest`

The ReplicationDestination, which restores the data.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.enabled`

Enables or Disables the VolSync destination, which restores the data

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.volsync[].dest.capacity`

Size of the restored volume, as a quantity.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.capacity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - dest:
          capacity: 100Gi
```

---

## `$name.volsync[].dest.accessModes`

Access modes of the restored volume, a single mode as a string or a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.accessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.storageClassName`

Define the storageClassName of the destination storage

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.storageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.volumeSnapshotClassName`

Define the volumeSnapshotClassName used for the destination snapshots

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.cacheCapacity`

Size of the cache PVC, as a quantity. Defaults to `10Gi`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheCapacity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - dest:
          cacheCapacity: 10Gi
```

---

## `$name.volsync[].dest.cacheStorageClassName`

Define the storageClassName of the cache PVC

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheStorageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.cacheAccessModes`

Access modes of the cache PVC, a single mode as a string or a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.cacheAccessModes` |
| Type | `list of string or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext`

Pod security context of the VolSync mover pod of the destination.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.appArmorProfile`

AppArmor profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.appArmorProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `$name.volsync[].dest.moverSecurityContext.appArmorProfile.localhostProfile`

Name of the profile loaded on the node, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.fsGroupChangePolicy`

Whether the ownership of the volumes is changed on mount.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.fsGroupChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"OnRootMismatch"`, `"Always"` |

---

## `$name.volsync[].dest.moverSecurityContext.runAsGroup`

Group ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.runAsNonRoot`

Whether the containers of the pod must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.runAsUser`

User ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seLinuxChangePolicy`

How the SELinux labels of the volumes are changed.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Recursive"`, `"MountOption"` |

---

## `$name.volsync[].dest.moverSecurityContext.seLinuxOptions`

SELinux options of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seccompProfile`

Seccomp profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `$name.volsync[].dest.moverSecurityContext.seccompProfile.localhostProfile`

Path of the profile on the node, relative to the kubelet seccomp directory, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.supplementalGroups`

Additional group IDs of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.supplementalGroups` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.supplementalGroupsPolicy`

How the supplemental groups are computed, with the groups of the image.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.supplementalGroupsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Merge"`, `"Strict"` |

---

## `$name.volsync[].dest.moverSecurityContext.sysctls`

Namespaced sysctls set for the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.sysctls[]`

A sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.sysctls[].name`

Name of the sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.sysctls[].value`

Value of the sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.windowsOptions`

Windows specific options of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.windowsOptions.hostProcess`

Whether the containers run as HostProcess containers, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync[].dest.moverSecurityContext.windowsOptions.runAsUserName`

User name the first process of the containers runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources`

Sources of a projected volume. Only for `type: projected`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[]`

A source of the projected volume. Set one of `serviceAccountToken`, `secret`, `configMap` or `downwardAPI`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].serviceAccountToken`

Project a ServiceAccount token.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].serviceAccountToken.audience`

Intended audience of the token. Defaults to the audience of the API server.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken.audience` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].serviceAccountToken.expirationSeconds`

Requested lifetime of the token in seconds, at least `600`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken.expirationSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 600 to … |

Example

```yaml
persistence:
  example:
    sources:
      - serviceAccountToken:
          expirationSeconds: 3600
```

---

## `$name.sources[].serviceAccountToken.path`

Path of the token file in the volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret`

Project keys of a Secret.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.objectName`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.objectName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.optional`

Allow the pod to start when the Secret does not exist.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.expandObjectName`

Prefix `objectName` with the release fullname.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.items`

Keys of the Secret to project. Without items, all keys are projected.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.items[]`

A key of the Secret and the file it is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.items[].key`

Key of the Secret.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].secret.items[].path`

Relative path of the file the key is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap`

Project keys of a ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.objectName`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.objectName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.optional`

Allow the pod to start when the ConfigMap does not exist.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.expandObjectName`

Prefix `objectName` with the release fullname.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.items`

Keys of the ConfigMap to project. Without items, all keys are projected.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.items[]`

A key of the ConfigMap and the file it is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.items[].key`

Key of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].configMap.items[].path`

Relative path of the file the key is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI`

Project fields of the pod or resources of a container as files.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items`

Fields to project.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[]`

A field of the pod or a container resource, and the file it is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].path`

Relative path of the file in the volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].fieldRef`

A field of the pod to expose.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].fieldRef.apiVersion`

API version of the field path. Defaults to `v1`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].fieldRef.fieldPath`

Path of the pod field to expose, eg `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].fieldRef.fieldPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].resourceFieldRef`

A resource of a container to expose.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].resourceFieldRef.containerName`

Name of the container the resource belongs to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].resourceFieldRef.resource`

Resource to expose, eg `limits.cpu` or `requests.memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef.resource` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources[].downwardAPI.items[].resourceFieldRef.divisor`

Unit the resource is exposed in, eg `1Mi`. Defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef.divisor` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this volume. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.type`

Type of the volume: `pvc`, `vct` (StatefulSet volume claim template), `emptyDir`, `hostPath`, `nfs`, `iscsi`, `device`, `configmap`, `secret` or `projected`. See [Persistence](/truecharts-common/persistence).

| Field | Value |
| --- | --- |
| Key | `persistence.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"pvc"`, `"hostPath"`, `"emptyDir"`, `"nfs"`, `"iscsi"`, `"device"`, `"configmap"`, `"secret"`, `"vct"`, `"projected"` |

---

## `$name.mountPath`

Path the volume is mounted at in all selected containers. Not mounted when empty.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.mountPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

Example

```yaml
persistence:
  example:
    mountPath: /config
```

---

## `$name.mountPropagation`

Mount propagation in all selected containers: `None`, `HostToContainer` or `Bidirectional`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.mountPropagation` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |
| Allowed values | `"None"`, `"HostToContainer"`, `"Bidirectional"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.subPath`

Path within the volume that is mounted instead of its root, in all selected containers.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.subPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.readOnly`

Mount the volume read-only in all selected containers.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.readOnly` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.targetSelectAll`

Mount the volume in all containers of all workloads, instead of using `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelectAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

Each type has its own page with all of its options:

- [configmap](/truecharts-common/persistence/configmap)
- [device](/truecharts-common/persistence/device)
- [emptyDir](/truecharts-common/persistence/emptyDir)
- [hostPath](/truecharts-common/persistence/hostPath)
- [iscsi](/truecharts-common/persistence/iscsi)
- [nfs](/truecharts-common/persistence/nfs)
- [secret](/truecharts-common/persistence/secret)
- [pvc and vct](/truecharts-common/persistence/pvc-vct)

### Mounting into containers

`targetSelector` mounts the volume only in the given containers. With `targetSelectAll` it is mounted in every container, using `mountPath`.

```yaml
persistence:
  config:
    enabled: true
    type: pvc
    size: 1Gi
    targetSelector:
      workload-name:
        container-name:
          mountPath: /config
          readOnly: false
        other-container-name:
          mountPath: /data/config
          subPath: config
          mountPropagation: HostToContainer
  shared-scratch:
    enabled: true
    type: emptyDir
    mountPath: /scratch
    targetSelectAll: true
```

### Built-in volumes

`shared`, `varlogs`, `varrun`, `tmp`, `devshm` and `crontab` are enabled by default. Disable or override them like any other persistence.

```yaml
persistence:
  shared:
    enabled: false
  tmp:
    enabled: true
    type: emptyDir
    medium: Memory
    mountPath: /tmp
  devshm:
    enabled: true
    type: emptyDir
    medium: Memory
    mountPath: /dev/shm
  varlogs:
    enabled: false
  varrun:
    enabled: false
  crontab:
    enabled: false
```

### Automatic permissions

```yaml
persistence:
  config:
    enabled: true
    type: pvc
    size: 1Gi
    mountPath: /config
    autoPermissions:
      enabled: true
      chown: true
      chmod: "775"
      recursive: true
      user: 568
      group: 568
```

### Projected

Combine secrets, configmaps, service account tokens and downward API fields in one volume.

```yaml
persistence:
  projected-vol:
    enabled: true
    type: projected
    mountPath: /projected
    sources:
      - secret:
          objectName: secret-name
          optional: false
          items:
            - key: key1
              path: secret/key1
      - configMap:
          objectName: configmap-name
          expandObjectName: true
          items:
            - key: key2
              path: config/key2
      - serviceAccountToken:
          audience: some-audience
          expirationSeconds: 3600
          path: token
      - downwardAPI:
          items:
            - path: labels
              fieldRef:
                fieldPath: metadata.labels
            - path: cpu-limit
              resourceFieldRef:
                containerName: container-name
                resource: limits.cpu
                divisor: 1m
```
