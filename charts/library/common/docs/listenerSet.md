---
title: Listener Set
---

:::note

- See the [Full Examples](/truecharts-common/listenerSet#full-examples) section for complete examples.

:::

## Appears in

- `.Values.listenerSet`

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

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Items | 1 to … |

---

## `$name.listeners[]`

A listener added to the Gateway, same format as a listener of a Gateway.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].name`

Name of the listener, unique within the Gateway.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.listeners[].hostname`

Hostname of the listener, supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].hostname` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.listeners[].port`

Port of the listener.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].port` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `$name.listeners[].protocol`

Protocol of the listener, eg `HTTP`, `HTTPS`, `TLS`, `TCP` or `UDP`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"`, `"TCP"`, `"TLS"`, `"UDP"` |

---

## `$name.listeners[].tls`

TLS settings of the listener.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.mode`

TLS mode, `Terminate` or `Passthrough`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Terminate"`, `"Passthrough"` |

---

## `$name.listeners[].tls.certificateRefs`

Certificates of the listener.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.certificateRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[]`

A reference to a certificate Secret.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.certificateRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[].group`

API group of the certificate, `""` for a Secret.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.certificateRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[].kind`

Kind of the certificate, eg `Secret`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.certificateRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.certificateRefs[].name`

Name of the certificate.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.certificateRefs[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

---

## `$name.listeners[].tls.certificateRefs[].namespace`

Namespace of the certificate.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.certificateRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.options`

Implementation specific TLS options. Passed as is.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.options` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].tls.options.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].tls.options.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes`

Routes that can attach to the listener.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces`

Namespaces routes can attach from.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.from`

Where routes can attach from: `All`, `Same` or `Selector`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.from` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Same"` |
| Allowed values | `"All"`, `"Same"`, `"Selector"` |

---

## `$name.listeners[].allowedRoutes.namespaces.selector`

Namespaces routes can attach from, by labels, with `from: Selector`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.namespaces.selector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds`

Route kinds that can attach.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.kinds` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds[]`

A route kind that can attach.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.kinds[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds[].group`

API group of the kind.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.kinds[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.listeners[].allowedRoutes.kinds[].kind`

Kind of the route, eg `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `listenerSet.$name.listeners[].allowedRoutes.kinds[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | 1 to … |

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
