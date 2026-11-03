---
title: Resizepolicy
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/resizePolicy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.resizePolicy`

---

## `dependencies.valkey.operator.container.resizePolicy`

Resize policy of a resource of the container.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.resizePolicy` |
| Type       | `map`                                                 |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---

### `dependencies.valkey.operator.container.resizePolicy.resourceName`

Resource to resize, for example `cpu` or `memory`.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.container.resizePolicy.resourceName` |
| Type       | `string`                                                           |
| Required   | ✅                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |

---

### `dependencies.valkey.operator.container.resizePolicy.restartPolicy`

Whether the container is restarted when the resource is resized.

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.resizePolicy.restartPolicy` |
| Type       | `string`                                                            |
| Required   | ✅                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | unset                                                               |
| Enum       | `NotRequired`, `RestartContainer`                                   |

---
