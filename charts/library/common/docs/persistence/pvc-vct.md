---
title: PVC and VCT
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/pvc-vct#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: pvc or vct`.

:::

## Appears in

- `.Values.persistence.$name`

---

## `size`

Size limit of the `emptyDir`, as a quantity. Only for `type: emptyDir`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.size` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `emptyDir`, `pvc`, `vct` |

Example

```yaml
persistence:
  example:
    size: 1Gi
```

---

## `labels`

Additional labels of the PVC. Only for `type: pvc` and `type: vct`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `annotations`

Additional annotations of the PVC. Only for `type: pvc` and `type: vct`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `namespace`

Namespace of the object. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `retain`

Add the Helm `helm.sh/resource-policy: keep` annotation, so Helm keeps the PVC on uninstall. This does not **guarantee** that the PVC is retained.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.retain` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `accessModes`

Access modes of the PVC, for example `ReadWriteOnce`. A single mode can be a string, multiple modes a list.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.accessModes` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeName`

Name of an existing PersistentVolume the claim binds to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `existingClaim`

Name of an existing PVC to use, instead of creating one.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.existingClaim` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `storageClass`

StorageClass of the PVC. When unset, `global.fallbackDefaults.storageClass` is used, and when that is unset too, the default StorageClass of the cluster.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.storageClass` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `dataSource`

Data source the PVC is populated from, for example a VolumeSnapshot.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.dataSource` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `dataSource.name`

Name of the data source.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.dataSource.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dataSource.kind`

Kind of the data source, for example `VolumeSnapshot`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.dataSource.kind` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static`

Static provisioning of the PVC with a PersistentVolume that is created by common.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `static.mode`

Kind of PersistentVolume to create: `nfs`, `smb` or `custom`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.mode` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.server`

Hostname or IP of the NFS or SMB server.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.server` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
persistence:
  example:
    static:
      server: 192.168.1.10
```

---

## `static.share`

Path (NFS) or name (SMB) of the share on the server.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.share` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
persistence:
  example:
    static:
      share: /exports/data
```

---

## `static.username`

Username for the SMB share.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.username` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.user`

User for the SMB share.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.user` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.password`

Password for the SMB share.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.password` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.domain`

Domain of the SMB share.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.domain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.driver`

CSI driver of the PersistentVolume. Only for `mode: custom`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.driver` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.provisioner`

Provisioner annotation of the PersistentVolume. Only for `mode: custom`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.provisioner` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `static.volumeHandle`

Handle of the volume in the CSI driver. Defaults to the name of the PersistentVolume. Only for `mode: custom`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.volumeHandle` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `static.volumeAttributes`

Attributes of the volume that are passed to the CSI driver. Supports Helm `tpl` on values. Only for `mode: custom`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.volumeAttributes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `static.volumeAttributes.$name`

Value of the attribute.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.static.volumeAttributes.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mountOptions`

Mount options of the PersistentVolume. Only for `static.mode: nfs` and `static.mode: smb`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.mountOptions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `mountOptions[]`

A mount option of the PersistentVolume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.mountOptions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `mountOptions[].value`

Value of the mount option. Leave empty for an option without a value.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.mountOptions[].value` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `mountOptions[].key`

Name of the mount option, eg `nfsvers`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.mountOptions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeSnapshots`

VolumeSnapshots of the PVC that are created by the chart.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeSnapshots[]`

A VolumeSnapshot of the PVC.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `volumeSnapshots[].volumeSnapshotClassName`

VolumeSnapshotClass of the snapshot. Defaults to `global.fallbackDefaults.volumeSnapshotClass`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots[].volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeSnapshots[].name`

Name of the VolumeSnapshot, appended to the name of the PVC.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeSnapshots[].enabled`

Create this VolumeSnapshot.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots[].enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeSnapshots[].labels`

Additional labels of the VolumeSnapshot.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots[].labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## `volumeSnapshots[].annotations`

Additional annotations of the VolumeSnapshot.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volumeSnapshots[].annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |
| Applies to | `pvc`, `vct` |

---

## Full Examples

`type: pvc` creates a PersistentVolumeClaim. `type: vct` renders a `volumeClaimTemplate` of a StatefulSet and takes the same options.

### PVC

```yaml
persistence:
  pvc-vol:
    enabled: true
    type: pvc
    namespace: some-namespace
    labels:
      label1: value1
    annotations:
      annotation1: value1
    accessModes: ReadWriteOnce
    size: 2Gi
    storageClass: some-storage-class
    retain: true
    targetSelector:
      workload-name:
        container-name:
          mountPath: /path/to/mount
```

### Existing claim and volume

```yaml
persistence:
  existing-claim:
    enabled: true
    type: pvc
    existingClaim: existing-claim-name
    mountPath: /data
  existing-volume:
    enabled: true
    type: pvc
    volumeName: volume-name-backing-the-pvc
    accessModes:
      - ReadWriteOnce
      - ReadWriteMany
    size: 10Gi
    mountPath: /data2
```

### Data source

```yaml
persistence:
  pvc-clone:
    enabled: true
    type: pvc
    size: 2Gi
    dataSource:
      kind: PersistentVolumeClaim
      name: existingPVC
    mountPath: /data
```

### VCT

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: StatefulSet
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image

persistence:
  vct-vol:
    enabled: true
    type: vct
    size: 5Gi
    accessModes: ReadWriteOnce
    storageClass: some-storage-class
    targetSelector:
      workload-name:
        container-name:
          mountPath: /data
```

### Static NFS

The `static` modes create the PersistentVolume for the claim. `mountOptions` applies to the `nfs` and `smb` modes.

```yaml
persistence:
  nfs-vol:
    enabled: true
    type: pvc
    size: 100Gi
    accessModes: ReadWriteMany
    static:
      mode: nfs
      server: nfs-server
      share: /path/of/nfs/share
    mountOptions:
      - key: nfsvers
        value: "4.1"
      - key: hard
    mountPath: /data
```

### Static SMB

```yaml
persistence:
  smb-vol:
    enabled: true
    type: pvc
    size: 100Gi
    accessModes: ReadWriteMany
    static:
      mode: smb
      server: smb-server
      share: share
      user: "{{ .Values.smbUser }}"
      password: "{{ .Values.smbPassword }}"
      domain: domain
    mountOptions:
      - key: dir_mode
        value: "0777"
      - key: file_mode
        value: "0777"
    mountPath: /data
```

### Static custom

```yaml
persistence:
  custom-vol:
    enabled: true
    type: pvc
    size: 10Gi
    static:
      mode: custom
      driver: some-driver
      provisioner: some-provisioner
      volumeHandle: some-volume
      volumeAttributes:
        some-attribute: some-value
    mountPath: /data
```

### Volume snapshots

```yaml
persistence:
  pvc-vol:
    enabled: true
    type: pvc
    size: 2Gi
    mountPath: /data
    volumeSnapshots:
      - name: example1
        enabled: true
        labels:
          label1: value1
        annotations:
          annotation1: value1
        volumeSnapshotClassName: some-name
```

### VolSync

Back up a PVC with VolSync. `credentials` refers to an entry of the root [credentials](/truecharts-common/credentials).

```yaml
persistence:
  backedup:
    enabled: true
    type: pvc
    size: 10Gi
    mountPath: /data
    volsync:
      - name: mybackup
        type: restic
        credentials: mys3
        copyMethod: Snapshot
        cleanupTempPVC: true
        cleanupCachePVC: true
        src:
          enabled: true
          trigger:
            schedule: "0 0 * * *"
          pruneIntervalDays: 7
          retain:
            hourly: 6
            daily: 5
            weekly: 4
            monthly: 3
            yearly: 1
          accessModes:
            - ReadWriteOnce
          storageClassName: some-storage-class
          volumeSnapshotClassName: some-snapshot-class
          cacheCapacity: 1Gi
          moverSecurityContext:
            runAsUser: 568
            runAsGroup: 568
            fsGroup: 568
        dest:
          enabled: false

credentials:
  mys3:
    type: s3
    url: https://s3.example.com
    bucket: some-bucket
    accessKey: some-access-key
    secretKey: some-secret-key
    encrKey: some-encryption-key
```

### VolSync restore

```yaml
persistence:
  restored:
    enabled: true
    type: pvc
    size: 10Gi
    mountPath: /data
    volsync:
      - name: mybackup
        type: restic
        credentials: mys3
        src:
          enabled: false
        dest:
          enabled: true
          capacity: 10Gi
          accessModes:
            - ReadWriteOnce
          storageClassName: some-storage-class
          volumeSnapshotClassName: some-snapshot-class
```
