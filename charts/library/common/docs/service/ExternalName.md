---
title: ExternalName
---

:::note

- See the [Full Examples](/truecharts-common/service/ExternalName#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Service](/truecharts-common/service) page.
- These options apply only when `type: ExternalName`.

:::

## Appears in

- `.Values.service.$name`
- `.Values.addons.codeserver.service.$name`

---

## `externalName`

External hostname the Service resolves to. Only for `type: ExternalName`.

| Field | Value |
| --- | --- |
| Key | `service.$name.externalName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `ExternalName` |

---

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
