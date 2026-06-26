## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: replace-path-regex
      data:
        regex: /some-path
        replacement: /some-replacement
```
