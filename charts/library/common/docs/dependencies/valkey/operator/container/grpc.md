---
title: Grpc
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/container/grpc#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.container.grpc`

---

## `dependencies.valkey.operator.container.grpc`

gRPC health check of the container.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.grpc` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `dependencies.valkey.operator.container.grpc.mode`

Whether the connection uses TLS.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.grpc.mode` |
| Type       | `string`                                           |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |
| Enum       | `Plaintext`, `TLS`                                 |

---

### `dependencies.valkey.operator.container.grpc.port`

Port of the gRPC server.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.grpc.port` |
| Type       | `integer`                                          |
| Required   | ✅                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |
| Minimum    | `1`                                                |
| Maximum    | `65535`                                            |

---

### `dependencies.valkey.operator.container.grpc.service`

Name of the service to check.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.container.grpc.service` |
| Type       | `string`                                              |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | unset                                                 |

---
