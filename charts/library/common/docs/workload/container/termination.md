---
title: Termination
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/container/termination#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.container.termination`

---

## `workload.container.termination`

See [termination](/truecharts-common/container/termination) ---

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `workload.container.termination` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `workload.container.termination.messagePath`

Define termination message path for the container

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `workload.container.termination.messagePath` |
| Type       | `string`                                     |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `workload.container.termination.messagePolicy`

Define termination for the container

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `workload.container.termination.messagePolicy` |
| Type       | `string`                                       |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

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
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
```
