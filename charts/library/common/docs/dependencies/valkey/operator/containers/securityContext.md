---
title: securityContext
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].securityContext`
- `.Values.dependencies.valkey.operator.exporter.securityContext`

---

## `securityContext`

Security context of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `allowPrivilegeEscalation`

Whether the process can gain more privileges than its parent process.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.allowPrivilegeEscalation` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `appArmorProfile`

AppArmor profile of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.appArmorProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `appArmorProfile.localhostProfile`

Name of the profile loaded on the node, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities`

Linux capabilities added to or dropped from the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.capabilities` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities.add`

Linux capabilities added to the container (for example `NET_ADMIN`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `capabilities.drop`

Linux capabilities dropped from the container (for example `ALL`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.capabilities.drop` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `privileged`

Whether the container runs in privileged mode.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.privileged` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `procMount`

Type of the proc mount of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.procMount` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Default"`, `"Unmasked"` |

---

## `readOnlyRootFilesystem`

Whether the root filesystem of the container is read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.readOnlyRootFilesystem` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `runAsGroup`

Group ID of the first process of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `runAsNonRoot`

Whether the container must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `runAsUser`

User ID of the first process of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions`

SELinux options of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile`

Seccomp profile of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seccompProfile.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Unconfined"`, `"RuntimeDefault"`, `"Localhost"` |

---

## `seccompProfile.localhostProfile`

Path of the profile on the node, relative to the kubelet seccomp directory, with the `Localhost` type.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions`

Windows specific options of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.hostProcess`

Whether the container runs as a HostProcess container, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.runAsUserName`

User name the first process of the container runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].securityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Restricted

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          securityContext:
            runAsNonRoot: true
            runAsUser: 568
            runAsGroup: 568
            readOnlyRootFilesystem: true
            allowPrivilegeEscalation: false
            privileged: false
            capabilities:
              drop:
                - ALL
            seccompProfile:
              type: RuntimeDefault
```

### One added capability

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: net-probe
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          securityContext:
            allowPrivilegeEscalation: false
            capabilities:
              drop:
                - ALL
              add:
                - NET_RAW
```
