## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-regex
      data:
        regex: some-regex
        replacement: some-replacement
        permanent: true
```
