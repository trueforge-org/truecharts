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

## `container`

Container configuration for an addon.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the container of the add-on.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `imageSelector`

Name of the image on the root of the values.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `primary`

Make this the primary container of the workload.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `stdin`

Keep stdin open.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.stdin` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tty`

Allocate a TTY.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.tty` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env`

Environment variables of the container, keyed by name.

See [Env](/truecharts-common/workload/podSpec/containers/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `resources`

Resources of the container.

See [Resources](/truecharts-common/workload/podSpec/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext`

Security context of the container.

See [Container Security Context](/truecharts-common/workload/podSpec/containers/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes`

Probes of the container.

See [Probes](/truecharts-common/workload/podSpec/containers/probes) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.probes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `command`

Command of the container.

See [Command](/truecharts-common/workload/podSpec/containers/command) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.command` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
addons:
  example:
    container:
      command:
        - /bin/sh
```

---

## `args`

Arguments of the container.

See [Args](/truecharts-common/workload/podSpec/containers/args) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.args` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
addons:
  example:
    container:
      args:
        - --port=8080
```

---

## `extraArgs`

Arguments added after `args`.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.extraArgs` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle`

Lifecycle hooks of the container.

See [Lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom`

ConfigMaps and Secrets whose keys become environment variables.

See [Env From](/truecharts-common/workload/podSpec/containers/envFrom) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `termination`

Termination settings of the container.

See [Termination](/truecharts-common/workload/podSpec/containers/termination) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.termination` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fixedEnv`

Settings of the environment variables that common sets.

See [Fixed Env](/truecharts-common/workload/podSpec/containers/fixedEnv) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.fixedEnv` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `targetSelector`

Workloads to which this container is attached.

| Field | Value |
| --- | --- |
| Key | `addons.$name.container.targetSelector` |
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
