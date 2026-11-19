---
title: tls
---

:::note

- See the [Full Examples](/truecharts-common/gateway/tls#full-examples) section for complete examples.

:::

## Appears in

- `.Values.gateway.$name.tls`

---

## `tls`

TLS settings that apply to the whole Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend`

TLS settings for connections from clients.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default`

Default settings for all ports of the Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation`

Validation of the certificate of clients.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.caCertificateRefs`

References to the CA certificates that client certificates are validated against.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.caCertificateRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.caCertificateRefs[]`

A ConfigMap or Secret with CA certificates.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.caCertificateRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.caCertificateRefs[].group`

API group of the object. An empty string is the core group.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.caCertificateRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.caCertificateRefs[].kind`

Kind of the object, eg `Secret` or `ConfigMap`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.caCertificateRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.caCertificateRefs[].name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.caCertificateRefs[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.caCertificateRefs[].namespace`

Namespace of the object. Defaults to the namespace of the Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.caCertificateRefs[].namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.default.validation.mode`

Whether clients without a valid certificate are refused: `AllowValidOnly` or `AllowInsecureFallback`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.default.validation.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"AllowValidOnly"`, `"AllowInsecureFallback"` |

---

## `frontend.perPort`

Settings per port, which override `default`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[]`

Settings of one port.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].port`

Port of the Gateway the settings apply to.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls`

Settings for this port.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation`

Validation of the certificate of clients.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.caCertificateRefs`

References to the CA certificates that client certificates are validated against.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.caCertificateRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.caCertificateRefs[]`

A ConfigMap or Secret with CA certificates.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.caCertificateRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.caCertificateRefs[].group`

API group of the object. An empty string is the core group.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.caCertificateRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.caCertificateRefs[].kind`

Kind of the object, eg `Secret` or `ConfigMap`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.caCertificateRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.caCertificateRefs[].name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.caCertificateRefs[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.caCertificateRefs[].namespace`

Namespace of the object. Defaults to the namespace of the Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.caCertificateRefs[].namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `frontend.perPort[].tls.validation.mode`

Whether clients without a valid certificate are refused: `AllowValidOnly` or `AllowInsecureFallback`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.perPort[].tls.validation.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"AllowValidOnly"`, `"AllowInsecureFallback"` |

---

## `backend`

TLS settings for connections to backends.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backend.clientCertificateRef`

The Secret with the client certificate.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend.clientCertificateRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backend.clientCertificateRef.group`

API group of the object. An empty string is the core group.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend.clientCertificateRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backend.clientCertificateRef.kind`

Kind of the object, eg `Secret` or `ConfigMap`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend.clientCertificateRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backend.clientCertificateRef.name`

Name of the object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend.clientCertificateRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `backend.clientCertificateRef.namespace`

Namespace of the object. Defaults to the namespace of the Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend.clientCertificateRef.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
gateway:
  example:
    tls:
      frontend:
        default:
          validation:
            caCertificateRefs: []
            mode: AllowValidOnly
        perPort:
          - port: 1
            tls: {}
      backend:
        clientCertificateRef:
          group: example
          kind: example
```
