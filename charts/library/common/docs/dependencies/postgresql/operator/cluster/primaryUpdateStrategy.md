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

TODO ---

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.primaryUpdateStrategy` |
| Type       | `string`                                                         |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        labels:
          label1: label1
          label2: label2
        annotations:
          annotation1: annotation1
          annotation2: annotation2
        env:
          key: value
        envFrom:
          - secretRef:
            name: my-secret
            expandObjectName: true
          - configMapRef:
            name: my-configmap
            expandObjectName: false
        instances: 2
        singleNode: false
        logLevel: info
        primaryUpdateMethod: # TODO
        primaryUpdateStrategy: # TODO
        certificates: # TODO
        postgresql: # TODO
        initdb: # TODO
        primaryUpdateStrategy: # TODO
```
