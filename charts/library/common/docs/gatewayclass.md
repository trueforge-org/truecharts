---
title: GatewayClass
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/gatewayclass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.gatewayClass`

---

## `gatewayClass`

Configuration for `gatewayClass`.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `gatewayClass` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

### `gatewayClass.$name.annotations`

Configuration for `gatewayClass.main.annotations`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `gatewayClass.$name.annotations`   |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `gatewayClass.$name.enabled`

Configuration for `gatewayClass.main.enabled`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `gatewayClass.$name.enabled`   |
| Type       | `boolean, string`              |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `false`                        |

Example

```yaml
gatewayClass:
  $name:
    enabled: false
```

---

### `gatewayClass.$name.labels`

Configuration for `gatewayClass.main.labels`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `gatewayClass.$name.labels`     |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `gatewayClass.$name.controllerName`

Configuration for `gatewayClass.main.controllerName`. The name of the controller that will manage Gateways of this class.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `gatewayClass.$name.controllerName`    |
| Type       | `string`                               |
| Required   | ✅ (when gatewayClass is enabled)      |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

Example

```yaml
gatewayClass:
  $name:
    controllerName: traefik.io/gateway-controller
```

---

### `gatewayClass.$name.description`

Configuration for `gatewayClass.main.description`. Description helps describe a GatewayClass with more details.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `gatewayClass.$name.description`    |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

Example

```yaml
gatewayClass:
  $name:
    description: "Traefik-based gateway class"
```

---

### `gatewayClass.$name.parametersRef`

Configuration for `gatewayClass.main.parametersRef`. ParametersRef is a reference to a resource that contains the configuration parameters corresponding to the GatewayClass.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `gatewayClass.$name.parametersRef`   |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

Fields for parametersRef:
- `group`: API group of the referenced resource (required)
- `kind`: Kind of the referenced resource (required)
- `name`: Name of the referenced resource (required)
- `namespace`: Optional namespace of the referenced resource

---

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
