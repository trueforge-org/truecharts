## Full Examples

### Basic StorageClass

```yaml
storageClass:
  example:
    enabled: true
    provisioner: some.provisioner.io
    parameters:
      param1: value1
      param2: value2
    reclaimPolicy: Retain
    allowVolumeExpansion: true
    volumeBindingMode: Immediate
    mountOptions:
      - option1
      - option2=value
```

### Default class that binds late

`WaitForFirstConsumer` delays the volume until a pod uses it, so it is created on the right node:

```yaml
storageClass:
  local:
    enabled: true
    provisioner: rancher.io/local-path
    isDefault: true
    reclaimPolicy: Delete
    volumeBindingMode: WaitForFirstConsumer
    labels:
      key: value
    annotations:
      key: value
```

### Parameters and use

Parameters can be numbers and booleans. A volume selects the class by name:

```yaml
storageClass:
  nfs:
    enabled: true
    provisioner: nfs.csi.k8s.io
    parameters:
      server: nfs.example.com
      share: /exports
      mountPermissions: 0
      subDir: data
    mountOptions:
      - nfsvers=4.1

persistence:
  config:
    enabled: true
    type: pvc
    storageClass: nfs
    size: 10Gi
    mountPath: /config
```
