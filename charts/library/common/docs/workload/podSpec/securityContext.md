---
title: Securitycontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.securityContext`

---

## `workload.podSpec.securityContext`

Pod-level security context.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `workload.podSpec.securityContext` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `workload.podSpec.securityContext.fsGroup`

Group ID applied to mounted volumes.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `workload.podSpec.securityContext.fsGroup` |
| Type       | `integer`                                  |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `568`                                      |

Example

```yaml
workload:
  podSpec:
    securityContext:
      fsGroup: 568
```

---

### `workload.podSpec.securityContext.fsGroupChangePolicy`

Policy controlling when ownership and permissions of volume contents are changed.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `workload.podSpec.securityContext.fsGroupChangePolicy` |
| Type       | `string`                                               |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | `"OnRootMismatch"`                                     |
| Enum       | `Always`, `OnRootMismatch`                             |

Example

```yaml
workload:
  podSpec:
    securityContext:
      fsGroupChangePolicy: OnRootMismatch
```

---

### `workload.podSpec.securityContext.supplementalGroups`

Additional group IDs applied to containers in the pod.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `workload.podSpec.securityContext.supplementalGroups` |
| Type       | `list of integer`                                     |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | `[]`                                                  |

Example

```yaml
workload:
  podSpec:
    securityContext:
      supplementalGroups:
        []
```

---

### `workload.podSpec.securityContext.sysctls`

Kernel parameters to set in the pod's network namespace.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `workload.podSpec.securityContext.sysctls` |
| Type       | `list of map`                              |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `[]`                                       |

Example

```yaml
workload:
  podSpec:
    securityContext:
      sysctls:
        []
```

---
