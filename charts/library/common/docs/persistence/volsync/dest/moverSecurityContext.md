---
title: moverSecurityContext
---

:::note

- See the [Full Examples](/truecharts-common/persistence/volsync/dest/moverSecurityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.volsync[].dest.moverSecurityContext`

---

## `moverSecurityContext`

Pod security context of the VolSync mover pod of the destination.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `appArmorProfile`

AppArmor profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.appArmorProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `appArmorProfile.type`

Type of the AppArmor profile.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.appArmorProfile.type` |
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
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.appArmorProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fsGroupChangePolicy`

Whether the ownership of the volumes is changed on mount.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.fsGroupChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"OnRootMismatch"`, `"Always"` |

---

## `runAsGroup`

Group ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `runAsNonRoot`

Whether the containers of the pod must run as a non-root user.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsNonRoot` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `runAsUser`

User ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxChangePolicy`

How the SELinux labels of the volumes are changed.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Recursive"`, `"MountOption"` |

---

## `seLinuxOptions`

SELinux options of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.level`

SELinux level label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.level` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.role`

SELinux role label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.role` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.type`

SELinux type label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seLinuxOptions.user`

SELinux user label.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seLinuxOptions.user` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile`

Seccomp profile of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seccompProfile` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `seccompProfile.type`

Type of the seccomp profile.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seccompProfile.type` |
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
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.seccompProfile.localhostProfile` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `supplementalGroups`

Additional group IDs of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.supplementalGroups` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `supplementalGroupsPolicy`

How the supplemental groups are computed, with the groups of the image.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.supplementalGroupsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Merge"`, `"Strict"` |

---

## `sysctls`

Namespaced sysctls set for the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sysctls[]`

A sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sysctls[].name`

Name of the sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sysctls[].value`

Value of the sysctl.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.sysctls[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions`

Windows specific options of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.gmsaCredentialSpec`

Contents of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.gmsaCredentialSpec` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.gmsaCredentialSpecName`

Name of the GMSA credential spec, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.gmsaCredentialSpecName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.hostProcess`

Whether the containers run as HostProcess containers, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.hostProcess` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `windowsOptions.runAsUserName`

User name the first process of the containers runs as, Windows only.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].dest.moverSecurityContext.windowsOptions.runAsUserName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
persistence:
  example:
    volsync:
      - dest:
          moverSecurityContext:
            appArmorProfile:
              type: Unconfined
            fsGroup: 1
```
