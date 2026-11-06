## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-rewrite-response-headers
      data:
        pluginName: my-plugin-name
        rewrites:
          - header: some-header
            regex: some-regex
            replacement: some-replacement
          - header: some-other-header
            regex: some-other-regex
            replacement: some-other-replacement
```
