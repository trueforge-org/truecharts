## Full Examples

The `container` of an addon takes the options of a workload container. Common sets the image, command and environment of the addon itself, so you mostly set resources, the security context, probes and extra environment variables.

### Resources

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
        requests:
          cpu: 100m
          memory: 256Mi
```

### Environment variables

Values can be plain, or come from a Secret, ConfigMap or field:

```yaml
addons:
  netshoot:
    enabled: true
    container:
      env:
        MY_VAR: my-value
        MY_PORT: 8080
        MY_TOKEN:
          secretKeyRef:
            name: my-secret
            key: token
            expandObjectName: false
        MY_SETTING:
          configMapKeyRef:
            name: my-configmap
            key: setting
        POD_NAME:
          fieldRef:
            fieldPath: metadata.name
```

### Environment variables from a ConfigMap or Secret

```yaml
addons:
  codeserver:
    enabled: true
    container:
      envFrom:
        - configMapRef:
            name: my-configmap
            expandObjectName: false
        - secretRef:
            name: my-secret
            expandObjectName: false
```

### Security context

```yaml
addons:
  gluetun:
    enabled: true
    container:
      securityContext:
        runAsUser: 0
        runAsGroup: 0
        runAsNonRoot: false
        readOnlyRootFilesystem: false
        capabilities:
          add:
            - NET_ADMIN
```

### Probes, command and arguments

```yaml
addons:
  netshoot:
    enabled: true
    container:
      probes:
        liveness:
          enabled: false
        readiness:
          enabled: false
        startup:
          enabled: false
      command:
        - /bin/sh
        - -c
      args:
        - sleep infinity
```

### Lifecycle and termination

```yaml
addons:
  codeserver:
    enabled: true
    container:
      lifecycle:
        preStop:
          type: exec
          command:
            - /bin/sh
            - -c
            - sleep 5
      termination:
        messagePath: /dev/termination-log
        messagePolicy: FallbackToLogsOnError
```

### Other options

`targetSelector` selects the workloads of this container, `stdin` and `tty` keep an interactive session open, and `fixedEnv` changes the environment variables that common sets:

```yaml
addons:
  netshoot:
    enabled: true
    container:
      stdin: true
      tty: true
      fixedEnv:
        TZ: Europe/Amsterdam
```
