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

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces`

Namespaces from which ListenerSets can attach.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.from`

Where ListenerSets can attach from: `All`, `Same`, `Selector` or `None`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.from` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"None"` |
| Allowed values | `"All"`, `"Selector"`, `"Same"`, `"None"` |

---

## `$name.allowedListeners.namespaces.selector`

Label selector of the namespaces, used with `from: Selector`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.allowedListeners.namespaces.selector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector.matchExpressions[].values` |
| Type | `list of string` |
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

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[]`

A listener of the Gateway, see [Gateway](/truecharts-common/gateway).

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].name`

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

## `$name.listeners[].hostname`

Hostname of the listener, supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].hostname` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.listeners[].port`

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

## `$name.listeners[].protocol`

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

## `$name.listeners[].tls`

TLS settings of the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.mode`

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

## `$name.listeners[].tls.certificateRefs`

Certificates of the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[]`

A reference to a certificate Secret.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[].group`

API group of the certificate, `""` for a Secret.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[].kind`

Kind of the certificate, eg `Secret`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[].name`

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

## `$name.listeners[].tls.certificateRefs[].namespace`

Namespace of the certificate.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.certificateRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.options`

Implementation specific TLS options. Passed as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.options` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.options.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].tls.options.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes`

Routes that can attach to the listener.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces`

Namespaces routes can attach from.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.from`

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

## `$name.listeners[].allowedRoutes.namespaces.selector`

Namespaces routes can attach from, by labels, with `from: Selector`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds`

Route kinds that can attach.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds[]`

A route kind that can attach.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds[].group`

API group of the kind.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.listeners[].allowedRoutes.kinds[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds[].kind`

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
