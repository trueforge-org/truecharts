---
title: Fixedenv
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/fixedEnv#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.fixedEnv`

---

## `workload.podSpec.containers.fixedEnv`

See [fixedEnv](/truecharts-common/container/fixedenv).

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `workload.podSpec.containers.fixedEnv` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `workload.podSpec.containers.fixedEnv.NVIDIA_CAPS`

Override fixedEnv for the container By default it will set the following environment variables:

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.fixedEnv.NVIDIA_CAPS` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.fixedEnv.PUID`

Override the PUID for the container

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `workload.podSpec.containers.fixedEnv.PUID` |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `workload.podSpec.containers.fixedEnv.TZ`

Override the timezone for the container

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `workload.podSpec.containers.fixedEnv.TZ` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `workload.podSpec.containers.fixedEnv.UMASK`

Override the umask for the container

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `workload.podSpec.containers.fixedEnv.UMASK` |
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
          fixedEnv:
            TZ: "America/New_York"
            NVIDIA_CAPS:
              - compute
            UMASK: "003"
            PUID: "0"
```
