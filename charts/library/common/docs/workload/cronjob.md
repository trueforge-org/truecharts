---
title: Cronjob
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/cronjob#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.cronjob`

---

## `workload.cronjob`

Configuration for workload entries with `type: CronJob`.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `workload.cronjob` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `workload.cronjob.schedule`

No description provided.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `workload.cronjob.schedule` |
| Type       | `string`                    |
| Required   | ✅                          |
| Helm `tpl` | ❌                          |
| Default    | `""`                        |
| Min Length | `1`                         |

Example

```yaml
workload:
  cronjob:
    schedule: ""
```

---

## Full Examples

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
