## Full Examples

### From an existing VolumeSnapshotContent

```yaml
volumeSnapshots:
  example1:
    enabled: true
    source:
      volumeSnapshotContentName: some-name
```

### From a PersistentVolumeClaim

```yaml
volumeSnapshots:
  example2:
    enabled: true
    source:
      persistentVolumeClaimName: some-pvc-name
```

### With a class

`volumeSnapshotClassName` selects the VolumeSnapshotClass. The class can be created by the chart too, see [Volume Snapshot Class](/truecharts-common/volumeSnapshotClass):

```yaml
volumeSnapshotClass:
  csi-class:
    enabled: true
    driver: csi-hostpath-snapshots
    deletionPolicy: Delete

volumeSnapshots:
  example3:
    enabled: true
    namespace: some-namespace
    volumeSnapshotClassName: csi-class
    labels:
      key: value
    annotations:
      key: value
    source:
      persistentVolumeClaimName: some-pvc-name
```
