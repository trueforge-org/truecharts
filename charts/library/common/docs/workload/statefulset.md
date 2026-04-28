---
title: Statefulset
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/statefulset#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.statefulset`

---

## `workload.statefulset`

Configuration for workload entries with `type: StatefulSet`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `workload.statefulset` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: StatefulSet
    replicas: 1
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      partition: 1
    podSpec: {}

  other-workload-name:
    enabled: true
    primary: false
    type: StatefulSet
    replicas: 1
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      partition: 1
    podSpec: {}
```
