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

### `route.$name.parentRefs`

Configuration for `route.main.parentRefs`.

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
