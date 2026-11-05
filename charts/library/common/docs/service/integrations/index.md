---
title: Service Integrations
---

Integrations that add annotations to the Service.

## Appears in

- `.Values.service.$name.integrations`

---

## Child Pages

- [Service Traefik Integration](/truecharts-common/service/integrations/traefik)

---

## Keys

| Key | Type | Description |
| --- | --- | --- |
| [`metallb`](/truecharts-common/service) | `map` | Define the MetalLB integration, only applies to `type: LoadBalancer` |
| [`cilium`](/truecharts-common/service) | `map` | Define the Cilium integration (LB-IPAM), only applies to `type: LoadBalancer` |
| [`traefik`](/truecharts-common/service/integrations/traefik) | `map` | Traefik settings for the backend of this Service, see [Traefik](/truecharts-common/service/integrations/traefik). |

---
