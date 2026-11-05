---
title: Route
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/route#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route`

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

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[]`

A Gateway or ListenerSet the route attaches to.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].group`

API group of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].kind`

Kind of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].name`

Name of the parent.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.parentRefs[].namespace`

Namespace of the parent. Defaults to the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.parentRefs[].sectionName`

Attach to a single listener of the gateway. With `targetSelector` it must be a listener of that gateway.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].sectionName` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.parentRefs[].targetSelector`

Name of a gateway in this chart. Takes the place of `name` and `namespace`.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].targetSelector` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parentRefs[].port`

Attach to the listeners of the gateway on this port.

| Field | Value |
| --- | --- |
| Key | `route.$name.parentRefs[].port` |
| Type | `null or int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
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

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.certManager`

Issue a certificate per hostname, same as an ingress. Sets the annotations on the created ListenerSet. Needs cert-manager 1.20 or newer, with ListenerSet support enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.certManager` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.certManager.enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.certManager.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.integrations.certManager.certificateIssuer`

Name of the ClusterIssuer.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.certManager.certificateIssuer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage`

Add the annotations for Homepage service discovery, same as an ingress. Only for `HTTPRoute`. Needs `gateway: true` in the `kubernetes.yaml` of Homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.integrations.homepage.name`

Name of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage.description`

Description of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage.group`

Group of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage.icon`

Icon of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.icon` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage.href`

Href of the entry on the homepage. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.href` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.weight`

Weight of the entry on the homepage, used for sorting within its group.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.podSelector`

Names of the pods to check for the status of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.podSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget`

Widget of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.enabled`

Enables or Disables the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.version`

Version of the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.version` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.type`

Type of the widget. Sets the `gethomepage.dev/widget.type` annotation.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.type` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage.widget.url`

URL of the widget. Defaults to the first host of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.homepage.widget.custom`

Custom settings of the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.custom` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.custom.$name`

Value of the widget setting. Supports Helm `tpl`, empty values are skipped.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.custom.$name` |
| Type | `number or bool or null` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.integrations.homepage.widget.customkv`

Custom settings of the widget, as a list of `key` and `value`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv` |
| Type | `list of map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.customkv[]`

A custom setting of the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.customkv[].key`

Name of the setting. Sets the `gethomepage.dev/widget.$key` annotation.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.homepage.widget.customkv[].value`

Value of the setting.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik`

Traefik `Middleware` objects attached to the route as `ExtensionRef` filters. Only for `HTTPRoute` and `GRPCRoute`. Needs the kubernetesCRD provider of Traefik enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.integrations.traefik.ipWhitelist`

Allowed source IPs, everything else is rejected.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipWhitelist` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.ipStrategy`

How Traefik determines the source IP.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.ipStrategy.depth`

Position of the IP to use in `X-Forwarded-For`, counted from the right.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy.depth` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.ipStrategy.excludedIPs`

IPs to skip in `X-Forwarded-For`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy.excludedIPs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.ipStrategy.ipv6Subnet`

Prefix length to group IPv6 addresses by.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.ipStrategy.ipv6Subnet` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.auth`

Authentication through Authelia or Authentik.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.auth.type`

Auth provider, empty to disable.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `""`, `"authentik"`, `"authelia"` |

---

## `$name.integrations.traefik.auth.internalHost`

Internal domain name and port of the auth provider, excluding http(s).

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth.internalHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.integrations.traefik.auth.responseHeaders`

Override the default response headers passed on to the app.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.auth.responseHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.themePark`

Theme park plugin, needs the plugin installed in Traefik. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.themePark.enabled`

Enable the theme.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.integrations.traefik.themePark.app`

Name of the theme.park app.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark.app` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.traefik.themePark.theme`

Name of the theme.park theme.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.themePark.theme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.integrations.traefik.redirectRegex`

List of `regex`, `replacement` and `permanent`. Only for `HTTPRoute`. The regex must match the whole path, and each one is its own rule. The replacement can use capture groups.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.redirectRegex[]`

A redirect rule of the traefik integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.redirectRegex[].regex`

Regex matching the whole path of the request. The `^` and `$` anchors are optional.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[].regex` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.redirectRegex[].replacement`

URL to redirect to. Can use capture groups from the regex.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[].replacement` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.redirectRegex[].permanent`

Use a permanent redirect (301) instead of a temporary one (302).

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.redirectRegex[].permanent` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.middlewares`

Other middlewares from `ingressMiddlewares.traefik`, same as an ingress.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.middlewares[]`

A middleware of the traefik integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.middlewares[].name`

Name of the middleware. If expanded, it must be defined under `ingressMiddlewares.traefik`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.middlewares[].namespace`

Namespace of the middleware. It must be the same as the route, which is also the default.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[].namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.middlewares[].expandObjectName`

Whether to expand the name with the chart name. Defaults to `true`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.middlewares[].expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.traefik.chartMiddlewares`

Middlewares set by the chart, same as an ingress.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik.chartMiddlewares` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy`

Envoy Gateway policies that target the route. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.integrations.envoy.ipWhitelist`

Allowed source IPs, everything else is rejected.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.ipWhitelist` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.auth`

Authentication through Authelia or Authentik.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.auth.type`

Auth provider, empty to disable.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `""`, `"authentik"`, `"authelia"` |

---

## `$name.integrations.envoy.auth.internalHost`

`service:port` or `service.namespace.svc.cluster.local:port`. A service in another namespace needs a `ReferenceGrant` in that namespace.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth.internalHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.integrations.envoy.auth.responseHeaders`

Override the default response headers passed on to the app.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.auth.responseHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.themePark`

`css` URL added to HTML responses with Lua. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.themePark` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.themePark.enabled`

Enable the theme.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.themePark.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.integrations.envoy.themePark.css`

URL of the CSS file added to HTML responses.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.themePark.css` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.integrations.envoy.redirectRegex`

List of `regex`, `replacement` and `permanent`. Only for `HTTPRoute`. The regex must match the whole path, and each one is its own rule. The replacement must be a fixed target without capture groups.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.redirectRegex[]`

A redirect rule of the envoy integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.redirectRegex[].regex`

Regex matching the whole path of the request.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[].regex` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.redirectRegex[].replacement`

Fixed URL to redirect to. Capture groups, a query and a fragment are not supported.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[].replacement` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.redirectRegex[].permanent`

Use a permanent redirect (301) instead of a temporary one (302).

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.redirectRegex[].permanent` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.securityPolicy`

Other `SecurityPolicy` settings, without a target. Merged with `ipWhitelist` and `auth`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.securityPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.securityPolicy.$name`

A setting of the policy, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.securityPolicy.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.backendTrafficPolicy`

`BackendTrafficPolicy` settings, without a target.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.backendTrafficPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.backendTrafficPolicy.$name`

A setting of the policy, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.backendTrafficPolicy.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.extensionPolicy`

`EnvoyExtensionPolicy` settings, without a target. Merged with `themePark`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.extensionPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.integrations.envoy.extensionPolicy.$name`

A setting of the policy, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy.extensionPolicy.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules`

Routing rules. Without rules everything goes to the primary service. Fields the route kind does not support fail rendering.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[]`

A routing rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs`

Where to send requests. Without this and without `filters`, the rule uses the primary service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[]`

A backend the requests are sent to.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].group`

API group of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].kind`

Kind of the parent or backend.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].name`

Name of the object, without any expanding. Cannot be used with `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].namespace`

Namespace of the backend. Defaults to the namespace of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].namespace` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].port`

Port of the backend. Defaults to the primary port of the selected service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].port` |
| Type | `null or int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].weight`

Share of the requests for this backend. Set to `0` to stop sending traffic to it. Defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].targetSelector`

Name of a service in this chart, or a map of `service: port` to select a port by name. Cannot be used with `name`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].targetSelector` |
| Type | `null or string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].targetSelector.$name`

Name of the port of the Service.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].targetSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].filters`

Filters applied only to this backend. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].filters[]`

A filter applied to this backend only.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].backendRefs[].filters[].$name`

A setting of the filter, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs[].filters[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches`

Conditions for matching requests. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[]`

A condition that a request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].path`

Path condition for the match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].path.type`

How the path is matched: `PathPrefix`, `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"PathPrefix"`, `"RegularExpression"` |

---

## `$name.rules[].matches[].path.value`

Path that is matched. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].path.value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].headers`

Headers the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].headers[]`

A header the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].headers[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].headers[].value`

Value that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].headers[].type`

How the value is matched: `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].headers[].type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"RegularExpression"` |

---

## `$name.rules[].matches[].queryParams`

Query parameters the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].queryParams[]`

A query parameter the request has to match.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].queryParams[].name`

Name of the query parameter.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].queryParams[].value`

Value that is matched.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].matches[].queryParams[].type`

How the value is matched: `Exact` or `RegularExpression`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].queryParams[].type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Exact"`, `"RegularExpression"` |

---

## `$name.rules[].matches[].method`

HTTP method of the request, or the gRPC service and method.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches[].method` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].name`

Name of the rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].filters`

Filters applied to requests matching this rule. Only for `HTTPRoute` and `GRPCRoute`. A rule with only filters needs no `backendRefs`, eg a redirect.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].filters[]`

A filter applied to requests matching this rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].filters[].$name`

A setting of the filter, passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].timeouts`

`request` and `backendRequest` timeouts. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].timeouts.request`

Timeout for the complete request, expressed as a duration such as `10s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts.request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
route:
  example:
    rules:
      - timeouts:
          request: 30s
```

---

## `$name.rules[].timeouts.backendRequest`

Timeout for a backend request, expressed as a duration such as `5s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts.backendRequest` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
route:
  example:
    rules:
      - timeouts:
          backendRequest: 10s
```

---

## `$name.rules[].retry`

Retry configuration. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].retry.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].sessionPersistence`

Session persistence, needs the experimental Gateway API channel. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].sessionPersistence.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.$name` |
| Type | `any` |
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
