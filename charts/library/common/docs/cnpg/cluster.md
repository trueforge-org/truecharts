---
title: CNPG Cluster
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/cnpg/cluster#full-examples) section for complete examples.
- This page is targeted primarily at chart developers. If you are looking for
  how to configure a CNPG backup/restore, visit the
  [dedicated guide page](/truecharts/guides/backup%20%26%20restore/cnpg-backup-restore)

:::

## Appears in

- `.Values.cnpg.$name.cluster`

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `labels`

Additional labels for CNPG cluster

|            |                             |
| ---------- | --------------------------- |
| Key        | `cnpg.$name.cluster.labels` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ✅ (On value only)          |
| Default    | `{}`                        |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      labels:
        key: value
```

---

## `annotations`

Additional annotations for CNPG cluster

|            |                                  |
| ---------- | -------------------------------- |
| Key        | `cnpg.$name.cluster.annotations` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ✅ (On value only)               |
| Default    | `{}`                             |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      annotations:
        key: value
```

---

## `env`

Define additional environment variables for the cluster's pods

:::tip

See container env options in the [container env](/truecharts-common/container/env) section.

:::

|            |                          |
| ---------- | ------------------------ |
| Key        | `cnpg.$name.cluster.env` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      env:
        key: value
```

---

## `envFrom`

Define additional environment variables for the cluster's pods

:::tip

See container envFrom options in the [container envFrom](/truecharts-common/container/envFrom) section.

:::

|            |                              |
| ---------- | ------------------------     |
| Key        | `cnpg.$name.cluster.envFrom` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `[]`                         |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      envFrom:
        - secretRef:
            name: secret-name
            expandObjectName: false
        - configMapRef:
            name: configmap-name
            expandObjectName: true
```

---

## `instances`

Number of instances

|            |                                |
| ---------- | ------------------------------ |
| Key        | `cnpg.$name.cluster.instances` |
| Type       | `int`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `2`                            |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      instances: 2
```

---

## `singleNode`

Whether this is a single-node cluster.

Setting this to `true` would allow PVCs to be kept on instance restart.

:::note

If you are a chart developer, changing the default value is not recommended,
as users are expected to change this themselves **if** they are running your
chart on a single-node cluster.

:::

|            |                                 |
| ---------- | ------------------------------- |
| Key        | `cnpg.$name.cluster.singleNode` |
| Type       | `bool`                          |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `false`                         |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      singleNode: true
```

---

## `logLevel`

The cluster log level. Available values:

- `error`
- `warning`
- `info`
- `debug`
- `trace`

:::note

If you are a chart developer, changing the default value is not recommended,
as users are expected to change this themselves if they are running into
issues with CNPG.

:::

|            |                               |
| ---------- | ----------------------------- |
| Key        | `cnpg.$name.cluster.logLevel` |
| Type       | `enum`                        |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `info`                        |

Example

```yaml
cnpg:
  cnpg-name:
    cluster:
      logLevel: info
```

---

## `primaryUpdateMethod`

TODO

---

## `primaryUpdateStrategy`

TODO

---

## `certificates`

TODO

---

## `postgresql`

TODO

---

## `initdb`

TODO

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
      envList:
        - name: key
          value: value
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
