## Full Examples

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
    dataSource:
      kind: "PersistentVolumeClaim"
      name: "existingPVC"
    accessModes: ReadWriteOnce
    volumeName: volume-name-backing-the-pvc
    existingClaim: existing-claim-name
    retain: true
    size: 2Gi
    mountOptions:
      - key: some-key
        value: some-value
    # static:
    #   mode: custom
    #   provisioner: provisioner
    #   driver: driver
    #   csi:
    #     key: value
    volumeSnapshots:
      - name: example1
        enabled: true
        labels:
          label1: value1
        annotations:
          annotation1: value1
        volumeSnapshotClassName: some-name
    # targetSelectAll: true
    targetSelector:
      pod-name:
        container-name:
          mountPath: /path/to/mount
```
