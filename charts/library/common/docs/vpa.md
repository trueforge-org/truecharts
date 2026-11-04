---
title: Vpa
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/vpa#full-examples) section for complete examples.

:::

## Appears in

- `.Values.vpa`

---

## `vpa`

Configuration for `vpa`.

| Field      | Value |
| ---------- | ----- |
| Key        | `vpa` |
| Type       | `map` |
| Required   | ❌    |
| Helm `tpl` | ❌    |
| Default    | unset |

---

### `vpa.$name.annotations`

Additional annotations of the VerticalPodAutoscaler.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `vpa.$name.annotations` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `vpa.$name.enabled`

Enable the VerticalPodAutoscaler.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `vpa.$name.enabled` |
| Type       | `boolean, string`   |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | `false`             |

Example

```yaml
vpa:
  $name:
    enabled: false
```

---

### `vpa.$name.labels`

Additional labels of the VerticalPodAutoscaler.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `vpa.$name.labels` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `vpa.$name.resourcePolicy`

Limits of the recommendations, per container.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `vpa.$name.resourcePolicy` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `{}`                       |

Example

```yaml
vpa:
  $name:
    resourcePolicy:
      {}
```

---

### `vpa.$name.targetSelector`

Workloads the VerticalPodAutoscaler applies to. Defaults to the primary workload.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `vpa.$name.targetSelector` |
| Type       | `list of unknown`          |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `[]`                       |

Example

```yaml
vpa:
  $name:
    targetSelector:
      []
```

---

### `vpa.$name.updatePolicy`

How the recommendations are applied.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `vpa.$name.updatePolicy` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `vpa.$name.workload`

Set by the library to a copy of the workload this VPA targets. Any value set by the user is overwritten.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `vpa.$name.workload` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

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
