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

## External URLs

The "Connecting externally" section lists the URLs of all enabled ingresses and routes, not only the primary one:

- **Ingress**: every path of every host.
- **HTTPRoute**: the first path of each rule, for every hostname. Rules that only redirect and regular expression paths are left out.

These are listed under "Other routes" instead, as they can't be opened as a link: `GRPCRoute`, `TLSRoute`, `TCPRoute` and `UDPRoute`, and any `HTTPRoute` without a hostname or with only wildcard hostnames.

"Exposed services" lists the services that can be reached from outside the cluster:

| Service                                  | Address                                                   |
| ---------------------------------------- | --------------------------------------------------------- |
| `LoadBalancer` with `loadBalancerIP(s)`  | That IP and `port`                                        |
| `LoadBalancer` without an IP             | `<load-balancer-ip>` and `port`, as the provider assigns it |
| `NodePort`                               | `<node-ip>` and `nodePort`                                |
| A port with `hostPort`                   | `<node-ip>` and `hostPort`                                |
| `externalIPs`                            | That IP and `port`                                        |

`http` and `https` ports are shown as links, others as `address:port/PROTOCOL`. A service on a pod with `hostNetwork` is not listed, and nothing is listed with `stopAll`, because these force `ClusterIP`.

If there is no ingress, route or exposed service, the section shows `chartContext.appUrl`.

The URL scheme and port of a route come from:

| Route configuration                                     | URL                    |
| ------------------------------------------------------- | ---------------------- |
| `tls` or `integrations.certManager`                     | `https`, port `443`    |
| First `parentRefs` entry has `port`                     | That port. `80` is `http`, `443` is `https` |
| First `parentRefs` entry has `sectionName` `http` or `web` | `http`, port `80`   |
| Anything else, including `gateway`                      | `https`, port `443`    |

`listenerPort` is not used, because it can differ from the port the gateway is exposed on. `chartContext.appUrl` follows the same rules for the primary route, and does not use `TCPRoute` or `UDPRoute`.

---

## Automatic Connection Information

When dependencies or addons are enabled, the notes output will automatically include a "Connection Information" section with:

**Supported Dependencies:**
- **CNPG (PostgreSQL)**: Host, port, database, username, connection URLs, JDBC URLs
- **MariaDB**: Host, port, database, username, connection URLs, JDBC URLs
- **PostgreSQL** (the `postgresql` dependency): Host, port, database, username, connection URLs, JDBC URLs
- **Valkey**: Host, port (from the `valkey` dependency)
- **MongoDB**: Host, port, database, username, connection URLs, JDBC URLs
- **Clickhouse**: Host, port, database, username, connection URLs, JDBC URLs

Connection URLs contain the password of the database, so they are replaced by `HIDDEN` unless `notes.showCredentials` is `true`.
The JDBC URLs, hosts and usernames do not contain credentials and are always shown.

```yaml
notes:
  showCredentials: true
```

**Supported Addons:**
- **Tailscale**: Status, routes, userspace mode
- **Code-Server**: Status, port
- **Netshoot**: Status

The notes are rendered in the order: header → custom → **connections** → footer → warnings

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

### `notes.showCredentials`

Show credentials (eg, passwords in connection URLs) in NOTES.txt. When disabled, they are replaced by `HIDDEN`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `notes.showCredentials` |
| Type       | `boolean`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | `false`                 |

Example

```yaml
notes:
  showCredentials: false
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

### Example Output with CNPG and Valkey

When a chart has CNPG and the Valkey dependency enabled, the notes output will include (the connection URL contains the password, so it is hidden unless `notes.showCredentials` is `true`):

```
# Thank you for installing myapp by TrueCharts.

# Connection Information

## CNPG Database: main
- Host: "myapp-main-rw"
- Host:Port: "myapp-main-rw:5432"
- Database: app
- Username: app
- Connection URL: "HIDDEN"
- JDBC URL: "jdbc:postgresql://myapp-main-rw:5432/app"

## Valkey Database
- Host: myapp-valkey-main
- Port: 6379
- Host:Port: myapp-valkey-main:6379

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
