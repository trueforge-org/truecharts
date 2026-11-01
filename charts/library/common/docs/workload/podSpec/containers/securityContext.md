---
title: Securitycontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.securityContext`

---

## `workload.podSpec.containers.securityContext`

Define securityContext for the container

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext` |
| Type       | `map, null`                                   |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `workload.podSpec.containers.securityContext.allowPrivilegeEscalation`

Define the allowPrivilegeEscalation for the container

| Field      | Value                                                                  |
| ---------- | ---------------------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.allowPrivilegeEscalation` |
| Type       | `boolean`                                                              |
| Required   | ❌                                                                     |
| Helm `tpl` | ❌                                                                     |
| Default    | unset                                                                  |

---

### `workload.podSpec.containers.securityContext.capabilities`

Define the capabilities for the container If at least one capability is defined in either [`add`](/truecharts-common/container/securitycontext/#securitycontextcapabilitiesadd) or [`drop`](/truecharts-common/container/securitycontext/#securitycontextcapabilitiesdrop)

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.capabilities` |
| Type       | `map`                                                      |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `workload.podSpec.containers.securityContext.privileged`

Define the privileged for the container

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.privileged` |
| Type       | `boolean`                                                |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `workload.podSpec.containers.securityContext.readOnlyRootFilesystem`

Define the readOnlyRootFilesystem for the container

| Field      | Value                                                                |
| ---------- | -------------------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.readOnlyRootFilesystem` |
| Type       | `boolean`                                                            |
| Required   | ❌                                                                   |
| Helm `tpl` | ❌                                                                   |
| Default    | unset                                                                |

---

### `workload.podSpec.containers.securityContext.runAsGroup`

Define the runAsGroup for the container

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.runAsGroup` |
| Type       | `integer`                                                |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `workload.podSpec.containers.securityContext.runAsNonRoot`

Define the runAsNonRoot for the container

| Field      | Value                                                      |
| ---------- | ---------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.runAsNonRoot` |
| Type       | `boolean`                                                  |
| Required   | ❌                                                         |
| Helm `tpl` | ❌                                                         |
| Default    | unset                                                      |

---

### `workload.podSpec.containers.securityContext.runAsUser`

Define the runAsUser for the container

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `workload.podSpec.containers.securityContext.runAsUser` |
| Type       | `integer`                                               |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `workload.podSpec.containers.securityContext.seccompProfile`

Define the seccompProfile for the container

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `workload.podSpec.containers.securityContext.seccompProfile` |
| Type       | `map`                                                        |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |

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
