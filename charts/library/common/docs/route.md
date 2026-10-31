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

Host addresses, supports Helm `tpl`. Required for `TLSRoute`, not supported by `TCPRoute` and `UDPRoute`.

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

Routing rules. Without rules everything goes to the primary service. Fields the route kind does not support fail rendering.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `route.$name.rules` |
| Type       | `list of map`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `route.$name.targetSelector`

Configuration for `route.main.targetSelector`. Automatically links to a gateway defined in this chart.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `route.$name.targetSelector` |
| Type       | `null, string`               |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

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

  # Attaches to a listener of a gateway in this chart, with filters and a canary backend
  web:
    enabled: true
    parentRefs:
      - targetSelector: main
        sectionName: https
    hostnames:
      - "{{ .Release.Name }}.example.com"
    rules:
      - name: api
        matches:
          - path:
              type: PathPrefix
              value: /api
        timeouts:
          request: 30s
        filters:
          - type: RequestHeaderModifier
            requestHeaderModifier:
              add:
                - name: X-Example
                  value: example
        backendRefs:
          - targetSelector: main
            weight: 90
          - targetSelector: canary
            weight: 10

  # Redirect without a backend
  redirect:
    enabled: true
    parentRefs:
      - targetSelector: main
        sectionName: http
    rules:
      - filters:
          - type: RequestRedirect
            requestRedirect:
              scheme: https
              statusCode: 301

  # Other route kinds only have backendRefs in their rules
  mqtt:
    enabled: true
    kind: TCPRoute
    parentRefs:
      - targetSelector: main
        sectionName: mqtt
    rules:
      - backendRefs:
          - targetSelector: mqtt
```

## Supported fields per kind

Fields a kind does not support fail rendering, because dropping them would change what the route matches.

| Field                                       | HTTPRoute | GRPCRoute | TLSRoute | TCPRoute | UDPRoute |
| ------------------------------------------- | --------- | --------- | -------- | -------- | -------- |
| `hostnames`                                 | ✅        | ✅        | Required | ❌       | ❌       |
| `rules[].backendRefs`, `rules[].name`       | ✅        | ✅        | ✅       | ✅       | ✅       |
| `rules[].matches`, `rules[].filters`        | ✅        | ✅        | ❌       | ❌       | ❌       |
| `rules[].backendRefs[].filters`             | ✅        | ✅        | ❌       | ❌       | ❌       |
| `rules[].sessionPersistence` (experimental) | ✅        | ✅        | ❌       | ❌       | ❌       |
| `rules[].timeouts`, `rules[].retry`         | ✅        | ❌        | ❌       | ❌       | ❌       |

## API version

`HTTPRoute` and `GRPCRoute` use `gateway.networking.k8s.io/v1`. `TCPRoute`, `TLSRoute` and `UDPRoute` use `v1` if the cluster serves it, otherwise `v1alpha3` or `v1alpha2`. When rendering without a cluster they use `v1`, unless you pass `--api-versions`.

## Not rendered by common

`BackendTLSPolicy`, `ReferenceGrant` and `ListenerSet` have no dedicated key yet. Use `extraTpl` for these. Without a `BackendTLSPolicy`, a route sends plain HTTP to its backend, even if the service port is `https`.
