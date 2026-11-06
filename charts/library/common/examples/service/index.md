## Full Examples

Each service type has its own page with all of its options:

- [ClusterIP](/truecharts-common/service/ClusterIP)
- [LoadBalancer](/truecharts-common/service/LoadBalancer)
- [NodePort](/truecharts-common/service/NodePort)
- [ExternalIP](/truecharts-common/service/ExternalIP)
- [ExternalName](/truecharts-common/service/ExternalName)

### Minimal

The `type` defaults to `ClusterIP`.

```yaml
service:
  main:
    enabled: true
    primary: true
    ports:
      main:
        enabled: true
        primary: true
        port: 8080
```

### Metadata and selection

```yaml
service:
  service-name:
    enabled: true
    primary: true
    namespace: some-namespace
    labels:
      key: value
    annotations:
      key: value
    targetSelector: workload-name
    selectorLabels:
      key: value
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        targetPort: 8080

  other-service-name:
    enabled: true
    primary: false
    type: "{{ .Values.serviceType }}"
    ports:
      port-name:
        enabled: true
        port: 443
        protocol: https
```

### Integrations

```yaml
service:
  service-name:
    enabled: true
    primary: true
    type: LoadBalancer
    integrations:
      metallb:
        enabled: true
        sharedKey: shared-key
    ports:
      port-name:
        enabled: true
        primary: true
        port: 80

  other-service-name:
    enabled: true
    type: LoadBalancer
    integrations:
      cilium:
        enabled: true
        sharedKey: shared-key
    ports:
      port-name:
        enabled: true
        primary: true
        port: 80
```
