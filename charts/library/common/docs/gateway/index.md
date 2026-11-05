---
title: Gateway
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/gateway#full-examples) section for complete examples.

:::

## Appears in

- `.Values.gateway`

---

## Child Pages

- [listeners](/truecharts-common/gateway/listeners)
- [allowedListeners](/truecharts-common/gateway/allowedListeners)

---

## `gateway`

Gateway API Gateways, keyed by name. See [gateway](/truecharts-common/gateway).

| Field | Value |
| --- | --- |
| Key | `gateway` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A Gateway, keyed by name.

| Field | Value |
| --- | --- |
| Key | `gateway.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this Gateway. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Make this the primary Gateway, used in the chart context. Only 1 Gateway can be primary.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.namespace`

Namespace of the Gateway. Defaults to the release namespace.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nameOverride`

Suffix of the Gateway name, instead of the key of the object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.nameOverride` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations of the Gateway.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Additional labels of the Gateway.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.gatewayClassName`

Name of the GatewayClass the Gateway uses.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.gatewayClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
gateway:
  example:
    gatewayClassName: traefik
```

---

## `$name.targetSelector`

Key of a `gatewayClass` object of this chart. Its name is used as `gatewayClassName`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
gateway:
  example:
    targetSelector: main
```

---

## `$name.addresses`

Requested addresses of the Gateway, passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.addresses` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.addresses[]`

A requested address for the gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.addresses[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.addresses[].type`

Type of the address, like `IPAddress` or `Hostname`. Defaults to `IPAddress` in Gateway API.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.addresses[].type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.addresses[].value`

The address value, like an IP address or a hostname.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.addresses[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure`

Infrastructure settings of the Gateway, passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure.annotations`

Annotations for the resources created for the Gateway.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure.labels`

Labels for the resources created for the Gateway.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure.parametersRef`

Implementation specific parameters of the gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure.parametersRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure.parametersRef.group`

API group of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure.parametersRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure.parametersRef.kind`

Kind of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure.parametersRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.infrastructure.parametersRef.name`

Name of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.infrastructure.parametersRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners`

Which ListenerSets can attach to the Gateway.

See [allowedListeners](/truecharts-common/gateway/allowedListeners) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls`

TLS settings that apply to the whole Gateway, passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls.frontend`

TLS settings for connections from clients, passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls.frontend.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.frontend.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls.backend`

TLS settings for connections to backends, passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls.backend.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.tls.backend.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners`

Listeners of the Gateway. Each one needs a `name`, `port` and `protocol`, see [listener](/truecharts-common/gateway).

See [listeners](/truecharts-common/gateway/listeners) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Basic HTTP Gateway

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    listeners:
      - name: http
        port: 80
        protocol: HTTP
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: HTTPRoute
```

### HTTPS Gateway with TLS

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    listeners:
      - name: https
        hostname: "*.example.com"
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - kind: Secret
              group: ""
              name: example-tls
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: HTTPRoute
```

### Multi-Protocol Gateway

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    listeners:
      - name: http
        port: 80
        protocol: HTTP
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: HTTPRoute
      - name: https
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - kind: Secret
              name: tls-cert
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: HTTPRoute
      - name: tcp
        port: 8080
        protocol: TCP
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: TCPRoute
```

### Using Gateway with Route via targetSelector

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    listeners:
      - name: http
        port: 80
        protocol: HTTP

route:
  main:
    enabled: true
    targetSelector: main  # Automatically links to gateway.main
    kind: HTTPRoute
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - kind: Service
            name: main
            port: 80
```

### Gateway with a Wildcard Hostname and Fixed Address

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    addresses:
      - type: IPAddress
        value: 192.168.1.10
    listeners:
      - name: https
        hostname: "*.example.com"
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: example-cert
```

### Gateway that Accepts ListenerSets

`allowedListeners` must be set before a [listenerSet](/truecharts-common/listenerSet) can attach to the gateway:

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    allowedListeners:
      namespaces:
        from: Same
    listeners:
      - name: http
        port: 80
        protocol: HTTP

listenerSet:
  https:
    enabled: true
    targetSelector: main
    listeners:
      - name: https
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: example-cert
```
