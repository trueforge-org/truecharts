---
title: Nodeport
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/service/NodePort#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.NodePort`

---

## `service.NodePort`

Configuration for service entries with `type: NodePort`.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `service.NodePort` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `service.NodePort.nodePort`

No description provided.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `service.NodePort.nodePort` |
| Type       | `integer`                   |
| Required   | ✅                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |
| Minimum    | `1`                         |

---

## Full Examples

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
    targetSelector: pod-name
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
