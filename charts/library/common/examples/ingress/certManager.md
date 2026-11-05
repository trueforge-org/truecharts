## Full Examples

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - hosts:
          - app.example.com
        secretName: app-example-com-tls
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
```
