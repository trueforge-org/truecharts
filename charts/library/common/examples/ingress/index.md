## Full Examples

### Basic ingress

```yaml
ingress:
  main:
    enabled: true
    primary: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
```

### Multiple hosts, paths and a service override

```yaml
ingress:
  main:
    enabled: true
    primary: true
    required: false
    expandObjectName: true
    labels:
      key: value
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    ingressClassName: traefik
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
          - path: /api
            pathType: Prefix
            overrideService:
              name: api
              port: 8080
      - host: "{{ .Release.Name }}.example.com"
        paths:
          - path: /
            pathType: Prefix
```

### TLS with an existing secret

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
```

### TLS from a cert-manager issuer

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
        certificateIssuer: my-issuer
```

### TLS from a cluster certificate

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
        clusterCertificate: wildcard-example-com
```

### With integrations

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: traefik
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
      traefik:
        enabled: true
        entrypoints:
          - websecure
        forceTLS: true
      homepage:
        enabled: true
        name: My App
        group: Apps
        icon: mdi-application
```

### Annotations and labels as lists

```yaml
ingress:
  main:
    enabled: true
    targetSelector:
      main: main
    annotationsList:
      - name: nginx.ingress.kubernetes.io/proxy-body-size
        value: 50m
    labelsList:
      - name: team
        value: apps
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
```
