## Full Examples

Code server runs next to the app, so it can edit the files the app uses. It can only be attached to a single workload.

### Enable

```yaml
addons:
  codeserver:
    enabled: true
    targetSelector:
      - main
```

### Environment variables

`PORT` is the port code-server listens on, and `DEFAULT_WORKSPACE` the folder it opens. The port of the service has to match:

```yaml
addons:
  codeserver:
    enabled: true
    container:
      env:
        PORT: 12345
        DEFAULT_WORKSPACE: /config
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
```

### Service

The service and port are named `codeserver`:

```yaml
addons:
  codeserver:
    enabled: true
    service:
      enabled: true
      type: LoadBalancer
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
          nodePort: 30067
```

### Ingress

```yaml
addons:
  codeserver:
    enabled: true
    service:
      enabled: true
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
      tls:
        - hosts:
            - code.chart-example.local
          secretName: code-example-tls
```

### Mount the volumes of the app

Mount a volume into the `codeserver` container, so the files can be edited:

```yaml
addons:
  codeserver:
    enabled: true

persistence:
  config:
    enabled: true
    type: pvc
    mountPath: /config
    targetSelector:
      main:
        main:
          mountPath: /config
        codeserver:
          mountPath: /config
```
