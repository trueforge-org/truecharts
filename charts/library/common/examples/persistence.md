## Full Examples

### hostPath

```yaml
persistence:
  hostpath-vol:
    enabled: true
    type: hostPath
    mountPath: /path
    hostPath: /path/to/host
    hostPathType: DirectoryOrCreate
```

### configmap

```yaml
persistence:
  configmap-vol:
    enabled: true
    type: configmap
    objectName: configmap-name
    expandObjectName: false
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
```

### secret

```yaml
persistence:
  secret-vol:
    enabled: true
    type: secret
    objectName: secret-name
    expandObjectName: false
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
```

### device

```yaml
persistence:
  dev-vol:
    enabled: true
    type: device
    hostPath: /path/to/host
    hostPathType: BlockDevice
```

### pvc and vct

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

### pvc with a static nfs share

```yaml
persistence:
  nfs-vol:
    type: pvc
    static:
      mode: nfs
      server: /server
      share: share
```

### pvc with a static smb share

```yaml
persistence:
  smb-vol:
    type: pvc
    static:
      mode: smb
      user: user
      password: password
      domain: domain
      share: share
      server: /server
```

### pvc with a custom static volume

```yaml
persistence:
  smb-vol:
    type: pvc
    static:
      mode: custom
      driver: some-driver
      provisioner: some-provisioner
```

### nfs

```yaml
persistence:
  nfs-vol:
    enabled: true
    type: nfs
    path: /path/of/nfs/share
    server: nfs-server
```

### emptyDir

```yaml
persistence:
  emptyDir-vol:
    enabled: true
    type: emptyDir
    medium: Memory
    size: 2Gi
```

### iscsi

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
