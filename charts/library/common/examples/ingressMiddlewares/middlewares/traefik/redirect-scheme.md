## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-scheme
      data:
        scheme: https
        permanent: true
```
