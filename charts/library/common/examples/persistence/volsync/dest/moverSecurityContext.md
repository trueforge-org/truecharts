## Full Examples

### Run the mover as the app user

```yaml
persistence:
  data:
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
          moverSecurityContext:
            runAsUser: 568
            runAsGroup: 568
            fsGroup: 568
```

### Hardened mover

```yaml
persistence:
  data:
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
          moverSecurityContext:
            runAsNonRoot: true
            runAsUser: 1000
            runAsGroup: 1000
            fsGroup: 1000
            fsGroupChangePolicy: OnRootMismatch
            seccompProfile:
              type: RuntimeDefault
            supplementalGroups:
              - 44
```
