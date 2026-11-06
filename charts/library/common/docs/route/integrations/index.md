---
title: integrations
---

## Appears in

- `.Values.route.$name.integrations`

---

## Child Pages

- [envoy](/truecharts-common/route/integrations/envoy)
- [traefik](/truecharts-common/route/integrations/traefik)

---

## `integrations`

Integrations of this route. `certManager`, `envoy`, `homepage` and `traefik` are supported, any other fails rendering.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certManager`

Issue a certificate per hostname, same as an ingress. Sets the annotations on the created ListenerSet. Needs cert-manager 1.20 or newer, with ListenerSet support enabled.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.certManager` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `certManager.enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.certManager.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `certManager.certificateIssuer`

Name of the ClusterIssuer.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.certManager.certificateIssuer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage`

Add the annotations for Homepage service discovery, same as an ingress. Only for `HTTPRoute`. Needs `gateway: true` in the `kubernetes.yaml` of Homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.enabled`

Enable the integration.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `homepage.name`

Name of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage.description`

Description of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage.group`

Group of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage.icon`

Icon of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.icon` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage.href`

Href of the entry on the homepage. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.href` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.weight`

Weight of the entry on the homepage, used for sorting within its group.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.podSelector`

Names of the pods to check for the status of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.podSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget`

Widget of the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.enabled`

Enables or Disables the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.version`

Version of the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.version` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.type`

Type of the widget. Sets the `gethomepage.dev/widget.type` annotation.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.type` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage.widget.url`

URL of the widget. Defaults to the first host of the route.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `homepage.widget.custom`

Custom settings of the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.custom` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.custom.$name`

Value of the widget setting. Supports Helm `tpl`, empty values are skipped.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.custom.$name` |
| Type | `number or bool or null` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `homepage.widget.customkv`

Custom settings of the widget, as a list of `key` and `value`.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv` |
| Type | `list of map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.customkv[]`

A custom setting of the widget.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.customkv[].key`

Name of the setting. Sets the `gethomepage.dev/widget.$key` annotation.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `homepage.widget.customkv[].value`

Value of the setting.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.homepage.widget.customkv[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `traefik`

Traefik `Middleware` objects attached to the route as `ExtensionRef` filters. Only for `HTTPRoute` and `GRPCRoute`. Needs the kubernetesCRD provider of Traefik enabled.

See [traefik](/truecharts-common/route/integrations/traefik) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envoy`

Envoy Gateway policies that target the route. Only for `HTTPRoute` and `GRPCRoute`.

See [envoy](/truecharts-common/route/integrations/envoy) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.integrations.envoy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
