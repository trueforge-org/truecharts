---
title: Horizontal Pod Autoscaler
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/hpa#full-examples) section for complete examples.

:::

## Appears in

- `.Values.hpa`

---

## `hpa`

Create Horizontal Pod Autoscaler objects

|            |       |
| ---------- | ----- |
| Key        | `hpa` |
| Type       | `map` |
| Required   | ❌    |
| Helm `tpl` | ❌    |
| Default    | `{}`  |

---

### `$name`

Define an HPA object with the given name

|            |             |
| ---------- | ----------- |
| Key        | `hpa.$name` |
| Type       | `map`       |
| Required   | ✅          |
| Helm `tpl` | ❌          |
| Default    | `{}`        |

---

#### `enabled`

Enables or disables this HPA object

|            |                     |
| ---------- | ------------------- |
| Key        | `hpa.$name.enabled` |
| Type       | `bool`              |
| Required   | ✅                  |
| Helm `tpl` | ✅                  |
| Default    | `false`             |

---

#### `targetSelector`

Select workloads this HPA scales

|            |                            |
| ---------- | -------------------------- |
| Key        | `hpa.$name.targetSelector` |
| Type       | `list` of `string`         |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `[]`                       |

---

#### `minReplicas`

Minimum number of replicas

|            |                         |
| ---------- | ----------------------- |
| Key        | `hpa.$name.minReplicas` |
| Type       | `int`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `1`                     |

---

#### `maxReplicas`

Maximum number of replicas

|            |                         |
| ---------- | ----------------------- |
| Key        | `hpa.$name.maxReplicas` |
| Type       | `int`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `3`                     |

---

#### `metrics`

Kubernetes HPA metrics definitions

|            |                    |
| ---------- | ------------------ |
| Key        | `hpa.$name.metrics` |
| Type       | `list` of `map`    |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `[]`               |

---

#### `behavior`

Kubernetes HPA behavior configuration

|            |                     |
| ---------- | ------------------- |
| Key        | `hpa.$name.behavior` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | `{}`                |

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
