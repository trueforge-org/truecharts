## Full Examples

### Prefer the node of the app

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
```

### Several weighted terms with expressions

Prefer the same zone as the database pods, and the same node as the app, in the `apps` namespace:

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
              - weight: 80
                podAffinityTerm:
                  topologyKey: topology.kubernetes.io/zone
                  labelSelector:
                    matchExpressions:
                      - key: cnpg.io/cluster
                        operator: Exists
              - weight: 20
                podAffinityTerm:
                  topologyKey: kubernetes.io/hostname
                  namespaces:
                    - apps
                  labelSelector:
                    matchLabels:
                      app.kubernetes.io/name: myapp
```
