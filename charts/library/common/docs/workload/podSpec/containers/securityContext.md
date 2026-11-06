---
title: Container Security Context
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.securityContext.container`
- `.Values.addons.codeserver.container.securityContext`
- `.Values.addons.gluetun.container.securityContext`
- `.Values.addons.netshoot.container.securityContext`
- `.Values.addons.tailscale.container.securityContext`
- `.Values.workload.$name.podSpec.containers.$name.securityContext`
- `.Values.workload.$name.podSpec.initContainers.$name.securityContext`

---

## `securityContext`

Security context of the container. Overrides `securityContext.container` for this container. See [securityContext](/truecharts-common/workload/podSpec/containers/securityContext).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile`

Seccomp profile of the container (`seccompProfile`), which restricts the system calls it can make.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.seccompProfile` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{"type": "RuntimeDefault"}` |

---

## `seccompProfile.profile`

Path of the profile on the node, relative to the kubelet seccomp directory. Required when `type` is `Localhost`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.seccompProfile.profile` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile.type`

Kind of seccomp profile: `RuntimeDefault` for the profile of the container runtime, `Localhost` for a profile on the node or `Unconfined` for none.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"RuntimeDefault"` |
| Allowed values | `"RuntimeDefault"`, `"Localhost"`, `"Unconfined"` |

---

## `runAsUser`

User ID the container process runs as (`runAsUser`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.runAsUser` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `runAsGroup`

Group ID the container process runs as (`runAsGroup`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.runAsGroup` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only (`readOnlyRootFilesystem`). Mount a `persistence` volume where the app needs to write.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.readOnlyRootFilesystem` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `allowPrivilegeEscalation`

Whether a process can gain more privileges than its parent (`allowPrivilegeEscalation`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.allowPrivilegeEscalation` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `privileged`

Whether the container runs in privileged mode, with almost all the capabilities of the node (`privileged`). Prefer adding single `capabilities`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.privileged` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `runAsNonRoot`

Whether the container must run as a non-root user (`runAsNonRoot`). Common always calculates it: `false` when `runAsUser` or `runAsGroup` is `0`, otherwise `true`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities`

Linux capabilities of the container (`capabilities`). Only rendered when at least one capability is set in `add` or `drop`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.capabilities` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities.add`

Capabilities that are added to the container, eg `NET_ADMIN`. Names are without the `CAP_` prefix.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          securityContext:
            capabilities:
              add:
                - NET_ADMIN
```

---

## `capabilities.drop`

Capabilities that are dropped from the container. `ALL` drops every capability.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.capabilities.drop` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `["ALL"]` |

---

## `capabilities.disableS6Caps`

Disable the capabilities that common adds automatically for S6 based images (`CHOWN`, `SETUID`, `SETGID`, `FOWNER` and `DAC_OVERRIDE`) when the container runs as root.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.capabilities.disableS6Caps` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `PUID`

User ID that is passed to the container as the `PUID` environment variable. Overridable with `fixedEnv.PUID`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.PUID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `UMASK`

File creation mask that is passed to the container as the `UMASK` environment variable. Overridable with `fixedEnv.UMASK`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.securityContext.UMASK` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"0022"` |

---

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
