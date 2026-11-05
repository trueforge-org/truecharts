## Full Examples

### Enable an addon

An addon adds a container, and for some addons objects like a service, to the workloads. Every addon is enabled with `enabled`, and `targetSelector` lists the workloads it is added to (`main` when not set):

```yaml
addons:
  netshoot:
    enabled: true
    targetSelector:
      - main
      - other-workload
```

### Several addons

Each addon has its own image on the root of the values, for example `netshootImage` and `tailscaleImage`, see [Image](/truecharts-common/image):

```yaml
addons:
  netshoot:
    enabled: true
  tailscale:
    enabled: true
    settings:
      authkey: tskey-auth-placeholder
      routes: 10.0.0.0/8
  gluetun:
    enabled: true
    container:
      env:
        VPN_SERVICE_PROVIDER: custom
        VPN_TYPE: wireguard
```

### Container options

The `container` of every addon takes the options of an addon container, see [Addon Container](/truecharts-common/addons/container):

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
```

### Code server with service and ingress

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

### Code server with a route

The code-server addon can also use a Gateway API route instead of an ingress. It is a route the same as `route.<name>`, so it supports `tls`, `listenerSet` and the integrations. With per domain certificates, its listener is added to the same ListenerSet as the listeners of the other routes on the gateway:

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
