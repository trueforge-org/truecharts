---
title: Listener Set
---

:::note

- See the [Full Examples](/truecharts-common/listenerSet#full-examples) section for complete examples.

:::

## Appears in

- `.Values.listenerSet`

---

## Child Pages

- [listeners](/truecharts-common/listenerSet/listeners)

---

## `listenerSet`

Gateway API ListenerSets, keyed by name. Each one adds listeners to an existing Gateway.

| Field | Value |
| --- | --- |
| Key | `listenerSet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A ListenerSet, keyed by name.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this ListenerSet. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.expandObjectName`

Prefix the name of the ListenerSet with the release fullname.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `$name.namespace`

Namespace of the ListenerSet. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.labels`

Additional labels of the ListenerSet.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations of the ListenerSet.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.targetSelector`

Name of a gateway in this chart to attach to. Takes the place of `parentRef`, the gateway must set `allowedListeners.namespaces.from`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.targetSelector` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRef`

The Gateway to attach to, when `targetSelector` is not used.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.parentRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRef.group`

API group of the parent Gateway.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.parentRef.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"gateway.networking.k8s.io"` |

---

## `$name.parentRef.kind`

Kind of the parent.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.parentRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Gateway"` |

---

## `$name.parentRef.name`

Name of the parent Gateway, supports Helm `tpl`. Required unless `targetSelector` is set.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.parentRef.name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRef.namespace`

Namespace of the parent Gateway, supports Helm `tpl`. Defaults to the namespace of the listener set.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.parentRef.namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners`

Listeners that are added to the Gateway, same format as `gateway.$name.listeners`.

See [listeners](/truecharts-common/listenerSet/listeners) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

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
