---
title: Gateway Class
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/gatewayClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.gatewayClass`

---

## `gatewayClass`

Gateway API GatewayClasses, keyed by name.

| Field | Value |
| --- | --- |
| Key | `gatewayClass` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A GatewayClass, keyed by name.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this GatewayClass. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Make this the primary GatewayClass of the chart. Only 1 can be primary.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations of the GatewayClass.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Additional labels of the GatewayClass.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.controllerName`

The name of the controller that will manage Gateways of this class.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.controllerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
gatewayClass:
  example:
    controllerName: traefik.io/gateway-controller
```

---

## `$name.description`

Human readable description of the GatewayClass.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
gatewayClass:
  example:
    description: Traefik-based gateway class
```

---

## `$name.parametersRef`

Reference to a resource with implementation specific parameters of the GatewayClass.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.parametersRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parametersRef.group`

API group of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.parametersRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.parametersRef.kind`

Kind of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.parametersRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.parametersRef.name`

Name of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.parametersRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.parametersRef.namespace`

Namespace of the parameters resource.

| Field | Value |
| --- | --- |
| Key | `gatewayClass.$name.parametersRef.namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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
