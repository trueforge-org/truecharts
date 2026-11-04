---
title: Diagnosticmode
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/diagnosticMode#full-examples) section for complete examples.

:::

## Appears in

- `.Values.diagnosticMode`

---

## `diagnosticMode`

Configuration for `diagnosticMode`.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `diagnosticMode` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `diagnosticMode.enabled`

Run the containers with a sleep command instead of the app, to debug them.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `diagnosticMode.enabled` |
| Type       | `boolean, string`        |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---
