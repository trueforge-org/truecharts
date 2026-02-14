---
title: Metrics
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/metrics#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics`

## Naming scheme

- Primary: `$FullName` (release-name-chart-name)
- Non-Primary: `$FullName-$MetricsName` (release-name-chart-name-metrics-name)

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `metrics`

Create Prometheus metrics objects

|            |           |
| ---------- | --------- |
| Key        | `metrics` |
| Type       | `map`     |
| Required   | ❌        |
| Helm `tpl` | ❌        |
| Default    | `{}`      |

---

### `$name`

Define a metrics object

|            |                 |
| ---------- | --------------- |
| Key        | `metrics.$name` |
| Type       | `map`           |
| Required   | ✅              |
| Helm `tpl` | ❌              |
| Default    | `{}`            |

---

#### `enabled`

Enables or disables this metrics object

|            |                           |
| ---------- | ------------------------- |
| Key        | `metrics.$name.enabled`   |
| Type       | `bool`                    |
| Required   | ✅                        |
| Helm `tpl` | ✅                        |
| Default    | `false`                   |

---

#### `type`

Which metrics object to create

|            |                        |
| ---------- | ---------------------- |
| Key        | `metrics.$name.type`   |
| Type       | `string`               |
| Required   | ✅                     |
| Helm `tpl` | ❌                     |
| Default    | `servicemonitor`       |

Valid Values:

- `servicemonitor`
- `podmonitor`

---

#### `targetSelector`

Select the service to scrape when `selector` is not defined

|            |                                  |
| ---------- | -------------------------------- |
| Key        | `metrics.$name.targetSelector`   |
| Type       | `string` or `list` of `string`   |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `[]`                             |

---

#### `selector`

Custom selector to use instead of `targetSelector`

|            |                            |
| ---------- | -------------------------- |
| Key        | `metrics.$name.selector`   |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ✅                         |
| Default    | `{}`                       |

---

#### `endpoints`

Scrape endpoints configuration

|            |                             |
| ---------- | --------------------------- |
| Key        | `metrics.$name.endpoints`   |
| Type       | `list` of `map`             |
| Required   | ✅                          |
| Helm `tpl` | ✅                          |

---

#### `prometheusRule`

Configure optional PrometheusRule creation

|            |                                  |
| ---------- | -------------------------------- |
| Key        | `metrics.$name.prometheusRule`   |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `{ enabled: false }`             |

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
