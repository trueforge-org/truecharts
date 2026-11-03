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

Configuration for `metrics.main.annotations`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `metrics.$name.annotations` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `metrics.$name.apiKey`

Configuration for `metrics.main.apiKey`. Read by stable charts (sabnzbd, bazarr) through their own metrics values, not by the common templates.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `metrics.$name.apiKey` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `metrics.$name.enabled`

Configuration for `metrics.main.enabled`.

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

Configuration for `metrics.main.endpoints`.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `metrics.$name.endpoints` |
| Type       | `list, string`            |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `metrics.$name.labels`

Configuration for `metrics.main.labels`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `metrics.$name.labels` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `metrics.$name.matchLabels`

Configuration for `metrics.main.matchLabels`. Set in common-test fixtures and ignored by the common ServiceMonitor and PodMonitor templates, which build their own matchLabels; use `selector` to set matchers.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `metrics.$name.matchLabels` |
| Type       | `map, string`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `metrics.$name.nameOverride`

Configuration for `metrics.main.nameOverride`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `metrics.$name.nameOverride` |
| Type       | `string`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `metrics.$name.primary`

Configuration for `metrics.main.primary`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `metrics.$name.primary` |
| Type       | `boolean`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `metrics.$name.prometheusRule`

Configuration for `metrics.main.prometheusRule`.

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

Configuration for `metrics.main.selector`.

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

Configuration for `metrics.main.targetSelector`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `metrics.$name.targetSelector` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `metrics.$name.type`

Configuration for `metrics.main.type`.

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
