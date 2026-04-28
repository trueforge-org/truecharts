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

Define the activeDeadlineSeconds

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `workload.$name.activeDeadlineSeconds` |
| Type       | `integer`                              |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `workload.$name.annotations`

Define annotations for workload

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `workload.$name.annotations` |
| Type       | `map, string`                |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Example

```yaml
workload:
  $name:
    annotations:
      {}
```

---

### `workload.$name.backoffLimit`

Define the backoffLimit

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `workload.$name.backoffLimit` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `workload.$name.completionMode`

Define the completionMode

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

Define the completions

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `workload.$name.completions` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `workload.$name.concurrencyPolicy`

Define the concurrencyPolicy

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `workload.$name.concurrencyPolicy` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |
| Enum       | `Allow`, `Replace`, `Forbid`       |

---

### `workload.$name.containers`

Define container(s) for the workload See [Container](/truecharts-common/container/) for more information

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

Configuration for `workload.main.dbWait`.

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
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `false`                  |

Example

```yaml
workload:
  $name:
    enabled: false
```

---

### `workload.$name.failedJobsHistoryLimit`

Define the failedJobsHistoryLimit

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.$name.failedJobsHistoryLimit` |
| Type       | `integer`                               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `workload.$name.initContainers`

Define workload objects

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
| Type       | `map, string`           |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `{}`                    |

Example

```yaml
workload:
  $name:
    labels:
      {}
```

---

### `workload.$name.namespace`

Define the namespace for this object

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `workload.$name.namespace` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `""`                       |

Example

```yaml
workload:
  $name:
    namespace: ""
```

---

### `workload.$name.parallelism`

Define the parallelism

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
| Required   | ❌                       |
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
| Required   | ❌                       |
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
| Type       | `map`                                 |
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

Define the schedule

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `workload.$name.schedule` |
| Type       | `string`                  |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `workload.$name.serviceAccountName`

Suggested is to use the top-level [serviceAccount](/truecharts-common/serviceaccount/) key to define the service account with `targetSelector`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `workload.$name.serviceAccountName` |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `""`                                |

Example

```yaml
workload:
  $name:
    serviceAccountName: ""
```

---

### `workload.$name.startingDeadlineSeconds`

Define the startingDeadlineSeconds

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `workload.$name.startingDeadlineSeconds` |
| Type       | `integer`                                |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `workload.$name.strategy`

Define the strategy of the workload

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.$name.strategy`               |
| Type       | `string, map`                           |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |
| Enum       | `Recreate`, `RollingUpdate`, `OnDelete` |

---

### `workload.$name.successfulJobsHistoryLimit`

Define the successfulJobsHistoryLimit

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `workload.$name.successfulJobsHistoryLimit` |
| Type       | `integer`                                   |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `workload.$name.timezone`

Define the timezone

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `workload.$name.timezone` |
| Type       | `string`                  |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `workload.$name.ttlSecondsAfterFinished`

Define the ttlSecondsAfterFinished

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `workload.$name.ttlSecondsAfterFinished` |
| Type       | `map`                                    |
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
| Required   | ❌                                                         |
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
- [Cronjob](cronjob.md) - Configuration for workload entries with `type: CronJob`.
- [Daemonset](daemonset.md) - Configuration for workload entries with `type: DaemonSet`.
- [Deployment](deployment.md) - Configuration for workload entries with `type: Deployment`.
- [Job](job.md) - Configuration for workload entries with `type: Job`.
- [Podspec](podSpec/) - Configuration for `workload.podSpec`.
- [Statefulset](statefulset.md) - Configuration for workload entries with `type: StatefulSet`.
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

- [`Deployment`](/truecharts-common/workload/deployment)
- [`DaemonSet`](/truecharts-common/workload/daemonset)
- [`StatefulSet`](/truecharts-common/workload/statefulset)
- [`CronJob`](/truecharts-common/workload/cronjob)
- [`Job`](/truecharts-common/workload/job)
