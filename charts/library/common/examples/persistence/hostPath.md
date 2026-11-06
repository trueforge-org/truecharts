## Full Examples

### Create the directory

```yaml
persistence:
  hostpath-vol:
    enabled: true
    type: hostPath
    mountPath: /path
    hostPath: /path/to/host
    hostPathType: DirectoryOrCreate
```

### Read only file

```yaml
persistence:
  hostpath-file:
    enabled: true
    type: hostPath
    hostPath: /etc/localtime
    hostPathType: File
    targetSelector:
      workload-name:
        container-name:
          mountPath: /etc/localtime
          readOnly: true
```
