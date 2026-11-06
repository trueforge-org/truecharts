---
title: Chart Context
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/chartContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.chartContext`
- `.Values.createChartContextConfigmap`

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

URL of the app, taken from the primary ingress, eg `https://app.example.com/`. Points to `127.0.0.1` when there is no ingress.

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

## `createChartContextConfigmap`

Creates a ConfigMap `chart-context` with the generated `chartContext`. Only used in CI and unittests, to check the generated chart context.

| Field | Value |
| --- | --- |
| Key | `createChartContextConfigmap` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

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
