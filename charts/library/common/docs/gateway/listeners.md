---
title: listeners
---

## Appears in

- `.Values.gateway.$name.listeners`

---

## `listeners`

Listeners of the Gateway. Each one needs a `name`, `port` and `protocol`, see [listener](/truecharts-common/gateway).

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A listener of the Gateway, see [Gateway](/truecharts-common/gateway).

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the listener, unique within the Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `[].hostname`

Hostname of the listener, supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].hostname` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].port`

Port of the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `[].protocol`

Protocol of the listener, eg `HTTP`, `HTTPS`, `TLS`, `TCP` or `UDP`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"`, `"TCP"`, `"TLS"`, `"UDP"` |

---

## `[].tls`

TLS settings of the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.mode`

TLS mode, `Terminate` or `Passthrough`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Terminate"`, `"Passthrough"` |

---

## `[].tls.certificateRefs`

Certificates of the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.certificateRefs[]`

A reference to a certificate Secret.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.certificateRefs[].group`

API group of the certificate, `""` for a Secret.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.certificateRefs[].kind`

Kind of the certificate, eg `Secret`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.certificateRefs[].name`

Name of the certificate.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `[].tls.certificateRefs[].namespace`

Namespace of the certificate.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.options`

Implementation specific TLS options. Passed as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.options` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tls.options.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.options.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes`

Routes that can attach to the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes.namespaces`

Namespaces routes can attach from.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes.namespaces.from`

Where routes can attach from: `All`, `Same` or `Selector`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.from` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Same"` |
| Allowed values | `"All"`, `"Same"`, `"Selector"` |

---

## `[].allowedRoutes.namespaces.selector`

Namespaces routes can attach from, by labels, with `from: Selector`.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes.kinds`

Route kinds that can attach.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes.kinds[]`

A route kind that can attach.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes.kinds[].group`

API group of the kind.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].allowedRoutes.kinds[].kind`

Kind of the route, eg `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---
