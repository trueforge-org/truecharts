## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: retry
      data:
        attempts: 3
        initialInterval: 1000
```
