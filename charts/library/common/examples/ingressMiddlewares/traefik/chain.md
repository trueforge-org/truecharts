## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: chain
      data:
        middlewares:
          - name: some-middleware
          - name: some-other-middleware
            expandObjectName: false
```
