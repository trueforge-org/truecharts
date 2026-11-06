---
title: NodePort
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/service/NodePort#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Service](/truecharts-common/service) page.
- These options apply only when `type: NodePort`.

:::

## Appears in

- `.Values.service.$name`
- `.Values.addons.codeserver.service.$name`

---

## `ports.$name.nodePort`

Port opened on every node. Only for `type: NodePort`.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.nodePort` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `NodePort` |

Example

```yaml
service:
  example:
    ports:
      example:
        nodePort: 30080
```

---

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
