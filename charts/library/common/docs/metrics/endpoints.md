---
title: endpoints
---

:::note

- See the [Full Examples](/truecharts-common/metrics/endpoints#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics.$name.endpoints`

---

## `endpoints`

Endpoints that are scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[]`

An endpoint that is scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].port`

Name of the port that is scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].port` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].interval`

Interval between scrapes, eg `30s`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].interval` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].scrapeTimeout`

Timeout of a scrape, eg `10s`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].scrapeTimeout` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].path`

HTTP path that is scraped.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].honorLabels`

Keep the labels of the scraped metrics when they conflict with the labels of the target.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].honorLabels` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].scheme`

Scheme of the scrape request, `http` or `https`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].params`

Query parameters of the scrape request, keyed by name. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].params` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].params.$name`

Values of the query parameter

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].params.$name` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tlsConfig`

TLS settings of the scrape request, passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].tlsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].tlsConfig.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].tlsConfig.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].relabelings`

Relabelings applied before scraping. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].relabelings` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].relabelings[]`

A relabel config, passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].relabelings[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].relabelings[].$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].relabelings[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].metricRelabelings`

Relabelings applied to the scraped metrics. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].metricRelabelings` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].metricRelabelings[]`

A relabel config, passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].metricRelabelings[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].metricRelabelings[].$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints[].metricRelabelings[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
metrics:
  main:
    endpoints:
      - port: main
        interval: 30s
        path: /metrics
```

```yaml
metrics:
  pods:
    endpoints:
      - port: metrics
        interval: 15s
        path: /metrics
```

```yaml
metrics:
  main:
    endpoints:
      - port: main
        interval: 30s
        scrapeTimeout: 10s
        path: /metrics
        scheme: http
        honorLabels: false
```
