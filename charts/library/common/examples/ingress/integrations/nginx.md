## Full Examples

### Allow list and theme

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
    integrations:
      nginx:
        enabled: true
        ipWhitelist:
          - 192.168.0.0/16
          - 10.0.0.0/8
        themePark:
          enabled: true
          css: https://theme-park.dev/css/base/sonarr/dark.css
```

### Authentication

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
    integrations:
      nginx:
        enabled: true
        auth:
          type: authelia
          internalHost: authelia.auth.svc.cluster.local
          externalHost: auth.example.com
          responseHeaders:
            - Remote-User
            - Remote-Groups
```
