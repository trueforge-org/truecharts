---
title: Listenerset
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/listenerSet#full-examples) section for complete examples.

:::

## Appears in

- `.Values.listenerSet`

---

## `listenerSet`

Create Gateway API ListenerSet objects

| Field      | Value         |
| ---------- | ------------- |
| Key        | `listenerSet` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | unset         |

---

### `listenerSet.$name.annotations`

Additional annotations for ListenerSet

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `listenerSet.$name.annotations` |
| Type       | `map, string`                   |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `{}`                            |

Example

```yaml
listenerSet:
  $name:
    annotations:
      {}
```

---

### `listenerSet.$name.enabled`

Enables or Disables the ListenerSet

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `listenerSet.$name.enabled` |
| Type       | `boolean, string`           |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `false`                     |

Example

```yaml
listenerSet:
  $name:
    enabled: false
```

---

### `listenerSet.$name.expandObjectName`

Prefix the object name with the chart fullname

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `listenerSet.$name.expandObjectName` |
| Type       | `boolean, string`                    |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `true`                               |

Example

```yaml
listenerSet:
  $name:
    expandObjectName: true
```

---

### `listenerSet.$name.labels`

Additional labels for ListenerSet

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `listenerSet.$name.labels` |
| Type       | `map, string`              |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `{}`                       |

Example

```yaml
listenerSet:
  $name:
    labels:
      {}
```

---

### `listenerSet.$name.listeners`

Listeners that are added to the Gateway, same format as `gateway.$name.listeners`.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `listenerSet.$name.listeners` |
| Type       | `list of map`                 |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `listenerSet.$name.namespace`

Define the namespace for this object

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `listenerSet.$name.namespace` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `""`                          |

Example

```yaml
listenerSet:
  $name:
    namespace: ""
```

---

### `listenerSet.$name.parentRef`

The Gateway to attach to, when `targetSelector` is not used.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `listenerSet.$name.parentRef` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `listenerSet.$name.targetSelector`

Name of a gateway in this chart to attach to. Takes the place of `parentRef`, the gateway must set `allowedListeners.namespaces.from`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `listenerSet.$name.targetSelector` |
| Type       | `null, string`                     |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

## Full Examples

ListenerSets require Gateway API v1.4 or later. The Gateway must opt in by setting `allowedListeners`, otherwise the ListenerSet is rejected.

### Attach to a Gateway of this Chart

The `targetSelector` references a gateway defined in this chart, the chart validates that the gateway allows listener sets:

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    allowedListeners:
      namespaces:
        from: Same
    listeners:
      - name: http
        port: 80
        protocol: HTTP

listenerSet:
  https:
    enabled: true
    targetSelector: main
    listeners:
      - name: https
        hostname: app.example.com
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: app-tls
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: HTTPRoute
```

### Attach to a Shared Gateway in Another Namespace

Use `parentRef` for Gateways that are not managed by this chart. `name` and `namespace` support Helm `tpl`:

```yaml
listenerSet:
  main:
    enabled: true
    expandObjectName: false
    labels:
      key: value
    parentRef:
      name: shared-gateway
      namespace: infrastructure
    listeners:
      - name: app
        hostname: "{{ .Release.Name }}.example.com"
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: "{{ .Release.Name }}-tls"
```

---

## Attaching routes

Attach a route with [`route.$name.listenerSet`](/truecharts-common/route). Routes with `tls` or `integrations.certManager` create their own ListenerSet, and can't also select one. See [TLS with your own listener set](/truecharts-common/route#tls-with-your-own-listener-set).
