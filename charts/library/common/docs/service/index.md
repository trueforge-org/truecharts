---
title: Service
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/service#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service`

---

## `service`

Define service objects

| Field      | Value     |
| ---------- | --------- |
| Key        | `service` |
| Type       | `map`     |
| Required   | ❌        |
| Helm `tpl` | ❌        |
| Default    | unset     |

---

### `service.$name.addressType`

Define the addressType for External IP

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `service.$name.addressType` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `service.$name.annotations`

Additional annotations for service

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `service.$name.annotations` |
| Type       | `map, string`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `{}`                        |

Example

```yaml
service:
  $name:
    annotations:
      {}
```

---

### `service.$name.appProtocol`

Define the appProtocol for External IP

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `service.$name.appProtocol` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `service.$name.clusterIP`

Configure Cluster IP type

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `service.$name.clusterIP` |
| Type       | `string`                  |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `""`                      |

Example

```yaml
service:
  $name:
    clusterIP: ""
```

---

### `service.$name.enabled`

Enables or Disables the service

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `service.$name.enabled` |
| Type       | `boolean, string`       |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `false`                 |

Example

```yaml
service:
  $name:
    enabled: false
```

---

### `service.$name.expandObjectName`

Whether to expand the object name (based on the [naming scheme](/truecharts-common/service#naming-scheme)) or not

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `service.$name.expandObjectName` |
| Type       | `boolean, string`                |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `true`                           |

Example

```yaml
service:
  $name:
    expandObjectName: true
```

---

### `service.$name.externalIP`

Configure External IP type

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `service.$name.externalIP` |
| Type       | `string, map`              |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `service.$name.externalIPs`

Define externalIPs

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `service.$name.externalIPs` |
| Type       | `list, string`              |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `[]`                        |

Example

```yaml
service:
  $name:
    externalIPs:
      []
```

---

### `service.$name.externalName`

Configure ExternalName type

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `service.$name.externalName` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `service.$name.externalTrafficPolicy`

Define the external traffic policy (Cluster, Local) Does **not** apply to `type` of `ClusterIP`

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `service.$name.externalTrafficPolicy` |
| Type       | `string`                              |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `""`                                  |
| Enum       | `Cluster`, `Local`                    |

Example

```yaml
service:
  $name:
    externalTrafficPolicy: ""
```

---

### `service.$name.integrations`

Define the integrations for this service

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `service.$name.integrations` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Example

```yaml
service:
  $name:
    integrations:
      {}
```

---

### `service.$name.ipFamilies`

Define the ipFamilies Does **not** apply to `type` of `ExternalName` or `ExternalIP`

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `service.$name.ipFamilies` |
| Type       | `list, string`             |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `[]`                       |

Example

```yaml
service:
  $name:
    ipFamilies:
      []
```

---

### `service.$name.ipFamilyPolicy`

Define the ipFamilyPolicy Does **not** apply to `type` of `ExternalName` or `ExternalIP`

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `service.$name.ipFamilyPolicy`                       |
| Type       | `string`                                             |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | `""`                                                 |
| Enum       | `SingleStack`, `PreferDualStack`, `RequireDualStack` |

Example

```yaml
service:
  $name:
    ipFamilyPolicy: ""
```

---

### `service.$name.labels`

Additional labels for service

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `service.$name.labels` |
| Type       | `map, string`          |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `{}`                   |

Example

```yaml
service:
  $name:
    labels:
      {}
```

---

### `service.$name.loadBalancerIP`

Define the load balancer IP, sets the `metallb.io/loadBalancerIPs` **MetalLB** annotation. Mutually exclusive with `loadBalancerIPs`

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `service.$name.loadBalancerIP` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `service.$name.loadBalancerIPs`

Define the load balancer IPs, sets the `metallb.io/loadBalancerIPs` **MetalLB** annotation. Mutually exclusive with `loadBalancerIP`

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `service.$name.loadBalancerIPs` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `service.$name.loadBalancerSourceRanges`

Define the load balancer source ranges

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `service.$name.loadBalancerSourceRanges` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `service.$name.namespace`

Define the namespace for this object

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `service.$name.namespace` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `""`                      |

Example

```yaml
service:
  $name:
    namespace: ""
```

---

### `service.$name.ports`

Define the ports of the service See [Ports](/truecharts-common/service/ports)

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `service.$name.ports` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `{}`                  |

Example

```yaml
service:
  $name:
    ports:
      {}
```

---

### `service.$name.primary`

Configuration for `service.main.primary`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `service.$name.primary` |
| Type       | `boolean`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `service.$name.publishNotReadyAddresses`

Define whether to publishNotReadyAddresses or not

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `service.$name.publishNotReadyAddresses` |
| Type       | `boolean`                                |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `false`                                  |

Example

```yaml
service:
  $name:
    publishNotReadyAddresses: false
```

---

### `service.$name.sessionAffinity`

Define the session affinity (ClientIP, None)

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `service.$name.sessionAffinity` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `""`                            |
| Enum       | `ClientIP`, `None`              |

Example

```yaml
service:
  $name:
    sessionAffinity: ""
```

---

### `service.$name.sessionAffinityConfig`

Configuration for `$name.sessionAffinityConfig`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `service.$name.sessionAffinityConfig` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `service.$name.sharedKey`

Sets the shared key in `metallb.io/allow-shared-ip` **MetalLB** Annotation

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `service.$name.sharedKey` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `service.$name.targetSelector`

Define the pod to link the service, by default will use the primary pod

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `service.$name.targetSelector` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `""`                           |

Example

```yaml
service:
  $name:
    targetSelector: ""
```

---

### `service.$name.type`

Define the service type

| Field      | Value                                                                 |
| ---------- | --------------------------------------------------------------------- |
| Key        | `service.$name.type`                                                  |
| Type       | `string`                                                              |
| Required   | ❌                                                                    |
| Helm `tpl` | ❌                                                                    |
| Default    | unset                                                                 |
| Enum       | `ClusterIP`, `LoadBalancer`, `NodePort`, `ExternalName`, `ExternalIP` |

---

### `service.$name.useSlice`

Define whether to use `EndpointSlice` or `Endpoint`

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `service.$name.useSlice` |
| Type       | `boolean, map`           |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

## Child Pages

- [Clusterip](ClusterIP.md) - Configure Cluster IP type
- [Externalip](ExternalIP.md) - Configure External IP type
- [Externalname](ExternalName.md) - Configure ExternalName type
- [Loadbalancer](LoadBalancer.md) - Configuration for service entries with `type: LoadBalancer`.
- [Nodeport](NodePort.md) - Configuration for service entries with `type: NodePort`.
- [Integrations](integrations/) - Configuration for `service.integrations`.
- [Ports](ports.md) - Define the port dict

---

## Full Examples

Full examples can be found under each service type

- [ClusterIP](/truecharts-common/service/clusterip)
- [LoadBalancer](/truecharts-common/service/loadbalancer)
- [NodePort](/truecharts-common/service/nodeport)
- [ExternalName](/truecharts-common/service/externalname)
- [ExternalIP](/truecharts-common/service/externalip)
