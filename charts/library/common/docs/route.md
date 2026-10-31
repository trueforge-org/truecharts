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

### `route.$name.expandObjectName`

Prefix the name of the route with the name of the release and chart.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `route.$name.expandObjectName` |
| Type       | `boolean`                      |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `true`                         |

Example

```yaml
route:
  $name:
    expandObjectName: true
```

---

### `route.$name.gateway`

Name of a gateway outside of this chart. Replaces `parentRefs`. Cannot be used with a `targetSelector` string.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `route.$name.gateway` |
| Type       | `string`              |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `""`                  |

Example

```yaml
route:
  $name:
    gateway: ""
```

---

### `route.$name.gatewayNamespace`

Namespace of `gateway`. Defaults to the namespace of the route.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `route.$name.gatewayNamespace` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `""`                           |

Example

```yaml
route:
  $name:
    gatewayNamespace: ""
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

### `route.$name.integrations`

Integrations of this route. `certManager` and `homepage` are supported, any other fails rendering.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `route.$name.integrations` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

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

### `route.$name.listenerPort`

Port of the listeners created for `tls` and `integrations.certManager`.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `route.$name.listenerPort` |
| Type       | `integer`                  |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `443`                      |

Example

```yaml
route:
  $name:
    listenerPort: 443
```

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

### `route.$name.primary`

Make this the primary route, used in notes and the chart context. Only 1 route can be primary.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `route.$name.primary` |
| Type       | `boolean`             |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `true`                |

Example

```yaml
route:
  $name:
    primary: true
```

---

### `route.$name.required`

Fail rendering if this route is disabled, unless an ingress is enabled.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `route.$name.required` |
| Type       | `boolean`              |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `false`                |

Example

```yaml
route:
  $name:
    required: false
```

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

A string selects a gateway in this chart and replaces `parentRefs`. A map of `service: port` selects the default backend, same as an ingress.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `route.$name.targetSelector` |
| Type       | `null, string, map`          |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `route.$name.tls`

TLS for this route. Creates a ListenerSet on the selected gateway and attaches the route to it. Needs `gateway` or a `targetSelector` string. Only for `HTTPRoute` and `GRPCRoute`. Ignored when `integrations.certManager` is enabled.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `route.$name.tls` |
| Type       | `list of map`     |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

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

## TLS

A route has no certificate of its own, so a route with TLS creates a `ListenerSet` on the selected gateway and attaches to it. The certificate stays with the app, without editing the shared gateway.

```yaml
route:
  main:
    enabled: true
    gateway: external
    gatewayNamespace: networking
    hostnames:
      - app.example.com
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
```

This needs:

- Gateway API v1.5 or newer. Rendering fails if the `ListenerSet` API is not found. When rendering without access to a cluster, pass `--api-versions gateway.networking.k8s.io/v1/ListenerSet`.
- A gateway provider with `ListenerSet` support.
- The gateway must accept `ListenerSets`, which it does not by default. Set `allowedListeners.namespaces.from` on it. Rendering checks this for a gateway in this chart, but cannot for one outside of it.
- For `integrations.certManager`, cert-manager 1.20 or newer, where this is an alpha feature. Set `config.gatewayAPI.enabled`, `config.gatewayAPI.enableListenerSet` and `config.featureGates.ListenerSets` to `true`.

`tls` works without that cert-manager feature, as `certificateIssuer` creates the `Certificate` directly.

## Migrating from an ingress

| Ingress                                  | Route                                                       |
| ---------------------------------------- | ----------------------------------------------------------- |
| `ingressClassName`                       | `gateway` and `gatewayNamespace`                            |
| `targetSelector` (`service: port`)       | `targetSelector`, in the same form                          |
| `hosts[].host`                           | `hostnames`                                                 |
| `hosts[].paths[]`                        | `rules[].matches[].path`                                    |
| `hosts[].paths[].overrideService`        | `rules[].backendRefs[]`                                     |
| `tls`                                    | `tls`, in the same form                                     |
| `integrations.certManager`               | `integrations.certManager`, in the same form                |
| `integrations.homepage`                  | `integrations.homepage`, in the same form. Only `HTTPRoute` |
| `integrations.traefik`, `nginx`          | Not supported yet, and fail rendering                       |
| `primary`, `required`, `expandObjectName`, `labels`, `annotations` | Same                              |

An ingress also gets an HTTP to HTTPS redirect from some controllers. A route does not, add it on the gateway.

## Not rendered by common

`BackendTLSPolicy` and `ReferenceGrant` have no dedicated key yet. Use `extraTpl` for these. Without a `BackendTLSPolicy`, a route sends plain HTTP to its backend, even if the service port is `https`.
