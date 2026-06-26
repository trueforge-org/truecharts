---
title: Ports
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/service/ports#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.ports`

---

## `service.ports`

Define the port dict

| Field      | Value           |
| ---------- | --------------- |
| Key        | `service.ports` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

---

### `service.ports.enabled`

Configuration for `service.main.ports.main.enabled`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `service.ports.enabled` |
| Type       | `boolean, string`       |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `service.ports.hostPort`

Define the hostPort, should be **avoided**, unless **ABSOLUTELY** necessary

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `service.ports.hostPort` |
| Type       | `integer, string`        |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `service.ports.nodePort`

Define the node port that will be exposed on the node

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `service.ports.nodePort` |
| Type       | `integer, string`        |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `service.ports.port`

Define the port that will be exposed by the service

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `service.ports.port` |
| Type       | `integer, string`    |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |
| Minimum    | `1`                  |

---

### `service.ports.primary`

Configuration for `service.main.ports.main.primary`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `service.ports.primary` |
| Type       | `boolean`               |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `service.ports.protocol`

Define the port protocol Used by the container ports and probes, http and https are converted to tcp where needed

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `service.ports.protocol`      |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |
| Enum       | `tcp`, `udp`, `http`, `https` |

---

### `service.ports.targetPort`

Define the target port (No named ports)

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `service.ports.targetPort` |
| Type       | `integer, string`          |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `service.ports.targetSelector`

Define the port dict

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `service.ports.targetSelector` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

## Full Examples

Full examples can be found under each service type

- [ClusterIP](/truecharts-common/service/clusterip)
- [LoadBalancer](/truecharts-common/service/loadbalancer)
- [NodePort](/truecharts-common/service/nodeport)
- [ExternalName](/truecharts-common/service/externalname)
- [ExternalIP](/truecharts-common/service/externalip)
