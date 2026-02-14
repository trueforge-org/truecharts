---
title: Cluster
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/cnpg/cluster#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.cluster`

---

## `cnpg.cluster`

No description provided.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `cnpg.cluster` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

### `cnpg.cluster.annotations`

Additional annotations for CNPG cluster

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `cnpg.cluster.annotations` |
| Type       | `map, string`              |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `{}`                       |

Example

```yaml
cnpg:
  cluster:
    annotations:
      {}
```

---

### `cnpg.cluster.certificates`

TODO ---

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `cnpg.cluster.certificates`                         |
| Type       | `null, string, number, integer, boolean, map, list` |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `cnpg.cluster.env`

See [env](/truecharts-common/container/env)

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `cnpg.cluster.env` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `{}`               |

Example

```yaml
cnpg:
  cluster:
    env:
      {}
```

---

### `cnpg.cluster.envFrom`

See [envFrom](/truecharts-common/container/envfrom)

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `cnpg.cluster.envFrom` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `"[]"`                 |

Example

```yaml
cnpg:
  cluster:
    envFrom: []
```

---

### `cnpg.cluster.initdb`

TODO ---

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `cnpg.cluster.initdb` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `cnpg.cluster.instances`

Number of instances

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `cnpg.cluster.instances` |
| Type       | `integer`                |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `2`                      |

Example

```yaml
cnpg:
  cluster:
    instances: 2
```

---

### `cnpg.cluster.labels`

Additional labels for CNPG cluster

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `cnpg.cluster.labels` |
| Type       | `map, string`         |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `{}`                  |

Example

```yaml
cnpg:
  cluster:
    labels:
      {}
```

---

### `cnpg.cluster.logLevel`

The cluster log level. Available values: - `error`

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `cnpg.cluster.logLevel`                      |
| Type       | `string`                                     |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | `"info"`                                     |
| Enum       | `error`, `warning`, `info`, `debug`, `trace` |

Example

```yaml
cnpg:
  cluster:
    logLevel: info
```

---

### `cnpg.cluster.postgresql`

TODO ---

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `cnpg.cluster.postgresql`                           |
| Type       | `null, string, number, integer, boolean, map, list` |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `cnpg.cluster.primaryUpdateMethod`

TODO ---

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `cnpg.cluster.primaryUpdateMethod` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `cnpg.cluster.primaryUpdateStrategy`

TODO ---

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `cnpg.cluster.primaryUpdateStrategy` |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `cnpg.cluster.singleNode`

Whether this is a single-node cluster. Setting this to `true` would allow PVCs to be kept on instance restart.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `cnpg.cluster.singleNode` |
| Type       | `boolean`                 |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `false`                   |

Example

```yaml
cnpg:
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
cnpg:
  $name:
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
