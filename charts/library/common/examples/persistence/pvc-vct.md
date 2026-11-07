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
