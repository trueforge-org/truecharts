---
title: Probes
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/probes#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.probes`

---

## `workload.podSpec.containers.probes`

Does **not** apply to `initContainers` See [probes](/truecharts-common/container/probes)

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `workload.podSpec.containers.probes` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `workload.podSpec.containers.probes.$name.enabled`

Enable or disable the probe

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.$name.enabled` |
| Type       | `boolean, string`                                  |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.probes.$name.httpHeaders`

Define the httpHeaders - Only applies when `type: http/https`

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `workload.podSpec.containers.probes.$name.httpHeaders` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `workload.podSpec.containers.probes.$name.path`

Define the path - Only applies when `type: http/https`

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.$name.path` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.containers.probes.$name.port`

Define the port - Only applies when `type: grpc/tcp/http/https`

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.$name.port` |
| Type       | `integer, string`                               |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.containers.probes.$name.spec`

Define the probe spec

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.$name.spec` |
| Type       | `map`                                           |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.containers.probes.$name.type`

Define probe type

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.$name.type` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |
| Enum       | `exec`, `http`, `https`, `tcp`, `grpc`          |

---

### `workload.podSpec.containers.probes.liveness`

Define the liveness probe

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.liveness` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `workload.podSpec.containers.probes.readiness`

Define the readiness probe

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.readiness` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `workload.podSpec.containers.probes.startup`

Define the startup probe

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.startup` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

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
          probes:
            liveness:
              enabled: true
              type: https
              port: 8080
              path: /healthz
              httpHeaders:
                key1: value1
                key2: value2
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
            readiness:
              enabled: true
              type: tcp
              port: 8080
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
            startup:
              enabled: true
              type: exec
              command:
                - command1
                - command2
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
```
