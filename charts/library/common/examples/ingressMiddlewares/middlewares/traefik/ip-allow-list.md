## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: ip-allow-list
      data:
        sourceRange:
          - some-source-range
        ipStrategy:
          depth: 1
          excludedIPs:
            - some-excluded-ip
```
