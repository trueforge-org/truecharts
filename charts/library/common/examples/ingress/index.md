## Full Examples

```yaml
ingress:
  main:
    enabled: false
    primary: true
    required: false
    expandObjectName: false
    labels:
      key: value
    annotations:
      key: value
    ingressClassName: ""
    targetSelector:
      main: main
    hosts:
      - host: chart-example.local
        paths:
          - path: /
            pathType: Prefix
            overrideService:
              name: main
              port: 80
    tls:
      - hosts:
          - chart-example.local
        secretName: chart-example-tls
        # OR
        certificateIssuer: ""
    integrations:
      certManager:
        enabled: false
        certificateIssuer: ""
      traefik:
        enabled: true
        entrypoints:
          - websecure
        forceTLS: true
        middlewares:
          - name: my-middleware
            namespace: ""
      homepage:
        enabled: false
        name: ""
        description: ""
        group: ""
        icon: ""
        widget:
          type: ""
          url: ""
          custom:
            key: value
          customkv:
            - key: some key
              value: some value
```
