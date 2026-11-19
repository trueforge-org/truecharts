## Full Examples

### Basic GatewayClass

```yaml
gatewayClass:
  main:
    enabled: true
    controllerName: traefik.io/gateway-controller
```

### GatewayClass with Description

```yaml
gatewayClass:
  main:
    enabled: true
    controllerName: traefik.io/gateway-controller
    description: "Traefik-based gateway class for HTTP/HTTPS traffic"
```

### GatewayClass with ParametersRef

```yaml
gatewayClass:
  main:
    enabled: true
    controllerName: traefik.io/gateway-controller
    parametersRef:
      group: traefik.io
      kind: GatewayClassConfig
      name: traefik-config
      namespace: traefik-system
```

### Using GatewayClass with Gateway via targetSelector

```yaml
gatewayClass:
  main:
    enabled: true
    controllerName: traefik.io/gateway-controller

gateway:
  main:
    enabled: true
    targetSelector: main  # Automatically links to gatewayClass.main
    listeners:
      - name: http
        port: 80
        protocol: HTTP
```

### Multiple GatewayClasses

```yaml
gatewayClass:
  traefik:
    enabled: true
    controllerName: traefik.io/gateway-controller
    description: "Traefik gateway class"

  nginx:
    enabled: true
    controllerName: nginx.org/gateway-controller
    description: "NGINX gateway class"

gateway:
  traefik-gw:
    enabled: true
    targetSelector: traefik  # Links to gatewayClass.traefik
    listeners:
      - name: http
        port: 80
        protocol: HTTP

  nginx-gw:
    enabled: true
    targetSelector: nginx  # Links to gatewayClass.nginx
    listeners:
      - name: https
        port: 443
        protocol: HTTPS
```
