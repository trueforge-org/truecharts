---
title: Route
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/route#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route`

## Naming scheme

- Primary: `$FullName` (release-name-chart-name)
- Non-Primary: `$FullName-$RouteName` (release-name-chart-name-route-name)

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `route`

Create Gateway API Route objects

|            |         |
| ---------- | ------- |
| Key        | `route` |
| Type       | `map`   |
| Required   | ❌      |
| Helm `tpl` | ❌      |
| Default    | `{}`    |

Example

```yaml
route: {}
```

---

### `$name`

Define a Route object with the given name

|            |               |
| ---------- | ------------- |
| Key        | `route.$name` |
| Type       | `map`         |
| Required   | ✅            |
| Helm `tpl` | ❌            |
| Default    | `{}`          |

Example

```yaml
route:
  main: {}
```

---

#### `enabled`

Enables or disables this Route object

|            |                       |
| ---------- | --------------------- |
| Key        | `route.$name.enabled` |
| Type       | `bool`                |
| Required   | ✅                    |
| Helm `tpl` | ✅                    |
| Default    | `false`               |

---

#### `kind`

Gateway API route kind

|            |                    |
| ---------- | ------------------ |
| Key        | `route.$name.kind` |
| Type       | `string`           |
| Required   | ✅                 |
| Helm `tpl` | ❌                 |
| Default    | `HTTPRoute`        |

Valid Values:

- `GRPCRoute`
- `HTTPRoute`
- `TCPRoute`
- `TLSRoute`
- `UDPRoute`

---

#### `parentRefs`

Gateway resources this Route attaches to

|            |                          |
| ---------- | ------------------------ |
| Key        | `route.$name.parentRefs` |
| Type       | `list` of `map`          |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |

---

#### `hostnames`

Hostnames for this Route (not used on TCPRoute/UDPRoute)

|            |                         |
| ---------- | ----------------------- |
| Key        | `route.$name.hostnames` |
| Type       | `list` of `string`      |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `[]`                    |

---

#### `rules`

Rules used by this Route

|            |                     |
| ---------- | ------------------- |
| Key        | `route.$name.rules` |
| Type       | `list` of `map`     |
| Required   | ✅                  |
| Helm `tpl` | ❌                  |

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
