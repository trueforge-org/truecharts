---
title: Daemonset
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/daemonset#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.daemonset`

---

## `workload.daemonset`

Configuration for workload entries with `type: DaemonSet`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `workload.daemonset` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}

  other-workload-name:
    enabled: true
    primary: false
    type: DaemonSet
    labels: {}
    annotations: {}
    replicas: 1
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}
```
