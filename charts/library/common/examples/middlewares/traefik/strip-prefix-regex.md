## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix-regex
      data:
        regex:
          - some-regex
          - some-other-regex
```
