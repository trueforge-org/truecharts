## Full Examples

### Block device

```yaml
persistence:
  dev-vol:
    enabled: true
    type: device
    hostPath: /dev/sda
    hostPathType: BlockDevice
    mountPath: /dev/sda
```

### Character device

```yaml
persistence:
  gpu:
    enabled: true
    type: device
    hostPath: /dev/dri
    hostPathType: CharDevice
    targetSelector:
      workload-name:
        container-name:
          mountPath: /dev/dri
```
