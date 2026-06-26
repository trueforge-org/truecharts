## Full Examples

```yaml
service:
  # Special type
  service-externalip:
    enabled: true
    primary: true
    type: ExternalIP
    useSlice: true
    externalIP: 1.1.1.1
    addressType: IPv4
    appProtocol: http
    publishNotReadyAddresses: true
    externalIPs:
      - 10.200.230.34
    sessionAffinity: ClientIP
    externalTrafficPolicy: Cluster
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        targetPort: 8080
        protocol: HTTP
```
