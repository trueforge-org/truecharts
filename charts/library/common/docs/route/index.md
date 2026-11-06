---
title: Route
---

:::note

- See the [Full Examples](/truecharts-common/route#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route`

---

## Child Pages

- [rules](/truecharts-common/route/rules)

---

## `route`

Gateway API routes (HTTPRoute, GRPCRoute, TCPRoute, TLSRoute, UDPRoute), keyed by name. See [route](/truecharts-common/route).

| Field | Value |
| --- | --- |
| Key | `route` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A Gateway API route, keyed by name.

| Field | Value |
| --- | --- |
| Key | `route.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this route.

| Field | Value |
| --- | --- |
| Key | `route.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.primary`

Make this the primary route. It is used as the default route name when no `nameOverride` is set. When none is primary, the first enabled route is used.

| Field | Value |
| --- | --- |
| Key | `route.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.kind`

Kind of the route: `HTTPRoute`, `GRPCRoute`, `TCPRoute`, `TLSRoute` or `UDPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"HTTPRoute"` |
| Allowed values | `"GRPCRoute"`, `"HTTPRoute"`, `"TCPRoute"`, `"TLSRoute"`, `"UDPRoute"` |

---

## `$name.annotations`

Additional annotations, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.labels`

Additional labels, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.nameOverride`

Name appended to the chart fullname for this route. Defaults to the name of the route, except for the primary route.

| Field | Value |
| --- | --- |
| Key | `route.$name.nameOverride` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs`

Gateways the route attaches to.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[]`

A Gateway the route attaches to.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].group`

API group of the parent.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"gateway.networking.k8s.io"` |

---

## `$name.parentRefs[].kind`

Kind of the parent.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Gateway"` |

---

## `$name.parentRefs[].name`

Name of the Gateway.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].name` |
| Type | `null or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].namespace`

Namespace of the Gateway.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].namespace` |
| Type | `null or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].sectionName`

Attach to a single listener of the Gateway.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].sectionName` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.hostnames`

Host addresses. Not used by `TCPRoute` and `UDPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.hostnames` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.rules`

Routing rules.

See [rules](/truecharts-common/route/rules) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### HTTPRoute on a gateway

Attaches the primary service to a listener of a gateway that runs outside the chart:

```yaml
route:
  main:
    enabled: true
    primary: true
    parentRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: external
        namespace: networking
        sectionName: https
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - port: 8080
        matches:
          - path:
              type: PathPrefix
              value: /
```

### HTTPRoute with matches

Sends requests for `api.example.com/v2` with a matching header and query parameter to the primary service:

```yaml
route:
  api:
    enabled: true
    nameOverride: api
    labels:
      team: backend
    annotations:
      example.com/owner: backend
    parentRefs:
      - name: external
        namespace: networking
        sectionName: https
    hostnames:
      - api.example.com
    rules:
      - matches:
          - path:
              type: PathPrefix
              value: /v2
            headers:
              - name: X-Api-Version
                type: Exact
                value: "2"
            queryParams:
              - name: debug
                type: Exact
                value: "true"
            method: GET
        backendRefs:
          - port: 8080
            weight: 1
```

### GRPCRoute

```yaml
route:
  grpc:
    enabled: true
    kind: GRPCRoute
    parentRefs:
      - name: external
        namespace: networking
        sectionName: grpc
    hostnames:
      - grpc.example.com
    rules:
      - backendRefs:
          - port: 50051
```

### TCPRoute

Routes a TCP port of a gateway listener to the primary service. Hostnames are not used by `TCPRoute`:

```yaml
route:
  mqtt:
    enabled: true
    kind: TCPRoute
    parentRefs:
      - name: external
        namespace: networking
        sectionName: mqtt
    rules:
      - backendRefs:
          - port: 1883
```
