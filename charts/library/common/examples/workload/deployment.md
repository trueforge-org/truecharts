## Full Examples

### Recreate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 1
    revisionHistoryLimit: 3
    strategy: Recreate
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### RollingUpdate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 3
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: "25%"
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Multiple Deployments

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 1
    strategy: Recreate
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image

  other-workload-name:
    enabled: true
    primary: false
    type: Deployment
    labels:
      key: value
    annotations:
      key: value
    replicas: 2
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
      maxSurge: 1
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
