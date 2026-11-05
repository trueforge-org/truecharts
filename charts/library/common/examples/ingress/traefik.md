## Full Examples

### Entrypoints and TLS

```yaml
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
        entrypoints:
          - websecure
        forceTLS: true
```

### With middlewares

`middlewares` references middlewares that exist outside of the chart, `chartMiddlewares` references middlewares from [`ingressMiddlewares`](/truecharts-common/middlewares/traefik) in the same chart.

```yaml
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
        entrypoints:
          - websecure
        forceTLS: true
        middlewares:
          - name: shared-auth
            namespace: traefik
            expandObjectName: false
        chartMiddlewares:
          - name: rate-limit

ingressMiddlewares:
  traefik:
    rate-limit:
      enabled: true
      type: rate-limit
      data:
        average: 100
        burst: 200
```
