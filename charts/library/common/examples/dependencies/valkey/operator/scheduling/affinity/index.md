## Full Examples

### Node affinity

Run the Valkey pods only on amd64 nodes, and prefer nodes in the `storage` pool:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
                - matchExpressions:
                    - key: kubernetes.io/arch
                      operator: In
                      values:
                        - amd64
            preferredDuringSchedulingIgnoredDuringExecution:
              - weight: 50
                preference:
                  matchExpressions:
                    - key: node-pool
                      operator: In
                      values:
                        - storage
```

### Pod affinity and anti-affinity

Place the Valkey pods close to the app, but never two of them on the same node:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        affinity:
          podAffinity:
            preferredDuringSchedulingIgnoredDuringExecution:
              - weight: 100
                podAffinityTerm:
                  topologyKey: kubernetes.io/hostname
                  labelSelector:
                    matchLabels:
                      app.kubernetes.io/name: myapp
          podAntiAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              - topologyKey: kubernetes.io/hostname
                labelSelector:
                  matchExpressions:
                    - key: app.kubernetes.io/name
                      operator: In
                      values:
                        - valkey
```
