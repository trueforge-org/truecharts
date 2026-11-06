## Full Examples

### Defaults for all containers

Set on the root of the values, applies to every container that does not set its own resources:

```yaml
resources:
  limits:
    cpu: 1500m
    memory: 2400Mi
  requests:
    cpu: 75m
    memory: 200Mi
```

### Resources of one container

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          resources:
            limits:
              cpu: 4000m
              memory: 8Gi
            requests:
              cpu: 500m
              memory: 1Gi
```

### Extra resources

Any other resource can be added to `limits` and `requests`, for example a GPU:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          resources:
            limits:
              cpu: 2000m
              memory: 4Gi
              nvidia.com/gpu: 1
            requests:
              cpu: 200m
              memory: 512Mi
```

### Leave out the extra resources

`excludeExtra` leaves out the extra resources of the chart, like GPUs, for this container only. It is useful for sidecars that should not claim a GPU:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
        sidecar:
          enabled: true
          imageSelector: image
          resources:
            excludeExtra: true
            requests:
              cpu: 10m
              memory: 50Mi
```
