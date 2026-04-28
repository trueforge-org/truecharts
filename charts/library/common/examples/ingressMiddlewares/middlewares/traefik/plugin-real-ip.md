## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-real-ip
      data:
        pluginName: my-plugin-name
        excludednets:
          - some-excluded-net
          - some-other-excluded-net
```
