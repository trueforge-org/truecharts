---
title: Notes
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/notes#full-examples) section for complete examples.

:::

## Appears in

- `.Values.notes`

---

## `notes`

Define values for `NOTES.txt`

The notes system automatically includes connection information for enabled dependencies (databases) and addons when the chart is installed or upgraded. This provides users with immediate access to connection strings and configuration details.

| Field      | Value   |
| ---------- | ------- |
| Key        | `notes` |
| Type       | `map`   |
| Required   | ❌      |
| Helm `tpl` | ❌      |
| Default    | `{}`    |

Example

```yaml
notes:
  {}
```

---

## Automatic Connection Information

When dependencies or addons are enabled, the notes output will automatically include a "Connection Information" section with:

**Supported Dependencies:**
- **CNPG (PostgreSQL)**: Host, port, database, username, connection URLs, JDBC URLs
- **MariaDB**: Host, port, database, username, connection URLs, JDBC URLs
- **Redis**: Host, port, database index, connection URLs
- **MongoDB**: Host, port, database, username, connection URLs, JDBC URLs
- **Clickhouse**: Host, port, database, username, connection URLs, JDBC URLs
- **Solr**: Host, port, cores, authentication status, connection URLs

**Supported Addons:**
- **Tailscale**: Status, routes, userspace mode
- **Code-Server**: Status, port
- **Netshoot**: Status

The connection information is rendered in the order: header → custom → **connections** → footer → warnings

---

### `notes.custom`

Define values for `NOTES.txt`

| Field      | Value          |
| ---------- | -------------- |
| Key        | `notes.custom` |
| Type       | `string`       |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | `""`           |

Example

```yaml
notes:
  custom: ""
```

---

### `notes.footer`

Define values for `NOTES.txt`

| Field      | Value          |
| ---------- | -------------- |
| Key        | `notes.footer` |
| Type       | `string`       |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | See schema     |

Example

```yaml
notes:
  footer: "# Documentation\nDocumentation for this chart can be found at ...\n# Bug reports\nIf you find a bug in this chart, please file an issue at ...\n"
```

---

### `notes.header`

Define values for `NOTES.txt`

| Field      | Value                                                                         |
| ---------- | ----------------------------------------------------------------------------- |
| Key        | `notes.header`                                                                |
| Type       | `string`                                                                      |
| Required   | ❌                                                                            |
| Helm `tpl` | ❌                                                                            |
| Default    | `"# Welcome to TrueCharts!\nThank you for installing <{{ .Chart.Name }}>.\n"` |

Example

```yaml
notes:
  header: "# Welcome to TrueCharts!\nThank you for installing <{{ .Chart.Name }}>.\n"
```

---

### `notes.warnings`

Configuration for `notes.warnings`.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `notes.warnings`  |
| Type       | `list of unknown` |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

## Full Examples

### Basic Custom Message

```yaml
notes:
  custom: |
    This is a custom message
```

### Example Output with CNPG and Redis

When a chart has CNPG and Redis enabled, the notes output will include:

```
# Thank you for installing myapp by TrueCharts.

# Connection Information

## CNPG Database: main
- Host: "myapp-main-rw"
- Host:Port: "myapp-main-rw:5432"
- Database: app
- Username: app
- Connection URL: "postgresql://app:***@myapp-main-rw:5432/app"
- JDBC URL: "jdbc:postgresql://myapp-main-rw:5432/app"

## Redis Database
- Host: "myapp-redis"
- Host:Port: "myapp-redis:6379"
- Database Index: 0
- Connection URL: "redis://:***@myapp-redis:6379/0"

## Documentation
Please check out the TrueCharts documentation on:
https://truecharts.org
```

### Example Output with Addons

When addons like Tailscale are enabled:

```
# Connection Information

## Tailscale VPN Addon
- Status: Enabled
- Routes: 10.0.0.0/8
- Userspace Mode: true
- Note: Tailscale provides secure VPN connectivity as a sidecar container
```
