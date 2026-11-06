---
title: Cert Manager Integration
---

:::note

- See the [Full Examples](/truecharts-common/ingress/integrations/certManager#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.$name.integrations.certManager`
- `.Values.addons.codeserver.ingress.integrations.certManager`
- `.Values.addons.codeserver.ingress.$name.integrations.certManager`

---

## `certManager`

cert-manager integration. Requests a certificate for the TLS hosts of the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.certManager` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Add the cert-manager annotations to the Ingress, so cert-manager issues a certificate.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.certManager.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `certificateIssuer`

Name of the ClusterIssuer cert-manager uses to issue the certificate.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.certManager.certificateIssuer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## Full Examples

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - hosts:
          - app.example.com
        secretName: app-example-com-tls
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
```
