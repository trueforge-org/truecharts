## Full Examples

### Forced TLS

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        protocol: https
    integrations:
      traefik:
        enabled: true
        forceTLS: true
        insecureSkipVerify: true
```

### Custom root CAs

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        protocol: https
    integrations:
      traefik:
        enabled: true
        forceTLS: true
        insecureSkipVerify: false
        serverName: "my.service.com"
        rootCAs:
          - configMapRef:
              name: configmap-name
              expandObjectName: false
          - secretRef:
              name: secret-name
              expandObjectName: true
```
