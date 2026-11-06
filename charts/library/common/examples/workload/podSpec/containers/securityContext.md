## Full Examples

### Non-root

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
          securityContext:
            PUID: 568
            UMASK: "002"
            runAsNonRoot: true
            runAsUser: 568
            runAsGroup: 568
            readOnlyRootFilesystem: true
            allowPrivilegeEscalation: false
            privileged: false
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              add:
                - NET_BIND_SERVICE
              drop:
                - ALL
```

### Root with extra capabilities

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
          securityContext:
            runAsNonRoot: false
            runAsUser: 0
            runAsGroup: 0
            readOnlyRootFilesystem: false
            capabilities:
              add:
                - SYS_ADMIN
                - SYS_PTRACE
              disableS6Caps: true
```

### Localhost seccomp profile

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
          securityContext:
            seccompProfile:
              type: Localhost
              profile: profiles/audit.json
```

### Privileged

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
          securityContext:
            privileged: true
            allowPrivilegeEscalation: true
            runAsNonRoot: false
            runAsUser: 0
            runAsGroup: 0
```
