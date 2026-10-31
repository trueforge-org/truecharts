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
