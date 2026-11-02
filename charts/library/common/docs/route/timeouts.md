---
title: Timeouts
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/route/timeouts#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.timeouts`

---

## `route.timeouts`

Timeout configuration for an HTTP route.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `route.timeouts` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `route.timeouts.backendRequest`

Timeout for a backend request, expressed as a duration such as `5s`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `route.timeouts.backendRequest` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `route.timeouts.request`

Timeout for the complete request, expressed as a duration such as `10s`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `route.timeouts.request` |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---
