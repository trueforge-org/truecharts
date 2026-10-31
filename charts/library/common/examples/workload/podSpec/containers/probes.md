## Full Examples

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
          probes:
            liveness:
              enabled: true
              type: https
              port: 8080
              path: /healthz
              httpHeaders:
                key1: value1
                key2: value2
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
            readiness:
              enabled: true
              type: tcp
              port: 8080
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
            startup:
              enabled: true
              type: exec
              command:
                - command1
                - command2
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
```
