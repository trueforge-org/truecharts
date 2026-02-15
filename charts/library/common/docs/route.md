---
title: Route
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/route#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route`

---

## `route`

Configuration for `route`.

| Field      | Value   |
| ---------- | ------- |
| Key        | `route` |
| Type       | `map`   |
| Required   | ❌      |
| Helm `tpl` | ❌      |
| Default    | unset   |

---

### `route.$name.annotations`

Configuration for `route.main.annotations`.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `route.$name.annotations` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `route.$name.enabled`

Configuration for `route.main.enabled`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `route.$name.enabled` |
| Type       | `boolean, string`     |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `false`               |

Example

```yaml
route:
  $name:
    enabled: false
```

---

### `route.$name.hostnames`

Configuration for `route.main.hostnames`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `route.$name.hostnames` |
| Type       | `list of unknown`       |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `[]`                    |

Example

```yaml
route:
  $name:
    hostnames:
      []
```

---

### `route.$name.kind`

Configuration for `route.main.kind`.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `route.$name.kind`                                           |
| Type       | `string`                                                     |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | `"HTTPRoute"`                                                |
| Enum       | `GRPCRoute`, `HTTPRoute`, `TCPRoute`, `TLSRoute`, `UDPRoute` |

Example

```yaml
route:
  $name:
    kind: HTTPRoute
```

---

### `route.$name.labels`

Configuration for `route.main.labels`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `route.$name.labels` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `route.$name.targetSelector`

Configuration for `route.main.targetSelector`. Automatically links to a gateway defined in this chart. When set, this will generate parentRefs automatically based on the gateway name, overriding any manually defined parentRefs.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `route.$name.targetSelector` |
| Type       | `string`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

Example

```yaml
route:
  $name:
    targetSelector: main  # Links to gateway.main
```

---

### `route.$name.parentRefs`

Configuration for `route.main.parentRefs`. Define the Gateway resources this route attaches to. This is optional if targetSelector is used (targetSelector will override this).

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `route.$name.parentRefs` |
| Type       | `list of map`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `route.$name.rules`

Configuration for `route.main.rules`.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `route.$name.rules` |
| Type       | `list of map`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

## Full Examples

### Route with Manual parentRefs

```yaml
route:
  main:
    enabled: true
    kind: HTTPRoute
    parentRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: main
        namespace: default
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - kind: Service
            name: main
            port: 80
        matches:
          - path:
              type: PathPrefix
              value: /
```

### Route with targetSelector (Automatic Gateway Linking)

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
    kind: HTTPRoute
    targetSelector: main  # Automatically links to gateway.main
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - kind: Service
            name: main
            port: 80
        matches:
          - path:
              type: PathPrefix
              value: /
```
    kind: HTTPRoute
    parentRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: main
        namespace: default
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - kind: Service
            name: main
            port: 80
        matches:
          - path:
              type: PathPrefix
              value: /
```
