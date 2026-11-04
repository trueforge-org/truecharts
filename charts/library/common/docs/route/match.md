---
title: Match
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/route/match#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.match`

---

## `route.match`

A match condition for an HTTP or gRPC route.

| Field      | Value         |
| ---------- | ------------- |
| Key        | `route.match` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | unset         |

---

### `route.match.headers`

Headers the request has to match.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `route.match.headers` |
| Type       | `list of map`         |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `route.match.method`

HTTP method of the request, or the gRPC service and method.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `route.match.method` |
| Type       | `map, string`        |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `route.match.path`

Path condition for the match.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `route.match.path` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `route.match.queryParams`

Query parameters the request has to match.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `route.match.queryParams` |
| Type       | `list of map`             |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---
