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
