## Full Examples

### Several middlewares

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      expandObjectName: false
      labels:
        key: value
      annotations:
        key: value
      data:
        maxRequestBodyBytes: 1024

    other-middleware-name:
      enabled: true
      type: buffering
      namespace: some-namespace
      data:
        maxRequestBodyBytes: 1024
```

### Combine middlewares in a chain and use it on an ingress

```yaml
ingressMiddlewares:
  traefik:
    secure-headers:
      enabled: true
      type: headers
      data:
        stsSeconds: 31536000
        stsIncludeSubdomains: true
        frameDeny: true
    limit:
      enabled: true
      type: rate-limit
      data:
        average: 100
        burst: 200
    default-chain:
      enabled: true
      type: chain
      data:
        middlewares:
          - name: secure-headers
          - name: limit

ingress:
  main:
    enabled: true
    ingressClassName: traefik
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      traefik:
        enabled: true
        chartMiddlewares:
          - name: default-chain
```
