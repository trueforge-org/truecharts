---
title: Loadbalancer
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/service/LoadBalancer#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.LoadBalancer`

---

## `service.LoadBalancer`

Configuration for service entries with `type: LoadBalancer`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `service.LoadBalancer` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

## Full Examples

```yaml
service:
  service-lb:
    enabled: true
    primary: true
    type: LoadBalancer
    loadBalancerIP: 10.100.100.2
    loadBalancerSourceRanges:
      - 10.100.100.0/24
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
    targetSelector: pod-name
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        protocol: HTTP
        targetPort: 8080
```
