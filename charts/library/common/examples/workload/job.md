## Full Examples

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
