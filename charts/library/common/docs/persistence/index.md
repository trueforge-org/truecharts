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

- [autoPermissions](/truecharts-common/persistence/autoPermissions)
- [ConfigMap](/truecharts-common/persistence/configmap)
- [Device](/truecharts-common/persistence/device)
- [devshm](/truecharts-common/persistence/devshm)
- [EmptyDir](/truecharts-common/persistence/emptyDir)
- [HostPath](/truecharts-common/persistence/hostPath)
- [iSCSI](/truecharts-common/persistence/iscsi)
- [iSCSI Authentication](/truecharts-common/persistence/iscsiConfig)
- [NFS](/truecharts-common/persistence/nfs)
- [projected](/truecharts-common/persistence/projected)
- [PVC and VCT](/truecharts-common/persistence/pvc-vct)
- [Secret](/truecharts-common/persistence/secret)
- [sources](/truecharts-common/persistence/sources)
- [targetSelector](/truecharts-common/persistence/targetSelector)
- [tmp](/truecharts-common/persistence/tmp)
- [varlogs](/truecharts-common/persistence/varlogs)
- [varrun](/truecharts-common/persistence/varrun)
- [volsync](/truecharts-common/persistence/volsync)

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

See [varlogs](/truecharts-common/persistence/varlogs) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.varlogs` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `varrun`

Built-in in-memory `emptyDir` volume mounted at `/var/run` in all containers of all workloads, for PID files and sockets. Enabled by default.

See [varrun](/truecharts-common/persistence/varrun) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.varrun` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tmp`

Built-in in-memory `emptyDir` volume mounted at `/tmp` in all containers of all workloads, as scratch space while the root filesystem is read-only. Enabled by default.

See [tmp](/truecharts-common/persistence/tmp) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.tmp` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `devshm`

Built-in in-memory `emptyDir` volume mounted at `/dev/shm` in all containers of all workloads, for shared memory. Enabled by default.

See [devshm](/truecharts-common/persistence/devshm) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.devshm` |
| Type | `map` |
| Required | ❌ |
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

See [targetSelector](/truecharts-common/persistence/targetSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.targetSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

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

## `$name.autoPermissions`

Set the ownership and mode of the volume with an init container before the app starts.

See [autoPermissions](/truecharts-common/persistence/autoPermissions) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.volsync`

VolSync backups and restores of this PVC. Only for `type: pvc` and `type: vct`.

See [volsync](/truecharts-common/persistence/volsync) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sources`

Sources of a projected volume. Only for `type: projected`.

See [sources](/truecharts-common/persistence/sources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources` |
| Type | `list of map` |
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

## Internal Common Keys

:::warning

These keys are only for the internal use of common. Do not use them in charts that are based on common: they can change or be removed at any time, without a breaking change.

:::

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
