---
title: Metrics
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/metrics#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics`

---

## `metrics`

Configuration for `metrics`.

| Field      | Value     |
| ---------- | --------- |
| Key        | `metrics` |
| Type       | `map`     |
| Required   | ❌        |
| Helm `tpl` | ❌        |
| Default    | unset     |

---

### `metrics.$name.annotations`

Additional annotations, keyed by name.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `metrics.$name.annotations` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `metrics.$name.apiKey`

API key the exporter needs.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `metrics.$name.apiKey` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `metrics.$name.enabled`

Enable the metrics object.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `metrics.$name.enabled` |
| Type       | `boolean, string`       |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `false`                 |

Example

```yaml
metrics:
  $name:
    enabled: false
```

---

### `metrics.$name.endpoints`

Endpoints that are scraped.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `metrics.$name.endpoints` |
| Type       | `list, string`            |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `metrics.$name.labels`

Additional labels, keyed by name.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `metrics.$name.labels` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `metrics.$name.matchLabels`

Labels that select the service or pods.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `metrics.$name.matchLabels` |
| Type       | `map, string`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `metrics.$name.nameOverride`

Suffix of the name, instead of the name of the object.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `metrics.$name.nameOverride` |
| Type       | `string`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `metrics.$name.primary`

Make this the primary metrics object.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `metrics.$name.primary` |
| Type       | `boolean`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `metrics.$name.prometheusRule`

A PrometheusRule with alerting and recording rules.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `metrics.$name.prometheusRule` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `"{ enabled: false }"`         |

Example

```yaml
metrics:
  $name:
    prometheusRule: "{ enabled: false }"
```

---

### `metrics.$name.selector`

Labels that select the service or pods, instead of `targetSelector`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `metrics.$name.selector` |
| Type       | `map, string`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
metrics:
  $name:
    selector:
      {}
```

---

### `metrics.$name.targetSelector`

Service or workload the monitor selects. Defaults to the primary one.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `metrics.$name.targetSelector` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `metrics.$name.type`

Type of the monitor, `servicemonitor` or `podmonitor`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `metrics.$name.type`           |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `"servicemonitor"`             |
| Enum       | `servicemonitor`, `podmonitor` |

Example

```yaml
metrics:
  $name:
    type: servicemonitor
```

---

## Full Examples

```yaml
metrics:
  main:
    enabled: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: main
        interval: 5s
        scrapeTimeout: 5s
        path: /
    prometheusRule:
      enabled: false
      groups: {}
      additionalgroups: []
```
