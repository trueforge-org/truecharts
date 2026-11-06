---
title: ip-allow-list
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/ip-allow-list#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: ip-allow-list`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.sourceRange`

CIDRs that are allowed. Everything else is rejected.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.sourceRange` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `ip-allow-list` |

---

## `data.ipStrategy`

How the client IP is taken from the request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.ipStrategy` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `ip-allow-list` |

---

## `data.ipStrategy.excludedIPs`

IPs to skip in `X-Forwarded-For`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.ipStrategy.excludedIPs` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.ipStrategy.depth`

Position of the IP to use in `X-Forwarded-For`, counted from the right.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.ipStrategy.depth` |
| Type | `number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: ip-allow-list
      data:
        sourceRange:
          - some-source-range
        ipStrategy:
          depth: 1
          excludedIPs:
            - some-excluded-ip
```
