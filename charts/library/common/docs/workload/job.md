---
title: Job
---

:::note

- See the [Full Examples](/truecharts-common/workload/job#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Workload](/truecharts-common/workload) page.
- These options apply only when `type: Job`.

:::

## Appears in

- `.Values.workload.$name`

---

## `completionMode`

Completion mode of a Job: `NonIndexed` or `Indexed` (`completionMode`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.completionMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Indexed"`, `"NonIndexed"` |
| Applies to | `CronJob`, `Job` |

---

## `backoffLimit`

Number of retries before a Job is marked as failed (`backoffLimit`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.backoffLimit` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob`, `Job` |

---

## `completions`

Number of pods that must finish successfully for a Job to complete (`completions`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.completions` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob`, `Job` |

---

## `parallelism`

Maximum number of pods of a Job that run at the same time (`parallelism`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.parallelism` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob`, `Job` |

---

## `ttlSecondsAfterFinished`

Seconds after which a finished Job is deleted automatically (`ttlSecondsAfterFinished`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.ttlSecondsAfterFinished` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob`, `Job` |

---

## `activeDeadlineSeconds`

Maximum number of seconds a Job can run before it is stopped (`activeDeadlineSeconds`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.activeDeadlineSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob`, `Job` |

---

## Full Examples

### Every option

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
    suspend: false
    podSpec:
      restartPolicy: Never
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### NonIndexed

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Job
    backoffLimit: 2
    completionMode: NonIndexed
    completions: 1
    ttlSecondsAfterFinished: 3600
    podSpec:
      restartPolicy: OnFailure
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
          command:
            - /bin/sh
            - -c
            - echo "done"
```
