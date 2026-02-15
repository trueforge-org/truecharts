---
title: Valkey Dependency
---

:::note

- This page documents the Valkey dependency configuration under `dependencies.valkey`.
- Valkey is a Redis-compatible key-value store that can be used as a dependency in TrueCharts applications.

:::

## Appears in

- `.Values.dependencies.valkey`

---

## `dependencies.valkey`

Configuration for the Valkey dependency. When enabled, automatically deploys a Valkey instance and creates the necessary connection credentials.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `dependencies.valkey`   |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | See below               |

Example:

```yaml
dependencies:
  valkey:
    enabled: true
    password: "my-secure-password"
```

---

### `dependencies.valkey.enabled`

Enable or disable the Valkey dependency.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.valkey.enabled`  |
| Type       | `boolean`                      |
| Required   | ❌                             |
| Helm `tpl` | ✅                             |
| Default    | `false`                        |

---

### `dependencies.valkey.password`

Password for Valkey authentication.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.password`  |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ✅                              |
| Default    | `"PLACEHOLDERPASSWORD"`         |

---

### `dependencies.valkey.redisUsername`

Username for Valkey authentication (optional). If not set, authentication uses password only.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.redisUsername`  |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ✅                                   |
| Default    | `""`                                 |

---

### `dependencies.valkey.redisDatabase`

Database index for Valkey connection.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.redisDatabase`  |
| Type       | `string, integer`                    |
| Required   | ❌                                   |
| Helm `tpl` | ✅                                   |
| Default    | `"0"`                                |

---

### `dependencies.valkey.creds`

Auto-generated credentials and connection information. This is populated automatically when the dependency is enabled.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.valkey.creds`  |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Available credential keys:
- `valkeyPassword`: The Valkey password
- `redisPassword`: Alias for compatibility
- `plain`: Hostname only
- `plainhost`: Hostname only
- `plainport`: Hostname with port
- `plainporthost`: Hostname with port
- `plainhostpass`: Username, password and hostname
- `url`: Full connection URL in redis:// format

---

### `dependencies.valkey.secret`

Secret configuration for Valkey credentials.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.secret`  |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | See below                     |

---

### `dependencies.valkey.secret.credentials`

Secret credentials configuration.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.valkey.secret.credentials`   |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | See below                                  |

---

### `dependencies.valkey.secret.credentials.enabled`

Enable secret credentials for Valkey.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.secret.credentials.enabled`    |
| Type       | `boolean`                                           |
| Required   | ❌                                                  |
| Helm `tpl` | ✅                                                  |
| Default    | `false`                                             |

---

## Full Examples

### Basic Valkey Dependency

```yaml
dependencies:
  valkey:
    enabled: true
    password: "my-secure-password"
```

### Valkey with Custom Database

```yaml
dependencies:
  valkey:
    enabled: true
    password: "my-secure-password"
    redisDatabase: 1
```

### Valkey with Username Authentication

```yaml
dependencies:
  valkey:
    enabled: true
    password: "my-secure-password"
    redisUsername: "myuser"
    redisDatabase: 0
```

---

## Notes

- The Valkey dependency automatically creates a secret with connection credentials
- Init containers are automatically added to wait for Valkey to be ready before starting the main container
- Connection information is automatically included in the chart notes
- The dependency is backward compatible with the legacy `redis` configuration
