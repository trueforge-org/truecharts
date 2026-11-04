---
title: Restartrule
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/restartRule#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.restartRule`

---

## `dependencies.valkey.operator.container.restartRule`

Rule that decides whether the container is restarted on exit.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.restartRule` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `dependencies.valkey.operator.container.restartRule.action`

Action taken when the exit codes match.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.restartRule.action` |
| Type       | `string`                                                    |
| Required   | ✅                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |
| Enum       | `Restart`, `RestartAllContainers`                           |

---

### `dependencies.valkey.operator.container.restartRule.exitCodes`

Exit codes the rule applies to.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.restartRule.exitCodes` |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---
