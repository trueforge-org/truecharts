## Full Examples

### CPU utilization

```yaml
hpa:
  main:
    enabled: true
    targetSelector:
      - main
    minReplicas: 1
    maxReplicas: 3
    metrics:
      - type: Resource
        resource:
          name: cpu
          target:
            type: Utilization
            averageUtilization: 50
```

### Multiple metrics and scaling behavior

```yaml
hpa:
  main:
    enabled: true
    labels:
      key: value
    annotations:
      key: value
    targetSelector:
      - main
    minReplicas: 2
    maxReplicas: 10
    behavior:
      scaleUp:
        selectPolicy: Max
        stabilizationWindowSeconds: 0
        policies:
          - type: Percent
            value: 100
            periodSeconds: 60
          - type: Pods
            value: 4
            periodSeconds: 60
      scaleDown:
        selectPolicy: Min
        stabilizationWindowSeconds: 300
        policies:
          - type: Pods
            value: 1
            periodSeconds: 120
    metrics:
      - type: Resource
        resource:
          name: memory
          target:
            type: AverageValue
            averageValue: 500Mi
      - type: ContainerResource
        containerResource:
          name: cpu
          container: main
          target:
            type: Utilization
            averageUtilization: 70
```

### Custom and external metrics

```yaml
hpa:
  main:
    enabled: true
    targetSelector:
      - main
    minReplicas: 1
    maxReplicas: 5
    metrics:
      - type: Pods
        pods:
          metric:
            name: http_requests_per_second
          target:
            type: AverageValue
            averageValue: 100
      - type: Object
        object:
          metric:
            name: requests_per_second
          describedObject:
            apiVersion: networking.k8s.io/v1
            kind: Ingress
            name: main
          target:
            type: Value
            value: 2k
      - type: External
        external:
          metric:
            name: queue_messages_ready
            selector:
              matchLabels:
                queue: worker_tasks
          target:
            type: AverageValue
            averageValue: 30
```
