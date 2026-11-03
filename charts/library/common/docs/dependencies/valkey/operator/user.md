---
title: User
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/user#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.user`

---

## `dependencies.valkey.operator.user`

No description provided.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.operator.user` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `dependencies.valkey.operator.user.channels`

Pub/sub channels the user can access.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.operator.user.channels` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `dependencies.valkey.operator.user.commands`

Commands the user can and can not run.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.operator.user.commands` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `dependencies.valkey.operator.user.enabled`

Whether the user can authenticate. Users are enabled when unset.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.valkey.operator.user.enabled` |
| Type       | `boolean`                                   |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `dependencies.valkey.operator.user.keys`

Key patterns the user can access.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.operator.user.keys` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `dependencies.valkey.operator.user.name`

Name of the user. Can not start with `_`.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.operator.user.name` |
| Type       | `string`                                 |
| Required   | ✅                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |
| Min Length | `1`                                      |

---

### `dependencies.valkey.operator.user.nopass`

Whether the user can authenticate without a password.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.valkey.operator.user.nopass` |
| Type       | `boolean`                                  |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `dependencies.valkey.operator.user.passwordSecret`

Secret with the passwords of the user.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.user.passwordSecret` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

---

### `dependencies.valkey.operator.user.permissions`

Raw ACL string appended after the generated rules, for example `+@all ~* &*`.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `dependencies.valkey.operator.user.permissions` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `dependencies.valkey.operator.user.resetpass`

Whether the ACL rules of the user are reset before the other settings are applied.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.valkey.operator.user.resetpass` |
| Type       | `boolean`                                     |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---
