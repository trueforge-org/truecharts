---
title: Service
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/service#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service`

---

## Child Pages

- [ClusterIP](/truecharts-common/service/ClusterIP)
- [ExternalIP](/truecharts-common/service/ExternalIP)
- [ExternalName](/truecharts-common/service/ExternalName)
- [LoadBalancer](/truecharts-common/service/LoadBalancer)
- [NodePort](/truecharts-common/service/NodePort)
- [Ports](/truecharts-common/service/ports)
- [Service Integrations](/truecharts-common/service/integrations)

---

## `service`

Services, keyed by name. Each one exposes a workload on one or more ports. See [service](/truecharts-common/service).

| Field | Value |
| --- | --- |
| Key | `service` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A Service, keyed by name.

| Field | Value |
| --- | --- |
| Key | `service.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.integrations`

Integrations that add annotations to the Service.

See [Service Integrations](/truecharts-common/service/integrations) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.ports`

Ports of the Service, keyed by name. See [Ports](/truecharts-common/service/ports).

| Field | Value |
| --- | --- |
| Key | `service.$name.ports` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.ports.$name`

A port of the Service, keyed by name.

See [Ports](/truecharts-common/service/ports) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.ports.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allocateLoadBalancerNodePorts`

Allocate NodePorts for the load balancer. Only for `type: LoadBalancer`.

| Field | Value |
| --- | --- |
| Key | `service.$name.allocateLoadBalancerNodePorts` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.enabled`

Create this Service. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `service.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace of the Service. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `$name.labels`

Additional labels for service

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for service

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.type`

Type of the Service: `ClusterIP`, `LoadBalancer`, `NodePort`, `ExternalName` or `ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"ClusterIP"`, `"LoadBalancer"`, `"NodePort"`, `"ExternalName"`, `"ExternalIP"` |

---

## `$name.expandObjectName`

Prefix the name of the Service with the release fullname, see [Service](/truecharts-common/service).

| Field | Value |
| --- | --- |
| Key | `service.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `$name.clusterIP`

Fixed cluster IP of the Service. Use `None` for a headless Service. Only for `type: ClusterIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.clusterIP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

Example

```yaml
service:
  example:
    clusterIP: 10.43.0.10
```

---

## `$name.ipFamilyPolicy`

IP family policy: `SingleStack`, `PreferDualStack` or `RequireDualStack`. Not for `type: ExternalName` and `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.ipFamilyPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |
| Allowed values | `"SingleStack"`, `"PreferDualStack"`, `"RequireDualStack"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.ipFamilies`

IP families of the Service, `IPv4` and `IPv6`. Not for `type: ExternalName` and `type: ExternalIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.ipFamilies` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | `[]` |

---

## `$name.sessionAffinity`

Session affinity: `ClientIP` or `None`.

| Field | Value |
| --- | --- |
| Key | `service.$name.sessionAffinity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |
| Allowed values | `"ClientIP"`, `"None"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.sessionAffinityConfig`

Settings of the session affinity.

| Field | Value |
| --- | --- |
| Key | `service.$name.sessionAffinityConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sessionAffinityConfig.clientIP`

Session affinity by client IP.

| Field | Value |
| --- | --- |
| Key | `service.$name.sessionAffinityConfig.clientIP` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.sessionAffinityConfig.clientIP.timeoutSeconds`

Seconds a `ClientIP` session sticks to the same pod, from 0 to 86400.

| Field | Value |
| --- | --- |
| Key | `service.$name.sessionAffinityConfig.clientIP.timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

Example

```yaml
service:
  example:
    sessionAffinityConfig:
      clientIP:
        timeoutSeconds: 10800
```

---

## `$name.externalIPs`

External IPs the Service is also exposed on.

| Field | Value |
| --- | --- |
| Key | `service.$name.externalIPs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | `[]` |

Example

```yaml
service:
  example:
    externalIPs:
      - 192.168.1.50
```

---

## `$name.externalTrafficPolicy`

External traffic policy: `Cluster` or `Local`. Not for `type: ClusterIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.externalTrafficPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |
| Allowed values | `"Cluster"`, `"Local"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.publishNotReadyAddresses`

Publish the addresses of pods that are not ready yet.

| Field | Value |
| --- | --- |
| Key | `service.$name.publishNotReadyAddresses` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.targetSelector`

Name of the workload the Service selects. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `service.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.selectorLabels`

Labels used as the selector of the Service. Replaces the default selector labels.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `service.$name.selectorLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.primary`

Make this the primary Service, used in notes, the chart context and as the default backend. Only 1 Service can be primary.

| Field | Value |
| --- | --- |
| Key | `service.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Each service type has its own page with all of its options:

- [ClusterIP](/truecharts-common/service/ClusterIP)
- [LoadBalancer](/truecharts-common/service/LoadBalancer)
- [NodePort](/truecharts-common/service/NodePort)
- [ExternalIP](/truecharts-common/service/ExternalIP)
- [ExternalName](/truecharts-common/service/ExternalName)

### Minimal

The `type` defaults to `ClusterIP`.

```yaml
service:
  main:
    enabled: true
    primary: true
    ports:
      main:
        enabled: true
        primary: true
        port: 8080
```

### Metadata and selection

```yaml
service:
  service-name:
    enabled: true
    primary: true
    namespace: some-namespace
    labels:
      key: value
    annotations:
      key: value
    targetSelector: workload-name
    selectorLabels:
      key: value
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        targetPort: 8080

  other-service-name:
    enabled: true
    primary: false
    type: "{{ .Values.serviceType }}"
    ports:
      port-name:
        enabled: true
        port: 443
        protocol: https
```

### Integrations

```yaml
service:
  service-name:
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

  other-service-name:
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
        port: 80
```
