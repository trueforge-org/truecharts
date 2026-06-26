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
