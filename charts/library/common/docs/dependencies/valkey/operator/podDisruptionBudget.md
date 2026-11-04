---
title: Poddisruptionbudget
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/podDisruptionBudget#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.podDisruptionBudget`

---

## `dependencies.valkey.operator.podDisruptionBudget`

No description provided.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podDisruptionBudget` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.podDisruptionBudget.mode`

`Cluster` creates one budget (`maxUnavailable: 1`) for all pods, `Disabled` creates none.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podDisruptionBudget.mode` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | `"Cluster"`                                             |
| Enum       | `Cluster`, `Disabled`                                   |

Example

```yaml
dependencies:
  valkey:
    operator:
      podDisruptionBudget:
        mode: Cluster
```

---
