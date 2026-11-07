---
title: users
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/users#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.users`

---

## `users`

Additional users of the cluster, see the [valkey-operator docs](https://github.com/valkey-io/valkey-operator/blob/main/docs/valkeycluster.md#users). The `default` user always exists with the password of the credentials, an item named `default` overrides its settings.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A valkey ACL user, with its password, permissions and key access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the user. Can not start with `_`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | `^[^_]` |
| Length | 1 to … |

---

## `[].enabled`

Whether the user can authenticate. Users are enabled when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].passwordSecret`

Secret with the passwords of the user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].passwordSecret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].passwordSecret.name`

Name of the Secret with the passwords. Defaults to the users Secret of the cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].passwordSecret.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].passwordSecret.keys`

Keys of the Secret with the passwords, several keys allow rotation. Defaults to the name of the user.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].passwordSecret.keys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].nopass`

Whether the user can authenticate without a password.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].nopass` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].resetpass`

Whether the ACL rules of the user are reset before the other settings are applied.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].resetpass` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].commands`

Commands the user can and can not run.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].commands` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].commands.allow`

Commands, or categories (`@category`), the user can run.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].commands.allow` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | See below |

Pattern:

```text
^(@[A-Za-z]+|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*(\|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*)?)$
```

---

## `[].commands.deny`

Commands, or categories (`@category`), the user can not run.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].commands.deny` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Pattern | See below |

Pattern:

```text
^(@[A-Za-z]+|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*(\|[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+(-[A-Za-z0-9_]+)*)*)?)$
```

---

## `[].keys`

Key patterns the user can access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].keys.readWrite`

Key patterns the user can read and write.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys.readWrite` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].keys.readOnly`

Key patterns the user can only read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys.readOnly` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].keys.writeOnly`

Key patterns the user can only write.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].keys.writeOnly` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].channels`

Pub/sub channels the user can access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].channels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].channels.patterns`

Pub/sub channel patterns the user can access.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].channels.patterns` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].permissions`

Raw ACL string appended after the generated rules, for example `+@all ~* &*`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users[].permissions` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  valkey:
    operator:
      users:
        - name: app
          enabled: true
          permissions: +@all -@dangerous
          passwordSecret:
            name: app-valkey-password
            keys:
              - password
```
