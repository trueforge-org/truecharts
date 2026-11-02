---
title: Container
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/gluetun/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.gluetun.container`

---

## `addons.gluetun.container`

No description provided.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `addons.gluetun.container` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `addons.gluetun.container.$name.activeDeadlineSeconds`

Define the activeDeadlineSeconds

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `addons.gluetun.container.$name.activeDeadlineSeconds` |
| Type       | `integer`                                              |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `addons.gluetun.container.$name.allowRollingUpdateWithRWO`

Keep `strategy: RollingUpdate` on a single replica Deployment with `ReadWriteOnce` volumes, instead of changing it to `Recreate`. Overrules `global.fallbackDefaults.allowRollingUpdateWithRWO`. `ReadWriteOncePod` volumes always use `Recreate`.

:::caution

Rolling updates with `ReadWriteOnce` storage are not safe for every app or storage:

- An update gets stuck if the storage stays locked to the old pod. This can happen on the same node with storage like iSCSI, and on another node with any `ReadWriteOnce` storage.
- Two pods use the same data during an update, which can damage data of apps that expect to be alone, for example with SQLite or database migrations.

Common shows a warning in the notes when this is enabled.

:::

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.allowRollingUpdateWithRWO` |
| Type       | `boolean`                                                  |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        allowRollingUpdateWithRWO: true
```

---

### `addons.gluetun.container.$name.annotations`

Define annotations for workload

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.gluetun.container.$name.annotations` |
| Type       | `map, string`                                |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | `{}`                                         |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        annotations:
          {}
```

---

### `addons.gluetun.container.$name.backoffLimit`

Define the backoffLimit

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `addons.gluetun.container.$name.backoffLimit` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `addons.gluetun.container.$name.completionMode`

Define the completionMode

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `addons.gluetun.container.$name.completionMode` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |
| Enum       | `Indexed`, `NonIndexed`                         |

---

### `addons.gluetun.container.$name.completions`

Define the completions

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.gluetun.container.$name.completions` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `addons.gluetun.container.$name.concurrencyPolicy`

Define the concurrencyPolicy

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.concurrencyPolicy` |
| Type       | `string`                                           |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |
| Enum       | `Allow`, `Replace`, `Forbid`                       |

---

### `addons.gluetun.container.$name.containers`

Define container(s) for the workload See [Container](/truecharts-common/container/) for more information

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `addons.gluetun.container.$name.containers` |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | `{}`                                        |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        containers:
          {}
```

---

### `addons.gluetun.container.$name.dbWait`

Whether init containers waiting for the enabled dependencies (mariadb, postgresql, mongodb, clickhouse, valkey) are added to the workload.
The workloads of [dependencies](/truecharts-common/dependencies) default to `false`, so they do not wait for themselves.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `addons.gluetun.container.$name.dbWait` |
| Type       | `boolean, string`                       |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `addons.gluetun.container.$name.enabled`

Enable or disable workload

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `addons.gluetun.container.$name.enabled` |
| Type       | `boolean, string`                        |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `false`                                  |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        enabled: false
```

---

### `addons.gluetun.container.$name.extraSelectorLabels`

Additional labels included in the workload selector and pod labels.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.extraSelectorLabels` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | `{}`                                                 |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        extraSelectorLabels:
          app.example.com/component: worker
```

---

### `addons.gluetun.container.$name.failedJobsHistoryLimit`

Define the failedJobsHistoryLimit

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.failedJobsHistoryLimit` |
| Type       | `integer`                                               |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `addons.gluetun.container.$name.initContainers`

Define workload objects

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `addons.gluetun.container.$name.initContainers` |
| Type       | `map`                                           |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | `{}`                                            |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        initContainers:
          {}
```

---

### `addons.gluetun.container.$name.labels`

Define labels for workload

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `addons.gluetun.container.$name.labels` |
| Type       | `map, string`                           |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `{}`                                    |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        labels:
          {}
```

---

### `addons.gluetun.container.$name.namespace`

Define the namespace for this object

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `addons.gluetun.container.$name.namespace` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `""`                                       |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        namespace: ""
```

---

### `addons.gluetun.container.$name.parallelism`

Define the parallelism

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.gluetun.container.$name.parallelism` |
| Type       | `integer`                                    |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `addons.gluetun.container.$name.podSpec`

Define the podSpec for the workload

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `addons.gluetun.container.$name.podSpec` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `{}`                                     |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        podSpec:
          {}
```

---

### `addons.gluetun.container.$name.primary`

Set workload as primary

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `addons.gluetun.container.$name.primary` |
| Type       | `boolean`                                |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `false`                                  |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        primary: false
```

---

### `addons.gluetun.container.$name.replicas`

Define the number of replicas

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.gluetun.container.$name.replicas` |
| Type       | `integer, string`                         |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `addons.gluetun.container.$name.revisionHistoryLimit`

Define the number of history revisions

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.revisionHistoryLimit` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `addons.gluetun.container.$name.rollingUpdate`

Define the rollingUpdate options Can only be used when `workload.$name.strategy` is `RollingUpdate`

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `addons.gluetun.container.$name.rollingUpdate` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `addons.gluetun.container.$name.schedule`

Define the schedule

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.gluetun.container.$name.schedule` |
| Type       | `string`                                  |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `addons.gluetun.container.$name.serviceAccountName`

Suggested is to use the top-level [serviceAccount](/truecharts-common/serviceaccount/) key to define the service account with `targetSelector`.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.serviceAccountName` |
| Type       | `string`                                            |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | `""`                                                |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        serviceAccountName: ""
```

---

### `addons.gluetun.container.$name.startingDeadlineSeconds`

Define the startingDeadlineSeconds

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.startingDeadlineSeconds` |
| Type       | `integer`                                                |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `addons.gluetun.container.$name.strategy`

Define the strategy of the workload

A single replica Deployment uses `Recreate` if it mounts a `ReadWriteOnce` or `ReadWriteOncePod` volume. See `allowRollingUpdateWithRWO` to keep `RollingUpdate` with `ReadWriteOnce`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.gluetun.container.$name.strategy` |
| Type       | `string, map`                             |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |
| Enum       | `Recreate`, `RollingUpdate`, `OnDelete`   |

---

### `addons.gluetun.container.$name.successfulJobsHistoryLimit`

Define the successfulJobsHistoryLimit

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.successfulJobsHistoryLimit` |
| Type       | `integer`                                                   |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `addons.gluetun.container.$name.timezone`

Define the timezone

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.gluetun.container.$name.timezone` |
| Type       | `string`                                  |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `addons.gluetun.container.$name.ttlSecondsAfterFinished`

Define the ttlSecondsAfterFinished

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.ttlSecondsAfterFinished` |
| Type       | `map`                                                    |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `addons.gluetun.container.$name.type`

Define the kind of the workload

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `addons.gluetun.container.$name.type`                      |
| Type       | `string`                                                   |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | `""`                                                       |
| Enum       | `Deployment`, `DaemonSet`, `StatefulSet`, `CronJob`, `Job` |

Example

```yaml
addons:
  gluetun:
    container:
      $name:
        type: ""
```

---

### `addons.gluetun.container.env`

Environment variables for gluetun addon.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `addons.gluetun.container.env` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Env](env.md) for full configuration.

---

### `addons.gluetun.container.targetSelector`

Workloads to which this container is attached.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `addons.gluetun.container.targetSelector` |
| Type       | `list of string`                          |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

## Child Pages

- [Env](env.md) - Environment variables for gluetun addon.

---
