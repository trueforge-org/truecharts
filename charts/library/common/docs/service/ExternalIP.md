---
title: ExternalIP
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/service/ExternalIP#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Service](/truecharts-common/service) page.
- These options apply only when `type: ExternalIP`.

:::

## Appears in

- `.Values.service.$name`
- `.Values.addons.codeserver.service.$name`

---

## `externalIP`

External IP the Service points to. Only for `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.externalIP` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `ExternalIP` |

Example

```yaml
service:
  example:
    externalIP: 192.168.1.50
```

---

## `useSlice`

Create an `EndpointSlice` instead of an `Endpoints` object. Only for `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.useSlice` |
| Type | `bool or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `ExternalIP` |

---

## `addressType`

Address type of the EndpointSlice: `IPv4`, `IPv6` or `FQDN`. Only for `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.addressType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `ExternalIP` |

---

## `appProtocol`

Application protocol of the ports of the EndpointSlice, eg `https`. Only for `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.appProtocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `ExternalIP` |

---

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
