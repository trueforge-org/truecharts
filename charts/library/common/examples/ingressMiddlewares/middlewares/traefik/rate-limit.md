## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: rate-limit
      data:
        average: 1000
        burst: 1000
```
