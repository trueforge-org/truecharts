## Full Examples

### RollingUpdate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 0
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### OnDelete

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    strategy: OnDelete
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Run on every node

Tolerate taints so the pod also runs on control plane nodes.

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    strategy: RollingUpdate
    podSpec:
      tolerations:
        - key: node-role.kubernetes.io/control-plane
          operator: Exists
          effect: NoSchedule
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
