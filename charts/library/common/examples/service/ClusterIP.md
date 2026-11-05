## Full Examples

### Every option

```yaml
service:
  service-clusterip:
    enabled: true
    primary: true
    type: ClusterIP
    publishNotReadyAddresses: true
    clusterIP: 172.16.20.233
    ipFamilyPolicy: SingleStack
    ipFamilies:
      - IPv4
    externalIPs:
      - 10.200.230.34
    sessionAffinity: ClientIP
    sessionAffinityConfig:
      clientIP:
        timeoutSeconds: 86400
    targetSelector: workload-name
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        protocol: http
        targetPort: 8080
```

### Headless

```yaml
service:
  service-headless:
    enabled: true
    primary: true
    type: ClusterIP
    clusterIP: None
    publishNotReadyAddresses: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 5432
        protocol: tcp
```

### Dual stack

```yaml
service:
  service-dualstack:
    enabled: true
    primary: true
    type: ClusterIP
    ipFamilyPolicy: PreferDualStack
    ipFamilies:
      - IPv4
      - IPv6
    ports:
      port-name:
        enabled: true
        primary: true
        port: 80
```
