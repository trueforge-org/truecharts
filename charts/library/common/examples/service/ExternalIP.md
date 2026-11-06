## Full Examples

### Every option

```yaml
service:
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
        protocol: http
```

### IPv6

```yaml
service:
  service-externalip:
    enabled: true
    primary: true
    type: ExternalIP
    externalIP: "2001:db8::1"
    addressType: IPv6
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        protocol: https
```
