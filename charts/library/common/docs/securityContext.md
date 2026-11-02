---
title: Securitycontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.securityContext`

---

## `securityContext`

Default security contexts for containers and pods.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `securityContext` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `securityContext.container`

Default security context for all containers.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `securityContext.container` |
| Type       | `map, null`                 |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Container](workload/podSpec/containers/securityContext.md) for full configuration.

---

### `securityContext.pod`

Default security context for all pods.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `securityContext.pod` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Pod](workload/podSpec/securityContext.md) for full configuration.

---
