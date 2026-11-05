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

### `hpa.$name.annotations`

Additional annotations of the HorizontalPodAutoscaler.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `hpa.$name.annotations` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `hpa.$name.behavior`

Scaling behavior, for scaling up and down.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `hpa.$name.behavior` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `hpa.$name.enabled`

Enable the HorizontalPodAutoscaler.

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

### `hpa.$name.labels`

Additional labels of the HorizontalPodAutoscaler.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `hpa.$name.labels` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `hpa.$name.maxReplicas`

Maximum number of replicas.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `hpa.$name.maxReplicas` |
| Type       | `integer`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `hpa.$name.metrics`

Metrics the number of replicas is calculated from.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `hpa.$name.metrics` |
| Type       | `list of map`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `hpa.$name.minReplicas`

Minimum number of replicas.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `hpa.$name.minReplicas` |
| Type       | `integer`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `hpa.$name.targetSelector`

Workloads the HorizontalPodAutoscaler scales. Defaults to the primary workload.

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
