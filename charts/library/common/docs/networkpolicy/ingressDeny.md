---
title: ingressDeny
---

:::note

- See the [Full Examples](/truecharts-common/networkpolicy/ingressDeny#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.$name.ingressDeny`

---

## `ingressDeny`

Cilium only. List of ingress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

An ingress deny rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromEndpoints`

Endpoints the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromEntities`

Entities the rule applies to, e.g. `world` or `cluster`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromCIDR`

CIDRs the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].fromCIDRSet`

CIDRs with exceptions the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].fromCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toPorts`

Ports the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].icmps`

ICMP types the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.ingressDeny[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Deny traffic from the world and from a CIDR

```yaml
networkpolicy:
  deny-ingress:
    enabled: true
    type: cilium
    targetSelector: main
    ingressDeny:
      - fromEntities:
          - world
        toPorts:
          - ports:
              - port: "8080"
                protocol: TCP
      - fromCIDR:
          - 203.0.113.0/24
    ingress:
      - fromEntities:
          - cluster
```

### Deny a CIDR range except a subnet, and ICMP

```yaml
networkpolicy:
  deny-ranges:
    enabled: true
    type: cilium
    targetAllPods: true
    ingressDeny:
      - fromCIDRSet:
          - cidr: 10.0.0.0/8
            except:
              - 10.1.0.0/16
      - fromEndpoints:
          - matchLabels:
              environment: untrusted
        icmps:
          - fields:
              - type: 8
                family: IPv4
```
