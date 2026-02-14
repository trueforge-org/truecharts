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
