---
title: Primaryupdatestrategy
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster/primaryUpdateStrategy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.primaryUpdateStrategy`

---

## `dependencies.postgresql.operator.cluster.primaryUpdateStrategy`

Strategy to upgrade the primary server after all replicas are updated. `unsupervised` switches over automatically, `supervised` requires a manual switchover.

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.primaryUpdateStrategy` |
| Type       | `string`                                                         |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |
| Enum       | `supervised`, `unsupervised`                                     |

---

## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        # Update the primary automatically, after the replicas
        primaryUpdateStrategy: unsupervised
```
