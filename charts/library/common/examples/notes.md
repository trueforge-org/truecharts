## Full Examples

### Basic custom message

`custom` replaces the default text between the header and the connection information:

```yaml
notes:
  custom: |
    This is a custom message
```

### Header, footer and warnings

All of them support Helm `tpl`. `warnings` are shown at the end of the notes:

```yaml
notes:
  header: |
    # Welcome to {{ .Chart.Name }}
  footer: |
    ## Documentation
    Documentation for this chart can be found at https://example.com/docs
  warnings:
    - This chart needs a ReadWriteMany storage class for the shared volume.
    - Back up your data before you upgrade.
```

### Show credentials

Connection URLs contain the password of the database, so they are replaced by `HIDDEN` unless `showCredentials` is `true`. The JDBC URLs, hosts and usernames do not contain credentials and are always shown:

```yaml
notes:
  showCredentials: true
```

### Example output with PostgreSQL and Valkey

When a chart has the PostgreSQL (in the default `operator` mode, so provided by CNPG) and Valkey dependencies enabled, the notes output includes:

```text
# Thank you for installing myapp by TrueCharts.

# Connection Information

## PostgreSQL Database
- Host: myapp-cnpg-main-rw
- Port: 5432
- Host:Port: myapp-cnpg-main-rw:5432
- Database: app
- Username: app
- Connection URL: HIDDEN
- JDBC URL: "jdbc:postgresql://myapp-cnpg-main-rw:5432/app"

## Valkey Database
- Host: myapp-valkey-main
- Port: 6379
- Host:Port: myapp-valkey-main:6379

## Documentation
Please check out the TrueCharts documentation on:
https://truecharts.org
```

### Example output with addons

When addons like Tailscale are enabled:

```text
# Connection Information

## Tailscale VPN Addon
- Status: Enabled
- Routes: 10.0.0.0/8
- Userspace Mode: true
- Note: Tailscale provides secure VPN connectivity as a sidecar container
```

## External URLs

The "Connecting externally" section lists the URLs of all enabled ingresses and routes, not only the primary one:

- **Ingress**: every path of every host.
- **HTTPRoute**: the first path of each rule, for every hostname. Rules that only redirect and regular expression paths are left out.

These are listed under "Other routes" instead, as they can't be opened as a link: `GRPCRoute`, `TLSRoute`, `TCPRoute` and `UDPRoute`, and any `HTTPRoute` without a hostname or with only wildcard hostnames.

"Exposed services" lists the services that can be reached from outside the cluster:

| Service | Address |
| --- | --- |
| `LoadBalancer` with `loadBalancerIP(s)` | That IP and `port` |
| `LoadBalancer` without an IP | `<load-balancer-ip>` and `port`, as the provider assigns it |
| `NodePort` | `<node-ip>` and `nodePort` |
| A port with `hostPort` | `<node-ip>` and `hostPort` |
| `externalIPs` | That IP and `port` |

`http` and `https` ports are shown as links, others as `address:port/PROTOCOL`. A service on a pod with `hostNetwork` is not listed, and nothing is listed with `stopAll`, because these force `ClusterIP`.

If there is no ingress, route or exposed service, the section shows `chartContext.appUrl`.

The URL scheme and port of a route come from:

| Route configuration | URL |
| --- | --- |
| `tls` or `integrations.certManager` | `https`, port `443` |
| First `parentRefs` entry has `port` | That port. `80` is `http`, `443` is `https` |
| First `parentRefs` entry has `sectionName` `http` or `web` | `http`, port `80` |
| Anything else, including `gateway` | `https`, port `443` |

`listenerPort` is not used, because it can differ from the port the gateway is exposed on. `chartContext.appUrl` follows the same rules for the primary route, and does not use `TCPRoute` or `UDPRoute`.

## Automatic connection information

When dependencies or addons are enabled, the notes output automatically includes a "Connection Information" section with:

Supported dependencies:

- **MariaDB**: Host, port, database, username, connection URLs, JDBC URLs.
- **PostgreSQL** (the `postgresql` dependency, in `operator` or `standalone` mode): Host, port, database, username, connection URLs, JDBC URLs, and the read-only URL when the CNPG pooler has `createRO` enabled.
- **Valkey**: Host, port (from the `valkey` dependency).
- **MongoDB**: Host, port, database, username, connection URLs, JDBC URLs.
- **Clickhouse**: Host, port, database, username, connection URLs, JDBC URLs.

Supported addons:

- **Tailscale**: Status, routes, userspace mode.
- **Code-Server**: Status, port.
- **Netshoot**: Status.

The notes are rendered in the order: header, custom, connections, footer, warnings.
