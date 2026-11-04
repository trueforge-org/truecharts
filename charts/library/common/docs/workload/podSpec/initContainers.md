---
title: Initcontainers
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/initContainers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.initContainers`

---

## `workload.podSpec.initContainers`

Configuration for `$name.podSpec.initContainers`.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `workload.podSpec.initContainers` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `workload.podSpec.initContainers.$name.args`

Define arg(s). If it's single, can be defined as string

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.args` |
| Type       | `map, string, list of string`                |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [$name.args](containers/args.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.command`

Define command(s). If it's single, can be defined as string

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.command` |
| Type       | `map, string, list of string`                   |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

See [$name.command](containers/command.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.enabled`

Define if the init container is enabled or not

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.enabled` |
| Type       | `boolean, string`                               |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.initContainers.$name.env`

Define env(s) for the init container

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.env` |
| Type       | `map, null`                                 |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [$name.env](containers/env.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.envFrom`

Define envFrom for the init container

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.envFrom` |
| Type       | `list of map`                                   |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

See [$name.envfrom](containers/envFrom.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.image`

Legacy init container `image`, set by `stable/dispatcharr`. The init container template ignores it and reads `imageSelector` instead.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.image` |
| Type       | `string`                                      |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `workload.podSpec.initContainers.$name.imageSelector`

Define the image `map` to use

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.imageSelector` |
| Type       | `string`                                              |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `workload.podSpec.initContainers.$name.name`

Ignored. The chart replaces the init container name with a generated name.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.name` |
| Type       | `string`                                     |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `workload.podSpec.initContainers.$name.probes`

Accepted for compatibility with the shared container shape. The init container spawner replaces probes with disabled probes.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.probes` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

See [$name.probes](containers/probes/) for full configuration.

---

### `workload.podSpec.initContainers.$name.resources`

The resources that the init container can use.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.resources` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

See [$name.resources](containers/resources.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.securityContext`

Define securityContext for the init container

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.securityContext` |
| Type       | `map, null`                                             |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

See [$name.securitycontext](containers/securityContext.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.termination`

Define termination for the init container

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.termination` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

See [$name.termination](../container/termination.md) for full configuration.

---

### `workload.podSpec.initContainers.$name.type`

Define the type of container - Only applies to `initContainers`

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `workload.podSpec.initContainers.$name.type` |
| Type       | `string`                                     |
| Required   | ✅                                           |
| Helm `tpl` | ✅                                           |
| Default    | unset                                        |

---

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
