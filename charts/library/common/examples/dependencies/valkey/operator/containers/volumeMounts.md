## Full Examples

The schema of `operator` has no `volumes` key, so a container can only mount a volume that the pods created by the valkey operator already have. Look up the name of that volume in those pods: `data` below is only a placeholder.

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: backup
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          volumeMounts:
            - name: data
              mountPath: /data
              readOnly: true
            - name: data
              mountPath: /config
              subPath: config
              recursiveReadOnly: IfPossible
```
