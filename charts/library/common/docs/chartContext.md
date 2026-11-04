---
title: Chartcontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/chartContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.chartContext`

---

## `chartContext`

Details about the release that common works out on every render, to use in Helm `tpl` strings such as `{{ .Values.chartContext.appUrl }}`. Common sets these keys itself and replaces values set here.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `chartContext` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

### `chartContext.appUrl`

URL of the app, from the primary ingress or route, eg `https://app.example.com/`. Without either, it points to `127.0.0.1`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `chartContext.appUrl` |
| Type       | `string`              |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `chartContext.internalUrls`

Internal URLs of the services of the chart.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `chartContext.internalUrls` |
| Type       | `list of string`            |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `chartContext.podCIDR`

CIDR of the pods, from `global.podCIDR`, defaults to `172.16.0.0/16`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `chartContext.podCIDR` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `chartContext.svcCIDR`

CIDR of the services, from `global.svcCIDR`, defaults to `172.17.0.0/16`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `chartContext.svcCIDR` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

## Full Examples

Common sets `chartContext` on every render, so it is only read, in Helm `tpl` strings. For example, to tell an app its own URL and the networks to trust:

```yaml
workload:
  main:
    podSpec:
      containers:
        main:
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
