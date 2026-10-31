---
title: Job
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/job#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.job`

---

## `workload.job`

Configuration for workload entries with `type: Job`.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `workload.job` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Job
    backoffLimit: 5
    completionMode: Indexed
    completions: 5
    parallelism: 5
    ttlSecondsAfterFinished: 100
    activeDeadlineSeconds: 100
    podSpec:
      restartPolicy: Never

  other-workload-name:
    enabled: true
    primary: false
    type: Job
    podSpec: {}
```
