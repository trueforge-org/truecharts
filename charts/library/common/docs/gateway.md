---
title: Gateway
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/gateway#full-examples) section for complete examples.

:::

## Appears in

- `.Values.gateway`

---

## `gateway`

Configuration for `gateway`.

| Field      | Value     |
| ---------- | --------- |
| Key        | `gateway` |
| Type       | `map`     |
| Required   | ❌        |
| Helm `tpl` | ❌        |
| Default    | unset     |

---

### `gateway.$name.annotations`

Configuration for `gateway.main.annotations`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `gateway.$name.annotations` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `gateway.$name.enabled`

Configuration for `gateway.main.enabled`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `gateway.$name.enabled` |
| Type       | `boolean, string`       |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `false`                 |

Example

```yaml
gateway:
  $name:
    enabled: false
```

---

### `gateway.$name.gatewayClassName`

Configuration for `gateway.main.gatewayClassName`. The name of the GatewayClass resource that this Gateway references.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `gateway.$name.gatewayClassName`  |
| Type       | `string`                          |
| Required   | ✅ (when gateway is enabled)     |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

Example

```yaml
gateway:
  $name:
    gatewayClassName: traefik
```

---

### `gateway.$name.targetSelector`

Configuration for `gateway.main.targetSelector`. Name-based selector for automatic GatewayClass linking. When set, automatically references the specified `gatewayClass.$name`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `gateway.$name.targetSelector`  |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

Example

```yaml
gateway:
  $name:
    targetSelector: main  # Links to gatewayClass.main
```

---

### `gateway.$name.labels`

Configuration for `gateway.main.labels`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `gateway.$name.labels` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `gateway.$name.listeners`

Configuration for `gateway.main.listeners`. Array of listener definitions that define the network ports and protocols the Gateway listens on.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `gateway.$name.listeners` |
| Type       | `list of map`             |
| Required   | ✅ (when gateway is enabled) |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

Each listener must specify:
- `name`: Unique name for the listener
- `port`: Network port to listen on
- `protocol`: Protocol (HTTP, HTTPS, TCP, TLS, UDP)
- `hostname`: Optional hostname filter
- `tls`: Optional TLS configuration
- `allowedRoutes`: Optional configuration for which routes can attach

---

### `gateway.$name.addresses`

Requested addresses for the gateway. Passed as is.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `gateway.$name.addresses` |
| Type       | `list of unknown`         |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `gateway.$name.allowedListeners`

Configure `namespaces.from` as `Same`, `All`, `Selector`, or `None` to control which ListenerSets may attach. Set `namespaces.selector` when `from` is `Selector`.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `gateway.$name.allowedListeners` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `gateway.$name.infrastructure`

Infrastructure settings of the gateway. Passed as is.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `gateway.$name.infrastructure` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `gateway.$name.tls`

Gateway wide TLS settings. Passed as is.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `gateway.$name.tls` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

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
