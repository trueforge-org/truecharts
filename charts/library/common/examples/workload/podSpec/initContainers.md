## Full Examples

### Probes

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

#### Resources

```yaml
resources:
  limits:
    cpu: 4000m
    memory: 8Gi
  requests:
    cpu: 10m
    memory: 50Mi
```

#### Security context

```yaml
securityContext:
  container:
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
        - SYS_ADMIN
        - SYS_PTRACE
      drop:
        - ALL
  pod:
    fsGroup: 568
    fsGroupChangePolicy: OnRootMismatch
    supplementalGroups:
      - 568
      - 1000
    sysctls:
      - name: net.ipv4.ip_unprivileged_port_start
        value: "0"
```

### Args

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
          args: arg
          extraArgs:
            - extraArg
```

### Command

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
          # As a list
          command:
            - command1
            - command2
          # As a string
          command: command
```

### Env

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
          env:
            ENV_NAME1: ENV_VALUE
            ENV_NAME2: "{{ .Values.some.path }}"
            ENV_NAME3:
              configMapKeyRef:
                # This will be expanded to 'fullname-configmap-name'
                name: configmap-name
                key: configmap-key
            ENV_NAME4:
              secretKeyRef:
                name: secret-name
                key: secret-key
                expandObjectName: false
            ENV_NAME5:
              fieldRef:
                fieldPath: metadata.name
                apiVersion: v1
```

### EnvFrom

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
          envFrom:
            - secretRef:
                # This will be expanded to `fullname-secret-name`
                name: secret-name
            - configMapRef:
                name: configmap-name
                expandObjectName: false
```
