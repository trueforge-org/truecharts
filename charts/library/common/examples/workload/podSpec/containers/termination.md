## Full Examples

### File

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
```

### FallbackToLogsOnError

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          termination:
            messagePath: /tmp/termination-message
            messagePolicy: FallbackToLogsOnError
```
