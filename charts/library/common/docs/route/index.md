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

- [integrations](/truecharts-common/route/integrations)
- [parentRefs](/truecharts-common/route/parentRefs)
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

Create this route. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `route.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Make this the primary route, used in notes and the chart context. Only 1 route can be primary.

| Field | Value |
| --- | --- |
| Key | `route.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `$name.required`

Fail rendering if this route is disabled, unless an ingress is enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.required` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.expandObjectName`

Prefix the name of the route with the name of the release and chart.

| Field | Value |
| --- | --- |
| Key | `route.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

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
| Default | unset |

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
| Default | unset |

---

## `$name.namespace`

Namespace of the route. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.gateway`

Name of a gateway outside of this chart. Replaces `parentRefs`. Cannot be used with a `targetSelector` string.

| Field | Value |
| --- | --- |
| Key | `route.$name.gateway` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.listenerSet`

Name of a `listenerSet` of this chart to attach to. Replaces `parentRefs`. Cannot be used with `gateway`, a `targetSelector` string, `tls` or `integrations.certManager`.

| Field | Value |
| --- | --- |
| Key | `route.$name.listenerSet` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.gatewayNamespace`

Namespace of `gateway`. Defaults to the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.gatewayNamespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.targetSelector`

A string selects a gateway in this chart and replaces `parentRefs`. A map of `service: port` selects the default backend, same as an ingress.

| Field | Value |
| --- | --- |
| Key | `route.$name.targetSelector` |
| Type | `null or string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector.$name`

Name of the port of the Service.

| Field | Value |
| --- | --- |
| Key | `route.$name.targetSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs`

Gateways or ListenerSets the route attaches to.

See [parentRefs](/truecharts-common/route/parentRefs) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.hostnames`

Host addresses, supports Helm `tpl`. Required for `TLSRoute`, not supported by `TCPRoute` and `UDPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.hostnames` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `[]` |

---

## `$name.tls`

TLS for this route. Creates a ListenerSet on the selected gateway and attaches the route to it. Needs `gateway` or a `targetSelector` string. Only for `HTTPRoute` and `GRPCRoute`. Ignored when `integrations.certManager` is enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.tls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls[]`

A TLS certificate for the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.tls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls[].hosts`

Hostnames of this certificate. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `route.$name.tls[].hosts` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.tls[].secretName`

Existing secret to use. Supports Helm `tpl`. Exactly one of `secretName`, `certificateIssuer` and `clusterCertificate`.

| Field | Value |
| --- | --- |
| Key | `route.$name.tls[].secretName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.tls[].certificateIssuer`

ClusterIssuer to create a Certificate with.

| Field | Value |
| --- | --- |
| Key | `route.$name.tls[].certificateIssuer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls[].clusterCertificate`

Name of a cluster certificate to use.

| Field | Value |
| --- | --- |
| Key | `route.$name.tls[].clusterCertificate` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.listenerPort`

Port of the listeners created for `tls` and `integrations.certManager`. Defaults to `global.fallbackDefaults.routeListenerPort`.

| Field | Value |
| --- | --- |
| Key | `route.$name.listenerPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `$name.integrations`

Integrations of this route. `certManager`, `envoy`, `homepage` and `traefik` are supported, any other fails rendering.

See [integrations](/truecharts-common/route/integrations) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules`

Routing rules. Without rules everything goes to the primary service. Fields the route kind does not support fail rendering.

See [rules](/truecharts-common/route/rules) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nameOverride`

Name appended to the chart fullname for this route instead of the object name. Only applies when `expandObjectName` is enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.nameOverride` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## Full Examples

```yaml
route:
  main:
    enabled: true
    kind: HTTPRoute
    parentRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: main
        namespace: default
    hostnames:
      - app.example.com
    rules:
      - backendRefs:
          - kind: Service
            name: main
            port: 80
        matches:
          - path:
              type: PathPrefix
              value: /

  # Attaches to a listener of a gateway in this chart, with filters and a canary backend
  web:
    enabled: true
    parentRefs:
      - targetSelector: main
        sectionName: https
    hostnames:
      - "{{ .Release.Name }}.example.com"
    rules:
      - name: api
        matches:
          - path:
              type: PathPrefix
              value: /api
        timeouts:
          request: 30s
        filters:
          - type: RequestHeaderModifier
            requestHeaderModifier:
              add:
                - name: X-Example
                  value: example
        backendRefs:
          - targetSelector: main
            weight: 90
          - targetSelector: canary
            weight: 10

  # Redirect without a backend
  redirect:
    enabled: true
    parentRefs:
      - targetSelector: main
        sectionName: http
    rules:
      - filters:
          - type: RequestRedirect
            requestRedirect:
              scheme: https
              statusCode: 301

  # Other route kinds only have backendRefs in their rules
  mqtt:
    enabled: true
    kind: TCPRoute
    parentRefs:
      - targetSelector: main
        sectionName: mqtt
    rules:
      - backendRefs:
          - targetSelector: mqtt
```

### HTTPRoute with matches, timeouts, retry and session persistence

```yaml
route:
  api:
    enabled: true
    kind: HTTPRoute
    labels:
      key: value
    annotations:
      key: value
    parentRefs:
      - name: external
        namespace: networking
        sectionName: https
    hostnames:
      - api.example.com
    rules:
      - name: v2
        matches:
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
        timeouts:
          request: 30s
          backendRequest: 10s
        retry:
          attempts: 3
          backoff: 100ms
          codes:
            - 502
            - 503
        sessionPersistence:
          sessionName: api-session
          type: Cookie
          absoluteTimeout: 1h
        backendRefs:
          - targetSelector: main
            port: 8080
```

### GRPCRoute

```yaml
route:
  grpc:
    enabled: true
    kind: GRPCRoute
    parentRefs:
      - targetSelector: main
        sectionName: https
    hostnames:
      - grpc.example.com
    rules:
      - matches:
          - method:
              service: my.package.Greeter
              method: SayHello
        backendRefs:
          - targetSelector: grpc
```

### TLSRoute

```yaml
route:
  passthrough:
    enabled: true
    kind: TLSRoute
    parentRefs:
      - targetSelector: main
        sectionName: tls-passthrough
    hostnames:
      - secure.example.com
    rules:
      - backendRefs:
          - targetSelector: main
```

### UDPRoute

```yaml
route:
  dns:
    enabled: true
    kind: UDPRoute
    parentRefs:
      - targetSelector: main
        sectionName: dns
    rules:
      - backendRefs:
          - targetSelector: dns
```

### Select the gateway by name and add TLS

```yaml
route:
  main:
    enabled: true
    gateway: external
    gatewayNamespace: networking
    listenerPort: 443
    hostnames:
      - app.example.com
    tls:
      - hosts:
          - app.example.com
        secretName: app-example-com-tls
```

### Integrations

```yaml
route:
  main:
    enabled: true
    gateway: external
    hostnames:
      - app.example.com
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
      homepage:
        enabled: true
        name: My App
        description: An example app
        group: Apps
        icon: mdi-application
      traefik:
        enabled: true
        ipWhitelist:
          - 192.168.0.0/16
        ipStrategy:
          depth: 1
        auth:
          type: authelia
          internalHost: authelia.auth.svc.cluster.local
          responseHeaders:
            - Remote-User
        themePark:
          enabled: true
          app: sonarr
          theme: dark
        redirectRegex:
          - regex: ^/old/(.*)
            replacement: https://app.example.com/new/${1}
            permanent: true
        middlewares:
          - name: my-middleware
```

### Envoy Gateway integration

```yaml
route:
  main:
    enabled: true
    gateway: external
    hostnames:
      - app.example.com
    integrations:
      envoy:
        enabled: true
        ipWhitelist:
          - 192.168.0.0/16
        auth:
          type: authentik
          internalHost: authentik.auth.svc.cluster.local
        redirectRegex:
          - regex: ^/old/(.*)
            replacement: https://app.example.com/new
            permanent: true
```

## Supported fields per kind

Fields a kind does not support fail rendering, because dropping them would change what the route matches.

| Field | HTTPRoute | GRPCRoute | TLSRoute | TCPRoute | UDPRoute |
| --- | --- | --- | --- | --- | --- |
| `hostnames` | ✅ | ✅ | Required | ❌ | ❌ |
| `rules[].backendRefs`, `rules[].name` | ✅ | ✅ | ✅ | ✅ | ✅ |
| `rules[].matches`, `rules[].filters` | ✅ | ✅ | ❌ | ❌ | ❌ |
| `rules[].backendRefs[].filters` | ✅ | ✅ | ❌ | ❌ | ❌ |
| `rules[].sessionPersistence` (experimental) | ✅ | ✅ | ❌ | ❌ | ❌ |
| `rules[].timeouts`, `rules[].retry` | ✅ | ❌ | ❌ | ❌ | ❌ |

## API version

`HTTPRoute` and `GRPCRoute` use `gateway.networking.k8s.io/v1`. `TCPRoute`, `TLSRoute` and `UDPRoute` use `v1` if the cluster serves it, otherwise `v1alpha3` or `v1alpha2`. When rendering without a cluster they use `v1`, unless you pass `--api-versions`.

## TLS

A route has no certificate of its own, so a route with TLS attaches to a `ListenerSet` on the selected gateway. The certificate stays with the app, without editing the shared gateway.

Routes that share a hostname share one listener and one certificate, so you can split a hostname by path, same as several ingresses. Set the same TLS on all of them, and the longest matching path wins:

```yaml
route:
  main:
    enabled: true
    gateway: external
    hostnames:
      - app.example.com
    integrations: &tls
      certManager:
        enabled: true
        certificateIssuer: my-issuer
  admin:
    enabled: true
    primary: false
    gateway: external
    hostnames:
      - app.example.com
    integrations: *tls
    rules:
      - matches:
          - path:
              type: PathPrefix
              value: /admin
```

Rendering fails if routes on a hostname disagree on the TLS. This only works within a chart: a listener for the same hostname and port from another release conflicts on the gateway, where the oldest one wins.

```yaml
route:
  main:
    enabled: true
    gateway: external
    gatewayNamespace: networking
    hostnames:
      - app.example.com
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
```

This needs:

- Gateway API v1.5 or newer. Rendering fails if the `ListenerSet` API is not found. When rendering without access to a cluster, pass `--api-versions gateway.networking.k8s.io/v1/ListenerSet`.
- A gateway provider with `ListenerSet` support. Envoy Gateway v1.9 or newer, or Traefik 3.8 or newer. On an older provider the route does not attach to anything, and rendering cannot detect that.
- The gateway must accept `ListenerSets`, which it does not by default. Set `allowedListeners.namespaces.from` on it. Rendering checks this for a gateway in this chart, but cannot for one outside of it.
- For `integrations.certManager`, cert-manager 1.20 or newer, where this is an alpha feature. Set `config.gatewayAPI.enabled`, `config.gatewayAPI.enableListenerSet` and `config.featureGates.ListenerSets` to `true`.

The listener port defaults to `global.fallbackDefaults.routeListenerPort`, which is `443`, and `listenerPort` overrides it per route. Traefik requires this to be the port of its entrypoint, which is not always the port it is exposed on.

Traefik keeps all certificates in one store and selects them by hostname across all listeners. Any namespace allowed by `allowedListeners` can therefore supply a certificate for a hostname on that gateway, so only allow namespaces you trust.

`tls` works without that cert-manager feature, as `certificateIssuer` creates the `Certificate` directly.

### TLS with your own listener set

`tls` and `integrations.certManager` create a ListenerSet for you, per gateway and port. To control the listeners yourself, define a [`listenerSet`](/truecharts-common/listenerSet) and attach the route to it with `route.$name.listenerSet`.

A route can't use both. Rendering also fails if a generated ListenerSet has the same name as one of yours, or if both use the same hostname and port on a gateway, because listeners conflict on a gateway and the oldest one wins. Only listener sets and routes in the same chart can be checked.

```yaml
listenerSet:
  main:
    enabled: true
    parentRef:
      name: external
      namespace: networking
    listeners:
      - name: https
        hostname: app.example.com
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: my-certificate
        allowedRoutes:
          namespaces:
            from: Same

route:
  main:
    enabled: true
    listenerSet: main
    hostnames:
      - app.example.com
```

## Migrating from an ingress

| Ingress | Route |
| --- | --- |
| `ingressClassName` | `gateway` and `gatewayNamespace` |
| `targetSelector` (`service: port`) | `targetSelector`, in the same form |
| `hosts[].host` | `hostnames` |
| `hosts[].paths[]` | `rules[].matches[].path` |
| `hosts[].paths[].overrideService` | `rules[].backendRefs[]` |
| `tls` | `tls`, in the same form |
| `integrations.certManager` | `integrations.certManager`, in the same form |
| `integrations.homepage` | `integrations.homepage`, in the same form. Only `HTTPRoute` |
| `integrations.traefik` | `integrations.traefik`, see [Integrations](#integrations) |
| `integrations.nginx` | `integrations.traefik` or `integrations.envoy`. `nginx` fails rendering. |
| `primary`, `required`, `expandObjectName`, `labels`, `annotations` | Same |

An ingress also gets an HTTP to HTTPS redirect from some controllers. A route does not, add it on the gateway.

## Integrations

An ingress configures its controller with annotations. Gateway API has no equivalent for those: a route uses filters, and policies that target it. So each provider has its own integration, and a route can only use one.

| Feature | `integrations.traefik` | `integrations.envoy` |
| --- | --- | --- |
| `auth` Authelia | `Middleware`, `/api/authz/forward-auth` | `SecurityPolicy`, `/api/authz/ext-authz/` |
| `auth` Authentik | `Middleware`, `/outpost.goauthentik.io/auth/traefik` | `SecurityPolicy`, `/outpost.goauthentik.io/auth/envoy` |
| `ipWhitelist` | `Middleware` | `SecurityPolicy` |
| `themePark` | `Middleware`, with `app` and `theme` | `EnvoyExtensionPolicy`, with `css` |
| `redirectRegex` | A route rule and `Middleware`, with capture groups | A route rule, **without capture groups** |

These apply to the whole route. To protect one path, give it its own route, as shown under [TLS](#tls).

`redirectRegex` works the same on both. Each entry is its own rule in front of the other rules of the route, so a request is redirected even if no other rule matches its path. The regex must match the whole path, and `ipWhitelist` and `auth` also apply to it:

```yaml
redirectRegex:
  - regex: ^/old/(.*)
    replacement: https://example.com/new/${1} # Traefik only, Envoy Gateway needs a fixed target
    permanent: true
```

### Anything else

- **Traefik:** define any middleware under `ingressMiddlewares.traefik`, and list it in `integrations.traefik.middlewares`, same as an ingress.
- **Envoy Gateway:** set `securityPolicy`, `backendTrafficPolicy` or `extensionPolicy` to the spec of that policy, without a target. Envoy Gateway only applies the oldest policy of a kind on a route, so do not add your own policy of a kind this route already has. A separate policy could silently replace the auth of this integration.
- **Both:** `rules[].filters` accepts an `ExtensionRef` filter, and `extraTpl` can create what it references.

### Things to check

- **Client IPs:** `ipWhitelist` checks the address the provider sees. Behind a load balancer or proxy, configure `ipStrategy` on Traefik, or a `ClientTrafficPolicy` with `clientIPDetection` on Envoy Gateway, or the allow-list checks the wrong address.
- **Envoy Gateway auth in another namespace** needs a `ReferenceGrant` in that namespace. Until it exists, requests are denied.
- **Envoy Gateway routes on a ListenerSet:** use v1.9 or newer, as [v1.8 ignored policies on them](https://github.com/envoyproxy/gateway/issues/9242). Check that an unauthenticated request is actually blocked.
- **Envoy Gateway `themePark`** disables compression on the route, and buffers HTML responses to edit them. Envoy will not buffer more than its connection limit allows, so very large pages can fail.
- **Traefik `themePark`** needs the plugin installed in Traefik.

## Not rendered by common

`BackendTLSPolicy` and `ReferenceGrant` have no dedicated key yet. Use `extraTpl` for these. Without a `BackendTLSPolicy`, a route sends plain HTTP to its backend, even if the service port is `https`.
