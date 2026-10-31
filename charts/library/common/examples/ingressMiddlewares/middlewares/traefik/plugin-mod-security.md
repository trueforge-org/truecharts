## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-mod-security
      data:
        pluginName: my-plugin-name
        modSecurityUrl: https://example.com
        timeoutMillis: 1000
        maxBodySize: 1024
```
