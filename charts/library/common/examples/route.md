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
- A gateway provider with `ListenerSet` support. Envoy Gateway v1.9 or newer, or Traefik 3.8 or newer. On an older provider the route does not attach to anything, and rendering cannot detect that.
- The gateway must accept `ListenerSets`, which it does not by default. Set `allowedListeners.namespaces.from` on it. Rendering checks this for a gateway in this chart, but cannot for one outside of it.
- For `integrations.certManager`, cert-manager 1.20 or newer, where this is an alpha feature. Set `config.gatewayAPI.enabled`, `config.gatewayAPI.enableListenerSet` and `config.featureGates.ListenerSets` to `true`.

The listener port defaults to `global.fallbackDefaults.routeListenerPort`, which is `443`, and `listenerPort` overrides it per route. Traefik requires this to be the port of its entrypoint, which is not always the port it is exposed on.

Traefik keeps all certificates in one store and selects them by hostname across all listeners. Any namespace allowed by `allowedListeners` can therefore supply a certificate for a hostname on that gateway, so only allow namespaces you trust.

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
