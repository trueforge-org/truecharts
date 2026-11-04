## Full Examples

```yaml
service:
  service-name:
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
