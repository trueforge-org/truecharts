## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix
      data:
        prefix:
          - /some-prefix
          - /some-other-prefix
        forceSlash: true
```
