## Full Examples

### HTTPRoute on a gateway

Attaches the primary service to a listener of a gateway that runs outside the chart:

```yaml
route:
  main:
    enabled: true
    primary: true
    parentRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: external
        namespace: networking
        sectionName: https
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - port: 8080
        matches:
          - path:
              type: PathPrefix
              value: /
```

### HTTPRoute with matches

Sends requests for `api.example.com/v2` with a matching header and query parameter to the primary service:

```yaml
route:
  api:
    enabled: true
    nameOverride: api
    labels:
      team: backend
    annotations:
      example.com/owner: backend
    parentRefs:
      - name: external
        namespace: networking
        sectionName: https
    hostnames:
      - api.example.com
    rules:
      - matches:
          - path:
              type: PathPrefix
              value: /v2
            headers:
              - name: X-Api-Version
                type: Exact
                value: "2"
            queryParams:
              - name: debug
                type: Exact
                value: "true"
            method: GET
        backendRefs:
          - port: 8080
            weight: 1
```

### GRPCRoute

```yaml
route:
  grpc:
    enabled: true
    kind: GRPCRoute
    parentRefs:
      - name: external
        namespace: networking
        sectionName: grpc
    hostnames:
      - grpc.example.com
    rules:
      - backendRefs:
          - port: 50051
```

### TCPRoute

Routes a TCP port of a gateway listener to the primary service. Hostnames are not used by `TCPRoute`:

```yaml
route:
  mqtt:
    enabled: true
    kind: TCPRoute
    parentRefs:
      - name: external
        namespace: networking
        sectionName: mqtt
    rules:
      - backendRefs:
          - port: 1883
```
