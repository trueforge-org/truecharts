---
title: Hpa
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/hpa#full-examples) section for complete examples.

:::

## Appears in

- `.Values.hpa`

---

## `hpa`

Configuration for `hpa`.

| Field      | Value |
| ---------- | ----- |
| Key        | `hpa` |
| Type       | `map` |
| Required   | ❌    |
| Helm `tpl` | ❌    |
| Default    | unset |

---

### `hpa.$name.behavior`

Configuration for `hpa.main.behavior`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `hpa.$name.behavior` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `hpa.$name.enabled`

Configuration for `hpa.main.enabled`.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `hpa.$name.enabled` |
| Type       | `boolean, string`   |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | `false`             |

Example

```yaml
hpa:
  $name:
    enabled: false
```

---

### `hpa.$name.maxReplicas`

Configuration for `hpa.main.maxReplicas`. Must be greater than or equal to `minReplicas`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `hpa.$name.maxReplicas` |
| Type       | `integer`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `hpa.$name.metrics`

Configuration for `hpa.main.metrics`. List of metric specs, each selecting one of Resource, Pods, Object, External or ContainerResource.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `hpa.$name.metrics` |
| Type       | `list of map`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `hpa.$name.minReplicas`

Configuration for `hpa.main.minReplicas`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `hpa.$name.minReplicas` |
| Type       | `integer`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `hpa.$name.targetSelector`

Configuration for `hpa.main.targetSelector`.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `hpa.$name.targetSelector` |
| Type       | `list of unknown`          |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `[]`                       |

Example

```yaml
hpa:
  $name:
    targetSelector:
      []
```

---

### `hpa.$name.workload`

Set by the library to a copy of the workload this HPA targets. Any value set by the user is overwritten.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `hpa.$name.workload` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

## Full Examples

```yaml
hpa:
  main:
    enabled: true
    targetSelector:
      - main
    minReplicas: 1
    maxReplicas: 3
    metrics:
      - type: Resource
        resource:
          name: cpu
          target:
            type: Utilization
            averageUtilization: 50
```
