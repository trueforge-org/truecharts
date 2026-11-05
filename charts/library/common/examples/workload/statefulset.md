## Full Examples

### RollingUpdate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: StatefulSet
    replicas: 3
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      partition: 1
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### OnDelete

Pods are only replaced when they are deleted by hand.

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: StatefulSet
    replicas: 1
    strategy: OnDelete
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### With volumeClaimTemplates

Persistence of `type: vct` is rendered as a `volumeClaimTemplate` of the StatefulSet. See [PVC and VCT](/truecharts-common/persistence/pvc-vct).

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: StatefulSet
    replicas: 3
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image

persistence:
  data:
    enabled: true
    type: vct
    size: 10Gi
    accessModes: ReadWriteOnce
    targetSelector:
      workload-name:
        container-name:
          mountPath: /data
```
