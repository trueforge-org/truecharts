## Full Examples

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
    service:
      enabled: true
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
```

The code-server addon can also use a Gateway API route instead of an ingress. It is a route the same as `route.<name>`, so it supports `tls`, `listenerSet` and the integrations. With per domain certificates, its listener is added to the same ListenerSet as the listeners of the other routes on the gateway.

```yaml
addons:
  codeserver:
    enabled: true
    route:
      enabled: true
      gateway: external
      gatewayNamespace: networking
      hostnames:
        - code.chart-example.local
      integrations:
        certManager:
          enabled: true
          certificateIssuer: my-issuer
```
