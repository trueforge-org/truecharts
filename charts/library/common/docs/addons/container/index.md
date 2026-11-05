---
title: Addon Container
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/addons/container#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container`
- `.Values.addons.gluetun.container`
- `.Values.addons.netshoot.container`

---

## Child Pages

- [lifecycle](/truecharts-common/addons/container/lifecycle)
- [securityContext](/truecharts-common/addons/container/securityContext)
- [env](/truecharts-common/addons/container/env)
- [resources](/truecharts-common/addons/container/resources)
- [fixedEnv](/truecharts-common/addons/container/fixedEnv)

---

## `container`

Container configuration for an addon.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the container of the add-on.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `imageSelector`

Name of the image on the root of the values.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `primary`

Make this the primary container of the workload.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `stdin`

Keep stdin open.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.stdin` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tty`

Allocate a TTY.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.tty` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env`

Environment variables of the container, keyed by name.

See [env](/truecharts-common/addons/container/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `resources`

Resources of the container.

See [resources](/truecharts-common/addons/container/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext`

Security context of the container.

See [securityContext](/truecharts-common/addons/container/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes`

Probes of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.probes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.liveness`

Liveness probe. When it fails, Kubernetes restarts the container. See [probe](/truecharts-common/workload/podSpec/containers/probe).

See [Probe](/truecharts-common/workload/podSpec/containers/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.probes.liveness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.readiness`

Readiness probe. While it fails, the pod is removed from the endpoints of Services. See [probe](/truecharts-common/workload/podSpec/containers/probe).

See [Probe](/truecharts-common/workload/podSpec/containers/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.probes.readiness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.startup`

Startup probe. The other probes wait until it succeeds, which is useful for slow starting apps. See [probe](/truecharts-common/workload/podSpec/containers/probe).

See [Probe](/truecharts-common/workload/podSpec/containers/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.probes.startup` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `command`

Command of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.command` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      command:
        - /bin/sh
```

---

## `args`

Arguments of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.args` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      args:
        - --port=8080
```

---

## `extraArgs`

Arguments added after `args`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.extraArgs` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle`

Lifecycle hooks of the container.

See [lifecycle](/truecharts-common/addons/container/lifecycle) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom`

ConfigMaps and Secrets whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[]`

A ConfigMap or Secret to load the environment variables from. Set one of `configMapRef` or `secretRef`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].configMapRef`

A ConfigMap whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].configMapRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[].configMapRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].configMapRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[].configMapRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `envFrom[].secretRef`

A Secret whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom[].secretRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[].secretRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `envFrom[].secretRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.envFrom[].secretRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `termination`

Termination settings of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.termination` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `termination.messagePolicy`

Where the termination message is taken from (`terminationMessagePolicy`): `File` reads only the message file, `FallbackToLogsOnError` uses the end of the container log when the file is empty and the container failed.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.termination.messagePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      termination:
        messagePolicy: FallbackToLogsOnError
```

---

## `termination.messagePath`

Path of the file the container writes its termination message to (`terminationMessagePath`). Kubernetes uses `/dev/termination-log` when empty.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.termination.messagePath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      termination:
        messagePath: /dev/termination-log
```

---

## `fixedEnv`

Settings of the environment variables that common sets.

See [fixedEnv](/truecharts-common/addons/container/fixedEnv) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `targetSelector`

Workloads to which this container is attached.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

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
