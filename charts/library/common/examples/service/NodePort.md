## Full Examples

### Every option

```yaml
service:
  service-nodeport:
    enabled: true
    primary: true
    type: NodePort
    clusterIP: 172.16.20.233
    publishNotReadyAddresses: true
    externalIPs:
      - 10.200.230.34
    sessionAffinity: ClientIP
    sessionAffinityConfig:
      clientIP:
        timeoutSeconds: 86400
    externalTrafficPolicy: Cluster
    targetSelector: workload-name
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        protocol: http
        targetPort: 8080
        nodePort: 30080
```

### Multiple ports

```yaml
service:
  service-nodeport:
    enabled: true
    primary: true
    type: NodePort
    externalTrafficPolicy: Local
    ports:
      web:
        enabled: true
        primary: true
        port: 8080
        protocol: http
        nodePort: 30080
      websecure:
        enabled: true
        port: 8443
        protocol: https
        nodePort: 30443
      dns:
        enabled: true
        port: 53
        protocol: udp
        nodePort: 30053
```
