---
title: Probe
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/probes/probe#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.probes.probe`

---

## `workload.podSpec.containers.probes.probe`

Configuration for a workload probe.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `workload.podSpec.containers.probes.probe` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `workload.podSpec.containers.probes.probe.enabled`

Enable or disable the probe.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.probe.enabled` |
| Type       | `boolean, string`                                  |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `workload.podSpec.containers.probes.probe.httpHeaders`

HTTP headers sent with HTTP and HTTPS probes.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `workload.podSpec.containers.probes.probe.httpHeaders` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | `{}`                                                   |

Example

```yaml
workload:
  podSpec:
    containers:
      probes:
        probe:
          httpHeaders:
            {}
```

---

### `workload.podSpec.containers.probes.probe.path`

Request path used by HTTP and HTTPS probes.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.probe.path` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.containers.probes.probe.port`

Probe port. Used by HTTP, HTTPS, TCP, and gRPC probes.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.probe.port` |
| Type       | `integer, string`                               |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.containers.probes.probe.spec`

Probe timing and threshold settings.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.probe.spec` |
| Type       | `map`                                           |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `workload.podSpec.containers.probes.probe.type`

Probe handler type.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `workload.podSpec.containers.probes.probe.type` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |
| Enum       | `exec`, `http`, `https`, `tcp`, `grpc`          |

---
