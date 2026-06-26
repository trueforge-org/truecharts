## Full Examples

```yaml
storageClass:
  example:
    provisioner: some.provisioner.io
    enabled: true
    parameters:
      param1: value1
      param2: value2
    reclaimPolicy: retain
    allowVolumeExpansion: true
    volumeBindingMode: Immediate
    mountOptions:
      - option1
      - option2=value
```
