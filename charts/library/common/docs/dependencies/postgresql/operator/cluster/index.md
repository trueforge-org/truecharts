---
title: Cluster
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster`

---

## `dependencies.postgresql.operator.cluster`

No description provided.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.postgresql.operator.cluster.annotations`

Additional annotations for CNPG cluster

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.postgresql.operator.cluster.annotations` |
| Type       | `map, string`                                          |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | `{}`                                                   |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        annotations:
          {}
```

---

### `dependencies.postgresql.operator.cluster.certificates`

TODO ---

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates` |
| Type       | `null, string, number, integer, boolean, map, list`     |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `dependencies.postgresql.operator.cluster.env`

See [env](/truecharts-common/container/env)

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.env` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | `{}`                                           |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        env:
          {}
```

---

### `dependencies.postgresql.operator.cluster.envFrom`

See [envFrom](/truecharts-common/container/envfrom)

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.envFrom` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | `"[]"`                                             |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        envFrom: []
```

---

### `dependencies.postgresql.operator.cluster.initdb`

TODO ---

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.initdb` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `dependencies.postgresql.operator.cluster.instances`

Number of instances

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.instances` |
| Type       | `integer`                                            |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | `2`                                                  |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        instances: 2
```

---

### `dependencies.postgresql.operator.cluster.labels`

Additional labels for CNPG cluster

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.labels` |
| Type       | `map, string`                                     |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `{}`                                              |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        labels:
          {}
```

---

### `dependencies.postgresql.operator.cluster.logLevel`

The cluster log level. Available values: - `error`

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.logLevel` |
| Type       | `string`                                            |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | `"info"`                                            |
| Enum       | `error`, `warning`, `info`, `debug`, `trace`        |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        logLevel: info
```

---

### `dependencies.postgresql.operator.cluster.postgresql`

TODO ---

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.postgresql` |
| Type       | `null, string, number, integer, boolean, map, list`   |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.postgresql.operator.cluster.primaryUpdateMethod`

TODO ---

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.primaryUpdateMethod` |
| Type       | `string`                                                       |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.postgresql.operator.cluster.primaryUpdateStrategy`

TODO ---

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.primaryUpdateStrategy` |
| Type       | `string`                                                         |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

### `dependencies.postgresql.operator.cluster.singleNode`

Whether this is a single-node cluster. Setting this to `true` would allow PVCs to be kept on instance restart.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.singleNode` |
| Type       | `boolean`                                             |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | `false`                                               |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        singleNode: false
```

---

## Child Pages

- [Certificates](certificates.md) - TODO ---
- [Initdb](initdb.md) - TODO ---
- [Postgresql](postgresql.md) - TODO ---
- [Primaryupdatemethod](primaryUpdateMethod.md) - TODO ---
- [Primaryupdatestrategy](primaryUpdateStrategy.md) - TODO ---

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
