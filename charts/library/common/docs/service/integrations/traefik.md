---
title: Service Traefik Integration
---

:::note

- See the [Full Examples](/truecharts-common/service/integrations/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.$name.integrations.traefik`
- `.Values.addons.codeserver.service.integrations.traefik`
- `.Values.addons.codeserver.service.$name.integrations.traefik`

---

## `traefik`

Traefik settings for the backend of the Service, set as annotations on the Service.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Add the Traefik annotations to the Service.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `forceTLS`

Talk to the backend over HTTPS. Adds the `traefik.ingress.kubernetes.io/service.serversscheme: "https"` annotation.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.forceTLS` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `insecureSkipVerify`

Skip TLS verification of the backend. Allows HTTPS backends with self-signed certificates.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.insecureSkipVerify` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `serverName`

Server name (SNI) Traefik uses when talking to the backend.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.serverName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rootCAs`

ConfigMaps or Secrets, in the same namespace, with certificate authorities Traefik uses to verify the backend.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `rootCAs[]`

A ConfigMap or Secret with a certificate authority. Set `configMapRef` or `secretRef`.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rootCAs[].configMapRef`

A ConfigMap with the CA certificate.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `rootCAs[].configMapRef.expandObjectName`

Prefix the name with the release fullname.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[].configMapRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `rootCAs[].configMapRef.name`

Name of the ConfigMap. Expanded to `fullname-name` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[].configMapRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `rootCAs[].secretRef`

A Secret with the CA certificate.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `rootCAs[].secretRef.name`

Name of the Secret. Expanded to `fullname-name` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[].secretRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Length | 1 to … |

---

## `rootCAs[].secretRef.expandObjectName`

Prefix the name with the release fullname.

| Field | Value |
| --- | --- |
| Key | `service.$name.integrations.traefik.rootCAs[].secretRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## Full Examples

### Forced TLS

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        protocol: https
    integrations:
      traefik:
        enabled: true
        forceTLS: true
        insecureSkipVerify: true
```

### Custom root CAs

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        protocol: https
    integrations:
      traefik:
        enabled: true
        forceTLS: true
        insecureSkipVerify: false
        serverName: "my.service.com"
        rootCAs:
          - configMapRef:
              name: configmap-name
              expandObjectName: false
          - secretRef:
              name: secret-name
              expandObjectName: true
```
