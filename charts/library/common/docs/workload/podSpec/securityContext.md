---
title: securityContext
---

:::note

- See the [Full Examples](/truecharts-common/workload/podSpec/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.securityContext.pod`
- `.Values.workload.$name.podSpec.securityContext`

---

## `securityContext`

Pod-level security context.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `fsGroup`

Group ID applied to mounted volumes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `fsGroupChangePolicy`

Policy controlling when ownership and permissions of volume contents are changed.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.fsGroupChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"OnRootMismatch"` |
| Allowed values | `"Always"`, `"OnRootMismatch"` |

---

## `supplementalGroups`

Additional group IDs applied to containers in the pod.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.supplementalGroups` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `sysctls`

Kernel parameters to set in the pod's network namespace.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `sysctls[]`

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sysctls[].name`

Name of the sysctl.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `sysctls[].value`

Value of the sysctl.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
workload:
  workload-name:
    podSpec:
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
        sysctls:
          - name: net.ipv4.ip_local_port_range
            value: 1024 65535
```

```yaml
workload:
  workload-name:
    podSpec:
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
          - 1000
        sysctls:
          - name: net.ipv4.ip_unprivileged_port_start
            value: '0'
```
