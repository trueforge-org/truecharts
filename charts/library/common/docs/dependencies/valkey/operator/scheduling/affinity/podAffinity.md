---
title: Podaffinity
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/scheduling/affinity/podAffinity#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.scheduling.affinity.podAffinity`

---

## `dependencies.valkey.operator.scheduling.affinity.podAffinity`

No description provided.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinity` |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution`

Terms the pod should match.

| Field      | Value                                                                                                          |
| ---------- | -------------------------------------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinity.preferredDuringSchedulingIgnoredDuringExecution` |
| Type       | `list of map`                                                                                                  |
| Required   | ❌                                                                                                             |
| Helm `tpl` | ❌                                                                                                             |
| Default    | unset                                                                                                          |

---

### `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution`

Terms the pod must match.

| Field      | Value                                                                                                         |
| ---------- | ------------------------------------------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution` |
| Type       | `list of unknown`                                                                                             |
| Required   | ❌                                                                                                            |
| Helm `tpl` | ❌                                                                                                            |
| Default    | unset                                                                                                         |

---
