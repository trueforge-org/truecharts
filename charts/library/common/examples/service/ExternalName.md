## Full Examples

### Every option

```yaml
service:
  service-external-name:
    enabled: true
    primary: true
    type: ExternalName
    externalName: external-name
    clusterIP: 172.16.20.233
    publishNotReadyAddresses: true
    externalIPs:
      - 10.200.230.34
    sessionAffinity: ClientIP
    sessionAffinityConfig:
      clientIP:
        timeoutSeconds: 86400
    externalTrafficPolicy: Cluster
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        protocol: http
```

### External host

```yaml
service:
  database:
    enabled: true
    primary: true
    type: ExternalName
    externalName: db.example.com
    ports:
      db:
        enabled: true
        primary: true
        port: 5432
        protocol: tcp
```
