---
title: Workload
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload`

---

## `workload`

Define workload objects

| Field      | Value      |
| ---------- | ---------- |
| Key        | `workload` |
| Type       | `map`      |
| Required   | ❌         |
| Helm `tpl` | ❌         |
| Default    | unset      |

---

### `workload.$name.activeDeadlineSeconds`

Seconds a Job can run before it is stopped.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `workload.$name.activeDeadlineSeconds` |
| Type       | `integer`                              |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `workload.$name.allowRollingUpdateWithRWO`

Keep `strategy: RollingUpdate` on a single replica Deployment with `ReadWriteOnce` volumes, instead of changing it to `Recreate`. Overrules `global.fallbackDefaults.allowRollingUpdateWithRWO`. `ReadWriteOncePod` volumes always use `Recreate`.

:::caution

Rolling updates with `ReadWriteOnce` storage are not safe for every app or storage:

- An update gets stuck if the storage stays locked to the old pod. This can happen on the same node with storage like iSCSI, and on another node with any `ReadWriteOnce` storage.
- Two pods use the same data during an update, which can damage data of apps that expect to be alone, for example with SQLite or database migrations.

Common shows a warning in the notes when this is enabled.

:::

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `workload.$name.allowRollingUpdateWithRWO` |
| Type       | `boolean`                                  |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

Example

```yaml
workload:
  $name:
    allowRollingUpdateWithRWO: true
```

---

### `workload.$name.annotations`

Define annotations for workload

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `workload.$name.annotations` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ✅ (On value only)            |
| Default    | `{}`                         |

Example

```yaml
workload:
  $name:
    annotations:
      {}
```

---

### `workload.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `workload.$name.annotationsList` |
| Type       | `list of map`                    |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `workload.$name.backoffLimit`

Retries before a Job fails.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `workload.$name.backoffLimit` |
| Type       | `number`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `workload.$name.completionMode`

Completion mode of a Job, `NonIndexed` or `Indexed`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `workload.$name.completionMode` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |
| Enum       | `Indexed`, `NonIndexed`         |

---

### `workload.$name.completions`

Successful pods a Job needs.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `workload.$name.completions` |
| Type       | `number`                     |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `workload.$name.concurrencyPolicy`

What a CronJob does when the previous run is still running: `Allow`, `Forbid` or `Replace`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `workload.$name.concurrencyPolicy` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | unset                              |
| Enum       | `Allow`, `Replace`, `Forbid`       |

---

### `workload.$name.containers`

Define container(s) for the workload See [Container](/truecharts-common/workload/podSpec/containers) for more information

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `workload.$name.containers` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `{}`                        |

Example

```yaml
workload:
  $name:
    containers:
      {}
```

---

### `workload.$name.dbWait`

Whether init containers waiting for the enabled dependencies (mariadb, postgresql, mongodb, clickhouse, valkey) are added to the workload.
The workloads of [dependencies](/truecharts-common/dependencies) default to `false`, so they do not wait for themselves.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `workload.$name.dbWait` |
| Type       | `boolean`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `workload.$name.enabled`

Enable or disable workload

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `workload.$name.enabled` |
| Type       | `boolean, string`        |
| Required   | ✅                       |
| Helm `tpl` | ✅                       |
| Default    | `false`                  |

Example

```yaml
workload:
  $name:
    enabled: false
```

---

### `workload.$name.extraSelectorLabels`

Additional labels included in the workload selector and pod labels.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `workload.$name.extraSelectorLabels` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `{}`                                 |

Example

```yaml
workload:
  $name:
    extraSelectorLabels:
      app.example.com/component: worker
```

---

### `workload.$name.failedJobsHistoryLimit`

Failed Jobs of a CronJob that are kept.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.$name.failedJobsHistoryLimit` |
| Type       | `integer`                               |
| Required   | ❌                                      |
| Helm `tpl` | ✅                                      |
| Default    | unset                                   |

---

### `workload.$name.initContainers`

Not used. Init containers go under `podSpec.initContainers`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `workload.$name.initContainers` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `{}`                            |

Example

```yaml
workload:
  $name:
    initContainers:
      {}
```

---

### `workload.$name.labels`

Define labels for workload

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `workload.$name.labels` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ✅ (On value only)       |
| Default    | `{}`                    |

Example

```yaml
workload:
  $name:
    labels:
      {}
```

---

### `workload.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `workload.$name.labelsList` |
| Type       | `list of map`               |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `workload.$name.namespace`

Define the namespace for this object

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `workload.$name.namespace` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ✅ (On value only)          |
| Default    | `""`                       |

Example

```yaml
workload:
  $name:
    namespace: ""
```

---

### `workload.$name.parallelism`

Pods of a Job that run at the same time.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `workload.$name.parallelism` |
| Type       | `integer`                    |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `workload.$name.podSpec`

Define the podSpec for the workload

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `workload.$name.podSpec` |
| Type       | `map`                    |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
workload:
  $name:
    podSpec:
      {}
```

---

### `workload.$name.primary`

Set workload as primary

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `workload.$name.primary` |
| Type       | `boolean`                |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Default    | `false`                  |

Example

```yaml
workload:
  $name:
    primary: false
```

---

### `workload.$name.replicas`

Define the number of replicas

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `workload.$name.replicas` |
| Type       | `integer, string`         |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `workload.$name.revisionHistoryLimit`

Define the number of history revisions

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `workload.$name.revisionHistoryLimit` |
| Type       | `number`                              |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `workload.$name.rollingUpdate`

Define the rollingUpdate options Can only be used when `workload.$name.strategy` is `RollingUpdate`

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `workload.$name.rollingUpdate` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `workload.$name.schedule`

Cron schedule of a CronJob.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `workload.$name.schedule` |
| Type       | `string`                  |
| Required   | ✅                        |
| Helm `tpl` | ✅                        |
| Default    | unset                     |

---

### `workload.$name.serviceAccountName`

Suggested is to use the top-level [serviceAccount](/truecharts-common/serviceaccount/) key to define the service account with `targetSelector`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `workload.$name.serviceAccountName` |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ✅ (On value only)                   |
| Default    | `""`                                |

Example

```yaml
workload:
  $name:
    serviceAccountName: ""
```

---

### `workload.$name.startingDeadlineSeconds`

Seconds a CronJob can start late.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `workload.$name.startingDeadlineSeconds` |
| Type       | `integer`                                |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `workload.$name.strategy`

Define the strategy type of the workload. Set `maxUnavailable`, `maxSurge` and `partition` under `rollingUpdate`

A single replica Deployment uses `Recreate` if it mounts a `ReadWriteOnce` or `ReadWriteOncePod` volume. See `allowRollingUpdateWithRWO` to keep `RollingUpdate` with `ReadWriteOnce`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.$name.strategy`               |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |
| Enum       | `Recreate`, `RollingUpdate`, `OnDelete` |

---

### `workload.$name.successfulJobsHistoryLimit`

Successful Jobs of a CronJob that are kept.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `workload.$name.successfulJobsHistoryLimit` |
| Type       | `integer`                                   |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `workload.$name.suspend`

Define if the CronJob is suspended. Forced to `true` when `stopAll` is enabled.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `workload.$name.suspend` |
| Type       | `boolean`                |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `workload.$name.timezone`

Time zone of the schedule of a CronJob. Defaults to `TZ`.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `workload.$name.timezone` |
| Type       | `string`                  |
| Required   | ❌                        |
| Helm `tpl` | ✅                        |
| Default    | unset                     |

---

### `workload.$name.ttlSecondsAfterFinished`

Seconds before a finished Job is deleted.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `workload.$name.ttlSecondsAfterFinished` |
| Type       | `number`                                 |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `workload.$name.type`

Define the kind of the workload

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `workload.$name.type`                                      |
| Type       | `string`                                                   |
| Required   | ✅                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | `""`                                                       |
| Enum       | `Deployment`, `DaemonSet`, `StatefulSet`, `CronJob`, `Job` |

Example

```yaml
workload:
  $name:
    type: ""
```

---

## Child Pages

- [Container](container/) - Configuration for `workload.container`.
- [Podspec](podSpec/) - Configuration for `workload.podSpec`.
- [Terminationgraceperiodseconds](terminationGracePeriodSeconds.md) - See [Termination Grace Period Seconds](/truecharts-common/workload#terminationgraceperiodseconds)

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    namespace: some-namespace
    labels:
      key: value
    annotations:
      key: value
    podSpec:
      labels:
        key: value
      annotations:
        key: value
      automountServiceAccountToken: true
      hostNetwork: false
      hostPID: false
      shareProcessNamespace: false
      enableServiceLinks: false
      schedulerName: some-scheduler
      priorityClassName: some-priority-class-name
      hostname: some-hostname
      terminationGracePeriodSeconds: 100
      nodeSelector:
        disk_type: ssd
      hostAliases:
        - ip: 10.10.10.100
          hostnames:
            - myserver.local
            - storage.local
        - ip: 10.10.10.101
          hostnames:
            - myotherserver.local
            - backups.local
      dnsPolicy: ClusterFirst
      dnsConfig:
        nameservers:
          - 1.1.1.1
          - 1.0.0.1
        searches:
          - ns1.svc.cluster-domain.example
          - my.dns.search.suffix
        options:
          - name: ndots
            value: "1"
          - name: edns0
      tolerations:
        - operator: Exists
          effect: NoExecute
          tolerationSeconds: 3600
      runtimeClassName: some-runtime-class
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
        sysctls:
          - name: net.ipv4.ip_local_port_range
            value: 1024 65535
```

Full examples for each workload type can be found here

- [`Deployment`](/truecharts-common/workload#deployment)
- [`DaemonSet`](/truecharts-common/workload#daemonset)
- [`StatefulSet`](/truecharts-common/workload#statefulset)
- [`CronJob`](/truecharts-common/workload#cronjob)
- [`Job`](/truecharts-common/workload#job)

### Deployment

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 1
    revisionHistoryLimit: 3
    strategy: Recreate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}

  other-workload-name:
    enabled: true
    primary: false
    type: Deployment
    labels: {}
    annotations: {}
    replicas: 1
    revisionHistoryLimit: 3
    strategy: Recreate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}
```

### StatefulSet

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: StatefulSet
    replicas: 1
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      partition: 1
    podSpec: {}

  other-workload-name:
    enabled: true
    primary: false
    type: StatefulSet
    replicas: 1
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      partition: 1
    podSpec: {}
```

### DaemonSet

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}

  other-workload-name:
    enabled: true
    primary: false
    type: DaemonSet
    labels: {}
    annotations: {}
    replicas: 1
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}
```

### Job

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Job
    backoffLimit: 5
    completionMode: Indexed
    completions: 5
    parallelism: 5
    ttlSecondsAfterFinished: 100
    activeDeadlineSeconds: 100
    podSpec:
      restartPolicy: Never

  other-workload-name:
    enabled: true
    primary: false
    type: Job
    podSpec: {}
```

### CronJob

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: CronJob
    schedule: "{{ .Values.cron }}"
    timezone: "{{ .Values.someTimezone }}"
    concurrencyPolicy: Allow
    failedJobsHistoryLimit: 2
    successfulJobsHistoryLimit: 4
    startingDeadlineSeconds: 100
    backoffLimit: 5
    completionMode: Indexed
    completions: 5
    parallelism: 5
    ttlSecondsAfterFinished: 100
    activeDeadlineSeconds: 100
    podSpec:
      restartPolicy: OnFailure

  other-workload-name:
    enabled: true
    primary: false
    type: CronJob
    schedule: "* * * * *"
    podSpec: {}
```
