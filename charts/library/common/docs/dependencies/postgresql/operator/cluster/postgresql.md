---
title: Postgresql
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster/postgresql#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.postgresql`

---

## `dependencies.postgresql.operator.cluster.postgresql`

Parameters of the PostgreSQL server. Each parameter is passed to CNPG as a string, so every value must be a string.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.postgresql` |
| Type       | `map, null`                                           |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        # Each parameter is passed to PostgreSQL as a string
        postgresql:
          max_connections: "200"
          shared_buffers: "256MB"
```
