---
title: General Options
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/general#full-examples) section for complete examples.

:::

## Appears in

- `.Values.TZ`
- `.Values.namespace`
- `.Values.extraTpl`
- `.Values.diagnosticMode`
- `.Values.chartContext`
- `.Values.common`

---

## `TZ`

Timezone set as the `TZ` environment variable of the containers, unless overridden at the container level.

| Field | Value |
| --- | --- |
| Key | `TZ` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"UTC"` |

Example

```yaml
TZ: Europe/Amsterdam
```

---

## `namespace`

Namespace to create all objects in, unless overridden at the object level. Does not apply to chart dependencies, use `global.namespace` for that.

| Field | Value |
| --- | --- |
| Key | `namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `extraTpl`

Extra Kubernetes resources to render, one per list item, as a YAML object or as a string. Helm `tpl` is resolved in each item.

| Field | Value |
| --- | --- |
| Key | `extraTpl` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `[]` |

---

## `extraTpl[]`

A Kubernetes resource, as a YAML object or as a string with its manifest.

| Field | Value |
| --- | --- |
| Key | `extraTpl[]` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `extraTpl[].$name`

A field of the resource, passed on as is.

| Field | Value |
| --- | --- |
| Key | `extraTpl[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `diagnosticMode`

Run the containers with a sleep command instead of the app, so you can exec into them to debug.

| Field | Value |
| --- | --- |
| Key | `diagnosticMode` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `diagnosticMode.enabled`

Run the containers with a sleep command instead of the app, so you can exec into them to debug. Probes are disabled while it is on.

| Field | Value |
| --- | --- |
| Key | `diagnosticMode.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `chartContext`

Details about the release that common works out on every render, such as the URL of the app. Common sets these itself.

| Field | Value |
| --- | --- |
| Key | `chartContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"appUrl": "", "podCIDR": "", "svcCIDR": ""}` |

---

## `chartContext.appUrl`

URL of the app, taken from the primary ingress or route, eg `https://app.example.com/`. Points to `127.0.0.1` when there is neither.

| Field | Value |
| --- | --- |
| Key | `chartContext.appUrl` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

Example

```yaml
chartContext:
  appUrl: https://app.example.com/
```

---

## `chartContext.podCIDR`

CIDR of the pods, taken from `global.podCIDR`. Falls back to `172.16.0.0/16`.

| Field | Value |
| --- | --- |
| Key | `chartContext.podCIDR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

Example

```yaml
chartContext:
  podCIDR: 172.16.0.0/16
```

---

## `chartContext.svcCIDR`

CIDR of the services, taken from `global.svcCIDR`. Falls back to `172.17.0.0/16`.

| Field | Value |
| --- | --- |
| Key | `chartContext.svcCIDR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

Example

```yaml
chartContext:
  svcCIDR: 172.17.0.0/16
```

---

## `chartContext.internalUrls`

Internal URLs of the services of the chart, filled in by common and shown in the notes.

| Field | Value |
| --- | --- |
| Key | `chartContext.internalUrls` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `common`

Values merged into the common defaults before the values of the chart. Takes the same values as the chart itself.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `common` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### TZ and namespace

`TZ` is set as the `TZ` environment variable of all containers. `namespace` is used for every object that does not set its own namespace:

```yaml
TZ: Europe/Amsterdam

namespace: my-namespace
```

A single container can override the timezone with `fixedEnv`:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          fixedEnv:
            TZ: America/New_York
```

### extraTpl

Every item of `extraTpl` is rendered as an extra Kubernetes object. An item is a YAML object or a string with a manifest, and Helm `tpl` is resolved in both:

```yaml
extraTpl:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: "{{ .Release.Name }}-extra"
    data:
      key: value
  - |
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: {{ .Release.Name }}-extra-string
    data:
      release: {{ .Release.Name }}
```

### diagnosticMode

Runs the containers with a sleep command instead of the app, so you can `exec` into them. The probes are disabled meanwhile:

```yaml
diagnosticMode:
  enabled: true
```

To do the same for the chart and all of its dependencies, use `global.diagnosticMode.enabled`.

### chartContext

Common sets `chartContext` on every render, so it is only read, in Helm `tpl` strings. For example, to tell an app its own URL and the networks to trust:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          env:
            APP_URL: "{{ .Values.chartContext.appUrl }}"
            TRUSTED_PROXIES: "{{ .Values.chartContext.podCIDR }},{{ .Values.chartContext.svcCIDR }}"
```

The CIDRs come from `global`:

```yaml
global:
  podCIDR: 10.42.0.0/16
  svcCIDR: 10.43.0.0/16
```

### common

`common` is merged into the defaults of the library before the values of the chart. In a chart that depends on `common`, Helm puts the values for the library under this key, and it takes the same values as the chart itself:

```yaml
common:
  TZ: Europe/Amsterdam
  podOptions:
    enableServiceLinks: false
  securityContext:
    pod:
      fsGroup: 1000
```
