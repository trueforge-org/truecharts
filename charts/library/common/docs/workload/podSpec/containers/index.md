---
title: Container
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.$name.podSpec.containers.$name`

---

## Child Pages

- [Args](/truecharts-common/workload/podSpec/containers/args)
- [Command](/truecharts-common/workload/podSpec/containers/command)
- [Container Security Context](/truecharts-common/workload/podSpec/containers/securityContext)
- [Env](/truecharts-common/workload/podSpec/containers/env)
- [Env From](/truecharts-common/workload/podSpec/containers/envFrom)
- [Fixed Env](/truecharts-common/workload/podSpec/containers/fixedEnv)
- [Lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle)
- [Probe](/truecharts-common/workload/podSpec/containers/probe)
- [Probes](/truecharts-common/workload/podSpec/containers/probes)
- [Resources](/truecharts-common/workload/podSpec/containers/resources)
- [Termination](/truecharts-common/workload/podSpec/containers/termination)

---

## `$name`

A container of the pod. The shared container settings are in [container](/truecharts-common/workload/podSpec/containers).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env`

Environment variables of the container, keyed by name. See [env](/truecharts-common/workload/podSpec/containers/env).

See [Env](/truecharts-common/workload/podSpec/containers/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `resources`

CPU, memory and extended resources the container requests and may use. See [resources](/truecharts-common/workload/podSpec/containers/resources).

See [Resources](/truecharts-common/workload/podSpec/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext`

Security context of the container. Overrides `securityContext.container` for this container. See [securityContext](/truecharts-common/workload/podSpec/containers/securityContext).

See [Container Security Context](/truecharts-common/workload/podSpec/containers/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the container is created.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `imageSelector`

Name of the image to use. It is a key on the root of the values that holds `repository`, `tag` and `pullPolicy`, eg `image`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.imageSelector` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `primary`

Whether this is the primary container of the workload. Does **not** apply to `initContainers`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.primary` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `stdin`

Whether stdin stays open for the container (`stdin`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.stdin` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tty`

Whether a TTY is allocated for the container (`tty`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.tty` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes`

Liveness, readiness and startup probes of the container. Does **not** apply to `initContainers`. See [probes](/truecharts-common/workload/podSpec/containers/probes).

See [Probes](/truecharts-common/workload/podSpec/containers/probes) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `command`

Entrypoint of the container (`command`), which replaces the entrypoint of the image. A single command can be given as a string. See [command](/truecharts-common/workload/podSpec/containers/command).

See [Command](/truecharts-common/workload/podSpec/containers/command) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.command` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          command:
            - /bin/sh
```

---

## `lifecycle`

`postStart` and `preStop` hooks of the container. See [lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle).

See [Lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom`

ConfigMaps and Secrets whose keys all become environment variables of the container. See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom).

See [Env From](/truecharts-common/workload/podSpec/containers/envFrom) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `termination`

Where the termination message of the container is read from. See [termination](/truecharts-common/workload/podSpec/containers/termination).

See [Termination](/truecharts-common/workload/podSpec/containers/termination) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.termination` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fixedEnv`

Overrides of the environment variables that common sets on every container: `TZ`, `UMASK`, `PUID` and `NVIDIA_CAPS`. See [fixedEnv](/truecharts-common/workload/podSpec/containers/fixedEnv).

See [Fixed Env](/truecharts-common/workload/podSpec/containers/fixedEnv) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.fixedEnv` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `args`

Arguments of the container (`args`), which replace the `CMD` of the image. A single argument can be given as a string. See [args](/truecharts-common/workload/podSpec/containers/args).

See [Args](/truecharts-common/workload/podSpec/containers/args) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.args` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          args:
            - --port=8080
```

---

## `extraArgs`

Arguments that are appended **after** `args`, as a string or a list.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.extraArgs` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `envList`

Environment variables of the container as a list of name and value pairs.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `envList[]`

An environment variable.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envList[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envList[].name`

Name of the environment variable.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envList[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envList[].value`

Value of the environment variable. Supports Helm `tpl` on strings.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envList[].value` |
| Type | `number or bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

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
          imageSelector: image
          stdin: true
          tty: true
          command:
            - /bin/sh
          args:
            - -c
            - sleep infinity
          extraArgs:
            - --verbose
          env:
            ENV_NAME: ENV_VALUE
          envFrom:
            - secretRef:
                name: secret-name
          fixedEnv:
            TZ: Europe/Amsterdam
          resources:
            limits:
              cpu: 4000m
              memory: 8Gi
            requests:
              cpu: 10m
              memory: 50Mi
          securityContext:
            runAsUser: 568
            runAsGroup: 568
            runAsNonRoot: true
            readOnlyRootFilesystem: true
            allowPrivilegeEscalation: false
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
          lifecycle:
            preStop:
              type: exec
              command:
                - /bin/sh
                - -c
                - sleep 5
          probes:
            liveness:
              enabled: true
              type: http
              port: 8080
              path: /healthz
            readiness:
              enabled: true
              type: tcp
              port: 8080
            startup:
              enabled: true
              type: http
              port: 8080
              path: /healthz

  other-workload-name:
    enabled: true
    primary: false
    podSpec:
      containers:
        other-container-name:
          enabled: true
          primary: true
          imageSelector: image
        sidecar-name:
          enabled: true
          primary: false
          imageSelector: sidecarImage
```
