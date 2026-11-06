---
title: Ingress Integrations
---

Integrations that add annotations, middlewares or certificates to the Ingress.

## Appears in

- `.Values.ingress.$name.integrations`

---

## Child Pages

- [Cert Manager Integration](/truecharts-common/ingress/integrations/certManager)
- [Homepage Integration](/truecharts-common/ingress/integrations/homepage)
- [Nginx Integration](/truecharts-common/ingress/integrations/nginx)
- [Traefik Integration](/truecharts-common/ingress/integrations/traefik)

---

## Keys

| Key | Type | Description |
| --- | --- | --- |
| [`traefik`](/truecharts-common/ingress/integrations/traefik) | `map` | Traefik integration, see [Traefik](/truecharts-common/ingress/integrations/traefik). |
| [`homepage`](/truecharts-common/ingress/integrations/homepage) | `map` | Homepage dashboard integration, see [Homepage](/truecharts-common/ingress/integrations/homepage). |
| [`certManager`](/truecharts-common/ingress/integrations/certManager) | `map` | cert-manager integration, see [cert-manager](/truecharts-common/ingress/integrations/certManager). |
| [`nginx`](/truecharts-common/ingress/integrations/nginx) | `map` | ingress-nginx integration, see [nginx](/truecharts-common/ingress/integrations/nginx). |

---
