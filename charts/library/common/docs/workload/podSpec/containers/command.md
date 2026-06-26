---
title: Command
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/command#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.command`

---

## `workload.podSpec.containers.command`

See [command](/truecharts-common/container/command) ---

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `workload.podSpec.containers.command` |
| Type       | `map, string, list of unknown`        |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

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
          # As a list
          command:
            - command1
            - command2
          # As a string
          command: command
```
