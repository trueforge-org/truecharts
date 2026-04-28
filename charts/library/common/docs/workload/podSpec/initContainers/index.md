---
title: Initcontainers
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/initContainers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.initContainers`

---

## `workload.podSpec.initContainers`

Configuration for `workload.podSpec.initContainers`.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `workload.podSpec.initContainers` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

## Child Pages

- [Args](args.md) - See [args](/truecharts-common/container/args#args) ---
- [Command](command.md) - See [command](/truecharts-common/container/command) ---
- [Env](env.md) - Shared schema for environment variable maps used across common templates.
- [Envfrom](envFrom.md) - Define envFrom for the container
- [Probes](probes.md) - Does **not** apply to `initContainers` See [probes](/truecharts-common/container/probes)
- [Resources](resources.md) - The resources that the container can use.
- [Securitycontext](securityContext.md) - Define securityContext for the container

---
