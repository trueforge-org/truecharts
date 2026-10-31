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

## Supported fields per kind

Fields a kind does not support fail rendering, because dropping them would change what the route matches.

| Field                                       | HTTPRoute | GRPCRoute | TLSRoute | TCPRoute | UDPRoute |
| ------------------------------------------- | --------- | --------- | -------- | -------- | -------- |
| `hostnames`                                 | ✅        | ✅        | Required | ❌       | ❌       |
| `rules[].backendRefs`, `rules[].name`       | ✅        | ✅        | ✅       | ✅       | ✅       |
| `rules[].matches`, `rules[].filters`        | ✅        | ✅        | ❌       | ❌       | ❌       |
| `rules[].backendRefs[].filters`             | ✅        | ✅        | ❌       | ❌       | ❌       |
| `rules[].sessionPersistence` (experimental) | ✅        | ✅        | ❌       | ❌       | ❌       |
| `rules[].timeouts`, `rules[].retry`         | ✅        | ❌        | ❌       | ❌       | ❌       |

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

## Migrating from an ingress

| Ingress                                  | Route                                                       |
| ---------------------------------------- | ----------------------------------------------------------- |
| `ingressClassName`                       | `gateway` and `gatewayNamespace`                            |
| `targetSelector` (`service: port`)       | `targetSelector`, in the same form                          |
| `hosts[].host`                           | `hostnames`                                                 |
| `hosts[].paths[]`                        | `rules[].matches[].path`                                    |
| `hosts[].paths[].overrideService`        | `rules[].backendRefs[]`                                     |
| `tls`                                    | `tls`, in the same form                                     |
| `integrations.certManager`               | `integrations.certManager`, in the same form                |
| `integrations.homepage`                  | `integrations.homepage`, in the same form. Only `HTTPRoute` |
| `integrations.traefik`                   | `integrations.traefik`, see [Integrations](#integrations)   |
| `integrations.nginx`                     | `integrations.traefik` or `integrations.envoy`. `nginx` fails rendering. |
| `primary`, `required`, `expandObjectName`, `labels`, `annotations` | Same                              |

An ingress also gets an HTTP to HTTPS redirect from some controllers. A route does not, add it on the gateway.

## Integrations

An ingress configures its controller with annotations. Gateway API has no equivalent for those: a route uses filters, and policies that target it. So each provider has its own integration, and a route can only use one.

| Feature          | `integrations.traefik`                   | `integrations.envoy`                         |
| ---------------- | ---------------------------------------- | -------------------------------------------- |
| `auth` Authelia  | `Middleware`, `/api/authz/forward-auth`  | `SecurityPolicy`, `/api/authz/ext-authz/`    |
| `auth` Authentik | `Middleware`, `/outpost.goauthentik.io/auth/traefik` | `SecurityPolicy`, `/outpost.goauthentik.io/auth/envoy` |
| `ipWhitelist`    | `Middleware`                             | `SecurityPolicy`                             |
| `themePark`      | `Middleware`, with `app` and `theme`     | `EnvoyExtensionPolicy`, with `css`           |
| `redirectRegex`  | A route rule and `Middleware`, with capture groups | A route rule, **without capture groups** |

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
