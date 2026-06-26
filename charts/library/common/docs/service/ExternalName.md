---
title: Externalname
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/service/ExternalName#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.ExternalName`

---

## `service.ExternalName`

Configure ExternalName type

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `service.ExternalName` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

## Full Examples

```yaml
service:
  # Special type
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
        protocol: HTTP
```
