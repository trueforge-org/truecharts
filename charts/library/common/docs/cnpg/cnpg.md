---
title: CNPG
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/cnpg/cnpg#full-examples) section for complete examples.
- This page is targeted primarily at chart developers. If you are looking for
  how to configure a CNPG backup/restore, visit the
  [dedicated guide page](/truecharts/guides/backup%20%26%20restore/cnpg-backup-restore)

:::

## Appears in

- `.Values.cnpg`

## Naming scheme

- Primary: `$FullName-cnpg-$ResourceName` (release-name-chart-name-cnpg-main)
- Non-Primary: `$FullName-$RBACName-cnpg-$ResourceName` (release-name-chart-name-RBACName-cnpg-main)

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `cnpg`

Define a CNPG cluster

|            |                                         |
| ---------- | --------------------------------------- |
| Key        | `cnpg`                                  |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `{cnpg: {main: {enabled: false, ...}}}` |

Example

```yaml
cnpg:
  main:
    enabled: true
    ...
```

---

### `$name`

Define the cluster name.

:::tip

There is predefined cluster called `main`, which is configured with sensible
defaults (see common chart's `values.yaml`). It is **disabled** by default and
must be [enabled](/truecharts-common/cnpg/cnpg#enabled) if needed.

:::

|            |                                 |
| ---------- | ------------------------------- |
| Key        | `cnpg.$name`                    |
| Type       | `map`                           |
| Required   | ✅                              |
| Helm `tpl` | ❌                              |
| Default    | `{}`                            |

Example

```yaml
cnpg:
  cnpg-name: {}
```

---

#### `enabled`

Enables or Disables the cluster

|            |                             |
| ---------- | --------------------------- |
| Key        | `cnpg.$name.enabled`        |
| Type       | `bool`                      |
| Required   | ✅                          |
| Helm `tpl` | ✅                          |
| Default    | `false`                     |

Example

```yaml
cnpg:
  cnpg-name:
    enabled: true
```

---

#### `primary`

Sets the cluster as primary

|            |                      |
| ---------- | -------------------- |
| Key        | `cnpg.$name.primary` |
| Type       | `bool`               |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
cnpg:
  cnpg-name:
    primary: true
```

---

#### `hibernate`

Puts the cluster in hibernation mode

|            |                        |
| ---------- | ---------------------- |
| Key        | `cnpg.$name.hibernate` |
| Type       | `bool`                 |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `false`                |

Example

```yaml
cnpg:
  cnpg-name:
    hibernate: true
```

---

#### `labels`

Additional labels for all CNPG objects

|            |                      |
| ---------- | -------------------- |
| Key        | `cnpg.$name.labels`  |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ✅ (On value only)   |
| Default    | `{}`                 |

Example

```yaml
cnpg:
  cnpg-name:
    labels:
      key: value
```

---

#### `annotations`

Additional annotations for all CNPG objects

|            |                          |
| ---------- | ------------------------ |
| Key        | `cnpg.$name.annotations` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ✅ (On value only)       |
| Default    | `{}`                     |

Example

```yaml
cnpg:
  cnpg-name:
    annotations:
      key: value
```

---

#### `type`

Type of the CNPG database. Available types:

- `postgres`
- `postgis`
- `timescaledb`
- `vectors`
- `vectorchord`

|            |                   |
| ---------- | ----------------- |
| Key        | `cnpg.$name.type` |
| Type       | `enum`            |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | `postgres`        |

Example

```yaml
cnpg:
  cnpg-name:
    type: postgres
```

---

#### `pgVersion`

Version of Postgresql to use. Available types:

- `15`
- `16`

:::note

Changing this value affects the cluster naming scheme

:::

|            |                        |
| ---------- | ---------------------- |
| Key        | `cnpg.$name.pgVersion` |
| Type       | `enum`                 |
| Required   | ✅                     |
| Helm `tpl` | ❌                     |
| Default    | `nil`                  |

Example

```yaml
cnpg:
  cnpg-name:
    pgVersion: 16
```

---

#### `mode`

Cluster mode of operation. Available modes:

- `standalone` (default mode, creates new or updates an existing CNPG cluster)
- `recovery` (same as standalone but creates a cluster from a backup, object store or via pg_basebackup)

:::note

If you are a chart developer, changing the default value is not recommended,
as users are expected to change this themselves **if** they want to configure
a CNPG restore.

:::

|            |                    |
| ---------- | ------------------ |
| Key        | `cnpg.$name.mode`  |
| Type       | `enum`             |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `standalone`       |

Example

```yaml
cnpg:
  cnpg-name:
    mode: standalone
```

---

#### `database`

Define the database name

|            |                           |
| ---------- | ------------------------- |
| Key        | `cnpg.$name.database`     |
| Type       | `string`                  |
| Required   | ✅                        |
| Helm `tpl` | ❌                        |
| Default    | `""`                      |

Example

```yaml
cnpg:
  cnpg-name:
    database: app
```

---

#### `user`

Define the database user

|            |                           |
| ---------- | ------------------------- |
| Key        | `cnpg.$name.user`         |
| Type       | `string`                  |
| Required   | ✅                        |
| Helm `tpl` | ❌                        |
| Default    | `""`                      |

Example

```yaml
cnpg:
  cnpg-name:
    user: app
```

---

#### `password`

Define the database password

:::tip

Chart users are strongly encouraged to override this setting with their own
secure password **during initial install**

:::

|            |                           |
| ---------- | ------------------------- |
| Key        | `cnpg.$name.password`     |
| Type       | `string`                  |
| Required   | ✅                        |
| Helm `tpl` | ❌                        |
| Default    | `""`                      |

Example

```yaml
cnpg:
  cnpg-name:
    password: supersecret
```

---

#### `cluster`

Database cluster configuration

See more details in [CNPG Cluster](/truecharts-common/cnpg/cluster)

|            |                          |
| ---------- | ------------------------ |
| Key        | `cnpg.$name.cluster`     |
| Type       | `string`                 |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
cnpg:
  cnpg-name:
    cluster: {}
```

---

---

#### `monitoring`

TODO

---

#### `recovery`

:::note

See the dedicated [CNPG backup/restore guide](/truecharts/guides/backup%20%26%20restore/cnpg-backup-restore)

:::

TODO

---

#### `backups`

:::note

See the dedicated [CNPG backup/restore guide](/truecharts/guides/backup%20%26%20restore/cnpg-backup-restore)

:::

TODO

---

#### `pooler`

TODO

---

## Full Examples

```yaml
cnpg:
  main:
    enabled: true
    primary: true
    hibernate: false
    type: postgres
    pgVersion: 16
    mode: standalone
    database: "app"
    user: "app"
    password: "PLACEHOLDERPASSWORD"
    cluster: {}
    monitoring: {}
    recovery: {}
    backups: {}
    pooler: {}

  my-cluster-1:
    enabled: true
    primary: false
    hibernate: false
    labels:
      label1: label1
      label2: label2
    annotations:
      annotation1: annotation1
      annotation2: annotation2
    type: postgres
    pgVersion: 16
    mode: standalone
    database: "my-app"
    user: "my-user"
    password: "supersecret"
    cluster: {}
    monitoring: {}
    recovery: {}
    backups: {}
    pooler: {}
```
