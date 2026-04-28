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
