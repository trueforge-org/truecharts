---
title: Deployment
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/deployment#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.deployment`

---

## `workload.deployment`

Configuration for workload entries with `type: Deployment`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `workload.deployment` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 1
    revisionHistoryLimit: 3
    strategy: Recreate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}

  other-workload-name:
    enabled: true
    primary: false
    type: Deployment
    labels: {}
    annotations: {}
    replicas: 1
    revisionHistoryLimit: 3
    strategy: Recreate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
    podSpec: {}
```
