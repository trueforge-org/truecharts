## Full Examples

### Middleware with labels and annotations

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      expandObjectName: false
      labels:
        key: value
        keytpl: "{{ .Values.some.value }}"
      annotations:
        key: value
        keytpl: "{{ .Values.some.value }}"
      data:
        maxRequestBodyBytes: 1024
```

### Middleware in another namespace

```yaml
ingressMiddlewares:
  traefik:
    other-middleware-name:
      enabled: true
      type: rate-limit
      namespace: some-namespace
      data:
        average: 100
        burst: 200
```

### Use a middleware on an ingress

```yaml
ingressMiddlewares:
  traefik:
    redirect-https:
      enabled: true
      type: redirect-scheme
      data:
        scheme: https
        permanent: true

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
          - name: redirect-https
```
