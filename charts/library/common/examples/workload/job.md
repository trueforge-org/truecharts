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
