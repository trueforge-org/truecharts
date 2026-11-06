---
title: Redis
---

:::note

- See the [Full Examples](/truecharts-common/redis#full-examples) section for complete examples.

:::

## Appears in

- `.Values.redis`

---

## `redis`

Redis dependency configuration. See [redis](/truecharts-common/redis).

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. They come from the Helm subchart dependency that defines this object: Helm adds the default values of the subchart here. Do not set them in the values of the chart.

:::

| Field | Value |
| --- | --- |
| Key | `redis` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the Redis dependency. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `redis.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `includeCommon`

Marker for charts that the dependency uses common. Not read by common.

| Field | Value |
| --- | --- |
| Key | `redis.includeCommon` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `redis.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |
| Length | 1 to … |

---

## `redisUsername`

Username used in the connection URL. Empty when not set.

| Field | Value |
| --- | --- |
| Key | `redis.redisUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `redisDatabase`

Index of the database used in the connection URL. Uses `0` when unset.

| Field | Value |
| --- | --- |
| Key | `redis.redisDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret`

Not read by common, the credentials Secret is always created when the dependency is enabled.

| Field | Value |
| --- | --- |
| Key | `redis.secret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"credentials": {"enabled": false}}` |

---

## `secret.credentials`

Not read by common.

| Field | Value |
| --- | --- |
| Key | `redis.secret.credentials` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `secret.credentials.enabled`

Not read by common.

| Field | Value |
| --- | --- |
| Key | `redis.secret.credentials.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `creds`

Connection details written by common, so apps using the dependency can use them. Read only.

| Field | Value |
| --- | --- |
| Key | `redis.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `creds.redisPassword`

Password.

| Field | Value |
| --- | --- |
| Key | `redis.creds.redisPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plain`

Hostname.

| Field | Value |
| --- | --- |
| Key | `redis.creds.plain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainhost`

Hostname.

| Field | Value |
| --- | --- |
| Key | `redis.creds.plainhost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainport`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `redis.creds.plainport` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainporthost`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `redis.creds.plainporthost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainhostpass`

User, password and hostname.

| Field | Value |
| --- | --- |
| Key | `redis.creds.plainhostpass` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.url`

Connection URL.

| Field | Value |
| --- | --- |
| Key | `redis.creds.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Redis with a custom password

The password and the database index are used in the connection URL. The password is a placeholder, set your own value:

```yaml
redis:
  enabled: true
  password: example-placeholder-password
  redisUsername: ""
  redisDatabase: "1"
```
