---
title: Vertical Pod Autoscaler
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/vpa#full-examples) section for complete examples.

:::

## Appears in

- `.Values.vpa`

---

## `vpa`

Create Vertical Pod Autoscaler objects

|            |       |
| ---------- | ----- |
| Key        | `vpa` |
| Type       | `map` |
| Required   | ❌    |
| Helm `tpl` | ❌    |
| Default    | `{}`  |

---

### `$name`

Define a VPA object with the given name

|            |             |
| ---------- | ----------- |
| Key        | `vpa.$name` |
| Type       | `map`       |
| Required   | ✅          |
| Helm `tpl` | ❌          |
| Default    | `{}`        |

---

#### `enabled`

Enables or disables this VPA object

|            |                     |
| ---------- | ------------------- |
| Key        | `vpa.$name.enabled` |
| Type       | `bool`              |
| Required   | ✅                  |
| Helm `tpl` | ✅                  |
| Default    | `false`             |

---

#### `targetSelector`

Select workloads this VPA applies to

|            |                            |
| ---------- | -------------------------- |
| Key        | `vpa.$name.targetSelector` |
| Type       | `list` of `string`         |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `[]`                       |

---

#### `updatePolicy`

Kubernetes VPA update policy

|            |                          |
| ---------- | ------------------------ |
| Key        | `vpa.$name.updatePolicy` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

---

#### `resourcePolicy`

Kubernetes VPA resource policy

|            |                            |
| ---------- | -------------------------- |
| Key        | `vpa.$name.resourcePolicy` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `{}`                       |

---

## Full Examples

```yaml
vpa:
  main:
    enabled: true
    targetSelector:
      - main
    updatePolicy:
      updateMode: Auto
    resourcePolicy:
      containerPolicies:
        - containerName: "*"
          minAllowed:
            cpu: 50m
            memory: 50Mi
          maxAllowed:
            cpu: 8000m
            memory: 20Gi
          controlledResources:
            - cpu
            - memory
```
