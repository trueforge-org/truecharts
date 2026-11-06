---
title: Ports
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/service/ports#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.$name.ports.$name`
- `.Values.addons.codeserver.service.ports.$name`
- `.Values.addons.codeserver.service.$name.ports.$name`

---

## `$name`

A port of the Service, keyed by name.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `targetSelector`

Name of the container port or workload the port points to. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `port`

Port the Service listens on.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Range | 1 to … |

Example

```yaml
service:
  example:
    ports:
      example:
        port: 8080
```

---

## `targetPort`

Port on the pod the traffic is sent to, a number only. Defaults to `port`.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.targetPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
service:
  example:
    ports:
      example:
        targetPort: 8080
```

---

## `protocol`

Protocol of the port: `tcp`, `udp`, `sctp`, `http` or `https`. `http` and `https` are used as `TCP` where needed. Also used by container ports and probes.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"tcp"`, `"udp"`, `"http"`, `"https"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `appProtocol`

Application protocol of the port, eg `https`. Also used by the `Endpoints` and `EndpointSlice` objects of `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.appProtocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostPort`

Port opened on the node by the container. Avoid this unless the app cannot work without it.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.hostPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `enabled`

Create this port. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `primary`

Make this the primary port of the Service. Only 1 port can be primary.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

The `protocol` of a port is one of `tcp`, `udp`, `http` and `https`. `http` and `https` are converted to `tcp` where Kubernetes needs it, and set the `appProtocol`.

### http

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        targetPort: 8080
        protocol: http
```

### https

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        targetPort: 8443
        protocol: https
```

### tcp and udp

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      tcp-port:
        enabled: true
        primary: true
        port: 5432
        protocol: tcp
      udp-port:
        enabled: true
        port: 53
        protocol: udp
```

### appProtocol, hostPort and templates

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: "{{ .Values.port }}"
        targetPort: "{{ .Values.targetPort }}"
        protocol: "{{ .Values.protocol }}"
        appProtocol: kubernetes.io/h2c
        hostPort: 8080

  service-nodeport:
    enabled: true
    type: NodePort
    ports:
      port-name:
        enabled: true
        primary: true
        port: 80
        protocol: tcp
        nodePort: 30080
```
