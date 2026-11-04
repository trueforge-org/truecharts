## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      expandObjectName: false
      labels:
        key: value
        keytpl: "{{ .Values.some.value }}"
      annotations:
        key: value
        keytpl: "{{ .Values.some.value }}"
      data:
        maxRequestBodyBytes: 1024

    other-middleware-name:
      enabled: true
      type: buffering
      namespace: some-namespace
      data:
        maxRequestBodyBytes: 1024
```
