## Full Examples

### exec

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
          lifecycle:
            preStop:
              type: exec
              command:
                - /bin/sh
                - -c
                - sleep 10
            postStart:
              type: exec
              command: /bin/warmup
```

### http

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
          lifecycle:
            preStop:
              type: http
              port: 8080
              host: localhost
              path: /shutdown
              httpHeaders:
                key: value
            postStart:
              type: http
              port: "{{ .Values.service.main.ports.main.port }}"
              path: /ready
```

### https

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
          lifecycle:
            preStop:
              type: https
              port: 8443
              host: localhost
              path: /shutdown
              httpHeaders:
                Authorization: Bearer token
            postStart:
              type: https
              port: 8443
              path: /started
```
