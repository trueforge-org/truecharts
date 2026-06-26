---
title: Securitycontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/initContainers/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.initContainers.securityContext`

---

## `workload.podSpec.initContainers.securityContext`

Define securityContext for the container

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.securityContext` |
| Type       | `map, null`                                       |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `workload.podSpec.initContainers.securityContext.allowPrivilegeEscalation`

Define the allowPrivilegeEscalation for the container

| Field      | Value                                                                      |
| ---------- | -------------------------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.securityContext.allowPrivilegeEscalation` |
| Type       | `boolean`                                                                  |
| Required   | ❌                                                                         |
| Helm `tpl` | ❌                                                                         |
| Default    | unset                                                                      |

---

### `workload.podSpec.initContainers.securityContext.capabilities`

Define the capabilities for the container If at least one capability is defined in either [`add`](/truecharts-common/container/securitycontext/#securitycontextcapabilitiesadd) or [`drop`](/truecharts-common/container/securitycontext/#securitycontextcapabilitiesdrop)

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.securityContext.capabilities` |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `workload.podSpec.initContainers.securityContext.privileged`

Define the privileged for the container

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `workload.podSpec.initContainers.securityContext.privileged` |
| Type       | `boolean`                                                    |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `workload.podSpec.initContainers.securityContext.readOnlyRootFilesystem`

Define the readOnlyRootFilesystem for the container

| Field      | Value                                                                    |
| ---------- | ------------------------------------------------------------------------ |
| Key        | `workload.podSpec.initContainers.securityContext.readOnlyRootFilesystem` |
| Type       | `boolean`                                                                |
| Required   | ❌                                                                       |
| Helm `tpl` | ❌                                                                       |
| Default    | unset                                                                    |

---

### `workload.podSpec.initContainers.securityContext.runAsGroup`

Define the runAsGroup for the container

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `workload.podSpec.initContainers.securityContext.runAsGroup` |
| Type       | `integer`                                                    |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

---

### `workload.podSpec.initContainers.securityContext.runAsNonRoot`

Define the runAsNonRoot for the container

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.securityContext.runAsNonRoot` |
| Type       | `boolean`                                                      |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `workload.podSpec.initContainers.securityContext.runAsUser`

Define the runAsUser for the container

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.securityContext.runAsUser` |
| Type       | `integer`                                                   |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `workload.podSpec.initContainers.securityContext.seccompProfile`

Define the seccompProfile for the container

| Field      | Value                                                            |
| ---------- | ---------------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.securityContext.seccompProfile` |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | unset                                                            |

---

## Full Examples

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
