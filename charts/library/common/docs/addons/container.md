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

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `env.$name`

Environment variable entry by key. A scalar or null is the value, a map holds exactly one of `configMapKeyRef`, `secretKeyRef` or `fieldRef`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name` |
| Type | `number or int or bool or map or null` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `env.$name.configMapKeyRef`

Use a key of a ConfigMap as value.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.$name.configMapKeyRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `env.$name.configMapKeyRef.key`

Key in the ConfigMap whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.$name.configMapKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `env.$name.secretKeyRef`

Use a key of a Secret as value.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.$name.secretKeyRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `env.$name.secretKeyRef.key`

Key in the Secret whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.$name.secretKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `env.$name.fieldRef`

Use a field of the pod as value, eg its name or IP.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.$name.fieldRef.fieldPath`

Path of the field, eg `metadata.name` or `status.podIP`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      env:
        example:
          fieldRef:
            fieldPath: metadata.name
```

---

## `env.$name.fieldRef.apiVersion`

API version of the field path. Kubernetes uses `v1` when empty.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

Resources of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.limits`

Maximum amount of resources the container can use. Limits are **optional**. Set `cpu` and `memory` to `0` to remove them.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"cpu": "1500m", "memory": "2400Mi"}` |

---

## `resources.limits.cpu`

Maximum CPU the container can use, in cores or millicores.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits.cpu` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"1500m"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        limits:
          cpu: 1500m
```

---

## `resources.limits.memory`

Maximum memory the container can use. The container is killed when it uses more.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits.memory` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"2400Mi"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        limits:
          memory: 2Gi
```

---

## `resources.limits.$name`

Extended resource quantity, keyed by resource name (for example `nvidia.com/gpu`). Rendered as-is.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.requests`

Minimum amount of resources the container needs, which the scheduler reserves on a node. Requests are **required**, because without them Kubernetes uses the `limits` as the `requests`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{"cpu": "75m", "memory": "200Mi"}` |

---

## `resources.requests.cpu`

CPU the scheduler reserves for the container, in cores or millicores.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests.cpu` |
| Type | `string or number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"75m"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        requests:
          cpu: 100m
```

---

## `resources.requests.memory`

Memory the scheduler reserves for the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests.memory` |
| Type | `string or number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"200Mi"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        requests:
          memory: 256Mi
```

---

## `resources.requests.$name`

Extended resource quantity, keyed by resource name (for example `ephemeral-storage`). Rendered as-is.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.excludeExtra`

Leave out the extra resources (for example GPUs) that common adds to this container, so only `cpu` and `memory` are rendered.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.excludeExtra` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext`

Security context of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.seccompProfile`

Seccomp profile of the container (`seccompProfile`), which restricts the system calls it can make.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.seccompProfile` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{"type": "RuntimeDefault"}` |

---

## `securityContext.seccompProfile.profile`

Path of the profile on the node, relative to the kubelet seccomp directory. Required when `type` is `Localhost`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.seccompProfile.profile` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.seccompProfile.type`

Kind of seccomp profile: `RuntimeDefault` for the profile of the container runtime, `Localhost` for a profile on the node or `Unconfined` for none.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"RuntimeDefault"` |
| Allowed values | `"RuntimeDefault"`, `"Localhost"`, `"Unconfined"` |

---

## `securityContext.runAsUser`

User ID the container process runs as (`runAsUser`).

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.runAsUser` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `securityContext.runAsGroup`

Group ID the container process runs as (`runAsGroup`).

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.runAsGroup` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `securityContext.readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only (`readOnlyRootFilesystem`). Mount a `persistence` volume where the app needs to write.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.readOnlyRootFilesystem` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `securityContext.allowPrivilegeEscalation`

Whether a process can gain more privileges than its parent (`allowPrivilegeEscalation`).

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.allowPrivilegeEscalation` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `securityContext.privileged`

Whether the container runs in privileged mode, with almost all the capabilities of the node (`privileged`). Prefer adding single `capabilities`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.privileged` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `securityContext.runAsNonRoot`

Whether the container must run as a non-root user (`runAsNonRoot`). Calculated from `runAsUser` and `runAsGroup` when not set.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.capabilities`

Linux capabilities of the container (`capabilities`). Only rendered when at least one capability is set in `add` or `drop`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.capabilities.add`

Capabilities that are added to the container, eg `NET_ADMIN`. Names are without the `CAP_` prefix.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

Example

```yaml
addons:
  codeserver:
    container:
      securityContext:
        capabilities:
          add:
            - NET_ADMIN
```

---

## `securityContext.capabilities.drop`

Capabilities that are dropped from the container. `ALL` drops every capability.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities.drop` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `["ALL"]` |

---

## `securityContext.capabilities.disableS6Caps`

Disable the capabilities that common adds automatically for S6 based images (`CHOWN`, `SETUID`, `SETGID`, `FOWNER` and `DAC_OVERRIDE`) when the container runs as root.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities.disableS6Caps` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `securityContext.PUID`

User ID that is passed to the container as the `PUID` environment variable. Overridable with `fixedEnv.PUID`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.PUID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `securityContext.UMASK`

File creation mask that is passed to the container as the `UMASK` environment variable. Overridable with `fixedEnv.UMASK`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.UMASK` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"0022"` |

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

Liveness probe. When it fails, Kubernetes restarts the container. See [probe](/truecharts-common/container/probe).

See [Probe](/truecharts-common/container/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.probes.liveness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.readiness`

Readiness probe. While it fails, the pod is removed from the endpoints of Services. See [probe](/truecharts-common/container/probe).

See [Probe](/truecharts-common/container/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.probes.readiness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.startup`

Startup probe. The other probes wait until it succeeds, which is useful for slow starting apps. See [probe](/truecharts-common/container/probe).

See [Probe](/truecharts-common/container/probe) for all keys of this object.

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

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `lifecycle.preStop`

Hook that runs before the container is stopped, before it receives SIGTERM.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `lifecycle.preStop.type`

Type of the hook. `exec` runs `command`, `http` and `https` send a GET request.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"exec"`, `"http"`, `"https"` |

---

## `lifecycle.preStop.command`

Command to run, for `type: exec`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.preStop.port`

Port of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.preStop.path`

Path of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.preStop.host`

Host of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.preStop.httpHeaders`

Headers of the request, keyed by name, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `lifecycle.preStop.httpHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.httpHeaders.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `lifecycle.postStart`

Hook that runs right after the container is created. The container is not marked as running until it completes.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `lifecycle.postStart.type`

Type of the hook. `exec` runs `command`, `http` and `https` send a GET request.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"exec"`, `"http"`, `"https"` |

---

## `lifecycle.postStart.command`

Command to run, for `type: exec`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.postStart.port`

Port of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.postStart.path`

Path of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.postStart.host`

Host of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `lifecycle.postStart.httpHeaders`

Headers of the request, keyed by name, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `lifecycle.postStart.httpHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.httpHeaders.$name` |
| Type | `string or number or bool` |
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

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fixedEnv.NVIDIA_CAPS`

Capabilities of the NVIDIA driver that are made available (`NVIDIA_DRIVER_CAPABILITIES`), for containers that use an `nvidia.com/gpu` resource. Allowed entries are `all`, `compute`, `utility`, `graphics` and `video`, and entries must be unique. Defaults to `containerOptions.NVIDIA_CAPS`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.NVIDIA_CAPS` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        NVIDIA_CAPS:
          - compute
          - utility
```

---

## `fixedEnv.TZ`

Time zone of the container (`TZ`). Defaults to the top-level `TZ` value.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.TZ` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        TZ: Europe/Amsterdam
```

---

## `fixedEnv.UMASK`

File creation mask of the container (`UMASK` and `UMASK_SET`). Defaults to `securityContext.container.UMASK`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.UMASK` |
| Type | `string or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        UMASK: '0022'
```

---

## `fixedEnv.PUID`

User ID of the container (`PUID`), used by images that drop privileges themselves. Defaults to `securityContext.container.PUID`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.PUID` |
| Type | `string or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        PUID: 568
```

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
