## Full Examples

### Default medium

```yaml
persistence:
  emptydir-vol:
    enabled: true
    type: emptyDir
    size: 2Gi
    mountPath: /cache
```

### In memory

```yaml
persistence:
  emptydir-memory:
    enabled: true
    type: emptyDir
    medium: Memory
    size: 2Gi
    targetSelector:
      workload-name:
        container-name:
          mountPath: /dev/shm
```
