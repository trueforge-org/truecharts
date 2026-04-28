---
title: Certmanager
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingress/certManager#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.certManager`

---

## `ingress.certManager`

Create Ingress objects

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `ingress.certManager` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `ingress.certManager.certificateIssuer`

Define the certificate issuer for this cert-manager integration

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `ingress.certManager.certificateIssuer` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `""`                                    |

Example

```yaml
ingress:
  certManager:
    certificateIssuer: ""
```

---

### `ingress.certManager.enabled`

Enables or Disables the cert-manager integration

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `ingress.certManager.enabled` |
| Type       | `boolean`                     |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `false`                       |

Example

```yaml
ingress:
  certManager:
    enabled: false
```

---

## Full Examples

```yaml
ingress:
  ingress-name:
    integrations:
      certManager:
        enabled: true
        certificateIssuer: some-issuer
```
