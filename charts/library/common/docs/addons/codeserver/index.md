---
title: Codeserver
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/codeserver#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver`

---

## `addons.codeserver`

Configuration for the code-server addon.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `addons.codeserver` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `addons.codeserver.container`

No description provided.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `addons.codeserver.container` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `addons.codeserver.enabled`

Enable the code-server addon.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.codeserver.enabled` |
| Type       | `boolean, string`           |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `false`                     |

Example

```yaml
addons:
  codeserver:
    enabled: false
```

---

### `addons.codeserver.ingress`

Ingress of the code-server addon. Either one Ingress object, or named Ingress objects next to `enabled`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.codeserver.ingress` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `addons.codeserver.route`

Gateway API route of the code-server addon, the same as a `route.<name>` of the chart. It defaults to the `codeserver` service and port, and is the primary route when no other route is primary. Select the gateway with `gateway`, `parentRefs` or `listenerSet`.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `addons.codeserver.route` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `addons.codeserver.service`

Service of the code-server addon. Either one Service object, or named Service objects next to `enabled`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `addons.codeserver.service` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `addons.codeserver.targetSelector`

Workloads to which the code-server addon is attached. Defaults to `main`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `addons.codeserver.targetSelector` |
| Type       | `list of string`                   |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

## Child Pages

- [Container](container/)

---
