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
