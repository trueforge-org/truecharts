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

Does **not** apply to `initContainers`. See [lifecycle](/truecharts-common/container/lifecycle).

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `workload.podSpec.containers.lifecycle.$name.host`

Define the host - Only applies when `type: http` or `type: https`

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.$name.host` |
| Type       | `string`                                           |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.lifecycle.$name.httpHeaders`

Define lifecycle for the container

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.$name.httpHeaders` |
| Type       | `map`                                                     |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `workload.podSpec.containers.lifecycle.$name.path`

Define the path - Only applies when `type: http` or `type: https`

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.$name.path` |
| Type       | `string`                                           |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.lifecycle.$name.port`

Define the port - Only applies when `type: http` or `type: https`

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.$name.port` |
| Type       | `integer, string`                                  |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.lifecycle.$name.type`

Define hook type

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.$name.type` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.lifecycle.postStart`

Define preStop lifecycle

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `workload.podSpec.containers.lifecycle.postStart` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `workload.podSpec.containers.lifecycle.preStop`

Define preStop lifecycle

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
