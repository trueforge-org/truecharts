---
title: egress
---

:::note

- See the [Full Examples](/truecharts-common/networkPolicy/egress#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkPolicy.$name.egress`

---

## Child Pages

- [to](/truecharts-common/networkPolicy/egress/to)

---

## `egress`

Egress rules.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

An egress rule.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].to`

Peers that may receive traffic.

See [to](/truecharts-common/networkPolicy/egress/to) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].to` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports`

Ports allowed by this rule.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[]`

A port that traffic is allowed to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].protocol`

Protocol of the port, `TCP`, `UDP` or `SCTP`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"TCP"`, `"UDP"`, `"SCTP"` |

---

## `[].ports[].port`

Port number or named port. Omit to match all ports.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[].port` |
| Type | `int or string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ports[].endPort`

End of an inclusive port range.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].ports[].endPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `[].toEntities`

Cilium only: entities (for example `world`, `cluster`, `host` or `all`) allowed to receive traffic. Ignored for Kubernetes NetworkPolicies.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toEndpoints`

Cilium only: endpoints, by labels, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toCIDR`

Cilium only: CIDRs the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toCIDRSet`

Cilium only: CIDRs with exceptions the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toPorts`

Cilium only: ports, with optional L7 rules, the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].icmps`

Cilium only: ICMP types the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toFQDNs`

Cilium only: domain names the rule allows, eg `matchName` or `matchPattern`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toFQDNs` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toServices`

Cilium only: kubernetes services the rule allows.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress[].toServices` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
networkPolicy:
  deny-metadata:
    egress:
      - toEntities:
          - world
```

```yaml
networkPolicy:
  allow-external:
    egress:
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
```

```yaml
networkPolicy:
  allow-database:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
```
