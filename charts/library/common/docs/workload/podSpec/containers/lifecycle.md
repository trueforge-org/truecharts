---
title: Lifecycle
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/lifecycle#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.lifecycle`

---

## `workload.podSpec.containers.lifecycle`

Does **not** apply to `initContainers`. See [lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle).

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `workload.podSpec.containers.lifecycle.postStart`

Define the postStart hook

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.postStart` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `workload.podSpec.containers.lifecycle.preStop`

Define the preStop hook

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.preStop` |
| Type       | `map`                                           |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          lifecycle:
            preStop:
              type: exec
              command:
                - command
            postStart:
              type: http
              port: 8080
              host: localhost
              path: /path
              httpHeaders:
                key: value
```
