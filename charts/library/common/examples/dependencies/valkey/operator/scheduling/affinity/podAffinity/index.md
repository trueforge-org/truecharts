## Full Examples

### Required

Only schedule the Valkey pods on nodes that already run a pod of the app:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        affinity:
          podAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              - topologyKey: kubernetes.io/hostname
                labelSelector:
                  matchLabels:
                    app.kubernetes.io/name: myapp
```

### Required and preferred, as anti-affinity

Keep the Valkey pods out of the zone of a noisy workload, and spread them over the nodes when possible:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        affinity:
          podAntiAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              - topologyKey: topology.kubernetes.io/zone
                labelSelector:
                  matchExpressions:
                    - key: app
                      operator: In
                      values:
                        - batch-worker
            preferredDuringSchedulingIgnoredDuringExecution:
              - weight: 100
                podAffinityTerm:
                  topologyKey: kubernetes.io/hostname
                  labelSelector:
                    matchLabels:
                      app.kubernetes.io/name: valkey
```
