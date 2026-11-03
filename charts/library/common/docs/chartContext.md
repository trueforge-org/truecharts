---
title: Chartcontext
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/chartContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.chartContext`

---

## `chartContext`

Configuration for `chartContext`.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `chartContext` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

---

### `chartContext.appUrl`

Configuration for `chartContext.appUrl`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `chartContext.appUrl` |
| Type       | `string`              |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `chartContext.internalUrls`

Configuration for `chartContext.internalUrls`. Set by the library, which appends the internal URLs of the services.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `chartContext.internalUrls` |
| Type       | `list of string`            |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `chartContext.podCIDR`

Configuration for `chartContext.podCIDR`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `chartContext.podCIDR` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `chartContext.svcCIDR`

Configuration for `chartContext.svcCIDR`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `chartContext.svcCIDR` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---
