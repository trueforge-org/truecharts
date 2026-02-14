---
title: Args
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/args#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.args`

---

## `workload.podSpec.containers.args`

See [args](/truecharts-common/container/args#args) ---

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `workload.podSpec.containers.args` |
| Type       | `map, string, list of unknown`     |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

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
          args: arg
          extraArgs:
            - extraArg
```
