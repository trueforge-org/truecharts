## Full Examples

### Basic

```yaml
ingress:
  main:
    enabled: true
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      homepage:
        enabled: true
        name: My App
        description: An example app
        group: Apps
        icon: mdi-application
        href: https://app.example.com
        weight: 10
```

### With a widget

```yaml
ingress:
  main:
    enabled: true
    targetSelector:
      main: main
    hosts:
      - host: sonarr.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      homepage:
        enabled: true
        name: Sonarr
        group: Media
        icon: sonarr
        podSelector:
          - main
        widget:
          enabled: true
          type: sonarr
          url: http://sonarr.media.svc.cluster.local:8989
          custom:
            enableQueue: "true"
          customkv:
            - key: key
              value: <api key>
```
