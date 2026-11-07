## Full Examples

### Select endpoints with matchLabels

```yaml
networkPolicy:
  protect-database:
    enabled: true
    type: cilium
    endpointSelector:
      matchLabels:
        app.kubernetes.io/name: postgresql
    ingress:
      - fromEndpoints:
          - matchLabels:
              app.kubernetes.io/name: my-app
        toPorts:
          - ports:
              - port: "5432"
                protocol: TCP
```

### Select endpoints with matchExpressions

```yaml
networkPolicy:
  protect-workers:
    enabled: true
    type: cilium
    endpointSelector:
      matchExpressions:
        - key: app.kubernetes.io/component
          operator: In
          values:
            - worker
            - scheduler
    ingress:
      - fromEntities:
          - cluster
```
