---
title: LoadBalancer
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/service/LoadBalancer#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Service](/truecharts-common/service) page.
- These options apply only when `type: LoadBalancer`.

:::

## Appears in

- `.Values.service.$name`
- `.Values.addons.codeserver.service.$name`

---

## `sharedKey`

Value of the `metallb.io/allow-shared-ip` MetalLB annotation, so Services with the same key can share an IP. Only for `type: LoadBalancer`.

| Field | Value |
| --- | --- |
| Key | `service.$name.sharedKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `LoadBalancer` |

---

## `loadBalancerIP`

Requested IP of the load balancer, sets the `metallb.io/loadBalancerIPs` MetalLB annotation. Mutually exclusive with `loadBalancerIPs`.

| Field | Value |
| --- | --- |
| Key | `service.$name.loadBalancerIP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `LoadBalancer` |

Example

```yaml
service:
  example:
    loadBalancerIP: 192.168.1.240
```

---

## `loadBalancerIPs`

Requested IPs of the load balancer, sets the `metallb.io/loadBalancerIPs` MetalLB annotation. Mutually exclusive with `loadBalancerIP`.

| Field | Value |
| --- | --- |
| Key | `service.$name.loadBalancerIPs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Applies to | `LoadBalancer` |

Example

```yaml
service:
  example:
    loadBalancerIPs:
      - 192.168.1.240
```

---

## `loadBalancerSourceRanges`

CIDRs that are allowed to reach the load balancer. Only for `type: LoadBalancer`.

| Field | Value |
| --- | --- |
| Key | `service.$name.loadBalancerSourceRanges` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Applies to | `LoadBalancer` |

Example

```yaml
service:
  example:
    loadBalancerSourceRanges:
      - 192.168.1.0/24
```

---

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
