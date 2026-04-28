---
title: Operator
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/operator#full-examples) section for complete examples.

:::

## Appears in

- `.Values.operator`

---

## `operator`

Contains specific settings for helm charts containing or using system

| Field      | Value      |
| ---------- | ---------- |
| Key        | `operator` |
| Type       | `map`      |
| Required   | ❌         |
| Helm `tpl` | ❌         |
| Default    | unset      |

---

### `operator.register`

Adds a configmap in the operator's namespace to register the chart as an operator

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `operator.register` |
| Type       | `boolean`           |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | `false`             |

Example

```yaml
operator:
  register: false
```

---

### `operator.verify`

Contains specific settings for verifying system

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `operator.verify` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---
