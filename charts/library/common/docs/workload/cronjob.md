---
title: CronJob
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/cronjob#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Workload](/truecharts-common/workload) page.
- These options apply only when `type: CronJob`.

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

## `schedule`

Cron schedule of a CronJob, in the standard 5 field format (`schedule`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.schedule` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `CronJob` |

Example

```yaml
workload:
  example:
    schedule: 0 3 * * *
```

---

## `timezone`

Time zone of the schedule of a CronJob (`timeZone`), eg `Europe/Amsterdam`. Defaults to the `TZ` value.

| Field | Value |
| --- | --- |
| Key | `workload.$name.timezone` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `CronJob` |

Example

```yaml
workload:
  example:
    timezone: Europe/Amsterdam
```

---

## `concurrencyPolicy`

What a CronJob does when the previous run is still running: `Allow` both, `Forbid` the new run or `Replace` the old one (`concurrencyPolicy`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.concurrencyPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"Allow"`, `"Replace"`, `"Forbid"` |
| Applies to | `CronJob` |

---

## `failedJobsHistoryLimit`

Number of failed Jobs of a CronJob that are kept (`failedJobsHistoryLimit`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.failedJobsHistoryLimit` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `CronJob` |

---

## `successfulJobsHistoryLimit`

Number of successful Jobs of a CronJob that are kept (`successfulJobsHistoryLimit`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.successfulJobsHistoryLimit` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob` |

---

## `startingDeadlineSeconds`

Seconds after the scheduled time in which a CronJob can still start a missed run (`startingDeadlineSeconds`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.startingDeadlineSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `CronJob` |

---

## Full Examples

### Every option

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: CronJob
    schedule: "{{ .Values.cron }}"
    timezone: "{{ .Values.someTimezone }}"
    concurrencyPolicy: Forbid
    failedJobsHistoryLimit: 2
    successfulJobsHistoryLimit: 4
    startingDeadlineSeconds: 100
    suspend: false
    backoffLimit: 5
    completionMode: Indexed
    completions: 5
    parallelism: 5
    ttlSecondsAfterFinished: 100
    activeDeadlineSeconds: 100
    podSpec:
      restartPolicy: OnFailure
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Simple schedule

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: CronJob
    schedule: "*/15 * * * *"
    timezone: Europe/Amsterdam
    concurrencyPolicy: Replace
    podSpec:
      restartPolicy: Never
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
          command:
            - /bin/sh
            - -c
            - echo "hello"
```

### Suspended

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: CronJob
    schedule: "0 0 * * *"
    concurrencyPolicy: Allow
    suspend: true
    podSpec:
      restartPolicy: OnFailure
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
