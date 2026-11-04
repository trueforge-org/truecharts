---
title: Containers
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers`

---

## `workload.podSpec.containers`

Configuration for `workload.podSpec.containers`.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `workload.podSpec.containers` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

## Child Pages

- [Args](args.md) - See [args](/truecharts-common/workload/podSpec/containers/args#args) ---
- [Command](command.md) - See [command](/truecharts-common/workload/podSpec/containers/command) ---
- [Env](env.md) - Shared schema for environment variable maps used across common templates.
- [Envfrom](envFrom.md) - Define envFrom for the container
- [Fixedenv](fixedEnv.md) - See [fixedEnv](/truecharts-common/workload/podSpec/containers/fixedEnv).
- [Lifecycle](lifecycle.md) - Does **not** apply to `initContainers`. See [lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle).
- [Probes](probes/) - Does **not** apply to `initContainers` See [probes](/truecharts-common/workload/podSpec/containers/probes)
- [Resources](resources.md) - The resources that the container can use.
- [Securitycontext](securityContext.md) - Define securityContext for the container

---
