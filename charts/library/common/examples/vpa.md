## Full Examples

### Automatic updates

```yaml
vpa:
  main:
    enabled: true
    targetSelector:
      - main
    updatePolicy:
      updateMode: Auto
    resourcePolicy:
      containerPolicies:
        - containerName: "*"
          minAllowed:
            cpu: 50m
            memory: 50Mi
          maxAllowed:
            cpu: 8000m
            memory: 20Gi
          controlledResources:
            - cpu
            - memory
```

### Recommendations only

```yaml
vpa:
  main:
    enabled: true
    labels:
      key: value
    annotations:
      key: value
    targetSelector:
      - main
    updatePolicy:
      updateMode: "Off"
```

### Per container policy with eviction requirements

```yaml
vpa:
  main:
    enabled: true
    targetSelector:
      - main
    updatePolicy:
      updateMode: Recreate
      minReplicas: 2
      evictionRequirements:
        - resources:
            - cpu
            - memory
          changeRequirement: TargetHigherThanRequests
    resourcePolicy:
      containerPolicies:
        - containerName: main
          mode: Auto
          controlledValues: RequestsOnly
          minAllowed:
            cpu: 100m
            memory: 128Mi
          maxAllowed:
            cpu: 2
            memory: 4Gi
          controlledResources:
            - cpu
            - memory
        - containerName: sidecar
          mode: "Off"
```
