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
