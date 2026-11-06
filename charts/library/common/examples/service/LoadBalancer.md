## Full Examples

### Every option

```yaml
service:
  service-lb:
    enabled: true
    primary: true
    type: LoadBalancer
    loadBalancerIP: 10.100.100.2
    loadBalancerSourceRanges:
      - 10.100.100.0/24
    allocateLoadBalancerNodePorts: false
    clusterIP: 172.16.20.233
    sharedKey: custom-shared-key
    publishNotReadyAddresses: true
    ipFamilyPolicy: SingleStack
    ipFamilies:
      - IPv4
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
```

### Multiple addresses

```yaml
service:
  service-lb:
    enabled: true
    primary: true
    type: LoadBalancer
    loadBalancerIPs:
      - 10.100.100.2
      - fd00::2
    ipFamilyPolicy: RequireDualStack
    ipFamilies:
      - IPv4
      - IPv6
    externalTrafficPolicy: Local
    ports:
      port-name:
        enabled: true
        primary: true
        port: 53
        protocol: udp
```

### MetalLB and Cilium

```yaml
service:
  service-metallb:
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
  service-cilium:
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
        port: 8080
```
