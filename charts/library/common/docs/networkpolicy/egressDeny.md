---
title: egressDeny
---

:::note

- See the [Full Examples](/truecharts-common/networkpolicy/egressDeny#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.$name.egressDeny`

---

## `egressDeny`

Cilium only. List of egress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

An egress deny rule.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toEndpoints`

Endpoints the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toEndpoints` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toEntities`

Entities the rule applies to, e.g. `world` or `cluster`.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toEntities` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toCIDR`

CIDRs the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toCIDR` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toCIDRSet`

CIDRs with exceptions the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toCIDRSet` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].toPorts`

Ports the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].toPorts` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].icmps`

ICMP types the rule applies to.

| Field | Value |
| --- | --- |
| Key | `networkpolicy.$name.egressDeny[].icmps` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
networkpolicy:
  deny-metadata:
    egressDeny:
      - toCIDR:
          - 169.254.169.254/32
```
