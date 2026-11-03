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

Configuration for `vpa.main.enabled`.

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

Configuration for `vpa.main.resourcePolicy`.

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

Configuration for `vpa.main.targetSelector`.

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

Configuration for `vpa.main.updatePolicy`.

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
