## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      data:
        maxRequestBodyBytes: 1024
        memRequestBodyBytes: 1024
        maxResponseBodyBytes: 1024
        memResponseBodyBytes: 1024
        retryExpression: "some-expression"
```
