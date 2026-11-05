---
title: securityContext
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.addons.codeserver.container.securityContext`
- `.Values.addons.gluetun.container.securityContext`
- `.Values.addons.netshoot.container.securityContext`

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

## `seccompProfile`

Seccomp profile of the container (`seccompProfile`), which restricts the system calls it can make.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.seccompProfile` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{"type": "RuntimeDefault"}` |

---

## `seccompProfile.profile`

Path of the profile on the node, relative to the kubelet seccomp directory. Required when `type` is `Localhost`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.seccompProfile.profile` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile.type`

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

## `runAsUser`

User ID the container process runs as (`runAsUser`).

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.runAsUser` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `runAsGroup`

Group ID the container process runs as (`runAsGroup`).

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.runAsGroup` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only (`readOnlyRootFilesystem`). Mount a `persistence` volume where the app needs to write.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.readOnlyRootFilesystem` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `allowPrivilegeEscalation`

Whether a process can gain more privileges than its parent (`allowPrivilegeEscalation`).

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.allowPrivilegeEscalation` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `privileged`

Whether the container runs in privileged mode, with almost all the capabilities of the node (`privileged`). Prefer adding single `capabilities`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.privileged` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `runAsNonRoot`

Whether the container must run as a non-root user (`runAsNonRoot`). Calculated from `runAsUser` and `runAsGroup` when not set.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities`

Linux capabilities of the container (`capabilities`). Only rendered when at least one capability is set in `add` or `drop`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities.add`

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

## `capabilities.drop`

Capabilities that are dropped from the container. `ALL` drops every capability.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities.drop` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `["ALL"]` |

---

## `capabilities.disableS6Caps`

Disable the capabilities that common adds automatically for S6 based images (`CHOWN`, `SETUID`, `SETGID`, `FOWNER` and `DAC_OVERRIDE`) when the container runs as root.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.capabilities.disableS6Caps` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `PUID`

User ID that is passed to the container as the `PUID` environment variable. Overridable with `fixedEnv.PUID`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.PUID` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `UMASK`

File creation mask that is passed to the container as the `UMASK` environment variable. Overridable with `fixedEnv.UMASK`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.securityContext.UMASK` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"0022"` |

---
