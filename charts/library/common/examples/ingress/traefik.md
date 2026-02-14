## Full Examples

```yaml
ingress:
  ingress-name:
    integrations:
      traefik:
        enabled: true
        entrypoints:
          - websecure
        forceTLS: true
        middlewares:
          - name: my-middleware
            namespace: ""
            expandObjectName: false
        chartMiddlewares:
          - name: my-middleware
```
