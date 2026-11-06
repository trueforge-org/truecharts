## Full Examples

```yaml
persistence:
  nfs-vol:
    enabled: true
    type: nfs
    path: /path/of/nfs/share
    server: nfs-server
    mountPath: /data
```

### Read only in selected containers

```yaml
persistence:
  nfs-media:
    enabled: true
    type: nfs
    path: /mnt/tank/media
    server: 10.0.0.10
    targetSelector:
      workload-name:
        container-name:
          mountPath: /media
          readOnly: true
```
