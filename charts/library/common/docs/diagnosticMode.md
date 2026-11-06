---
title: Diagnostic Mode
---

:::note

- See the [Full Examples](/truecharts-common/diagnosticMode#full-examples) section for complete examples.

:::

## Appears in

- `.Values.diagnosticMode`

---

## `diagnosticMode`

Run the containers with a sleep command instead of the app, so you can exec into them to debug.

| Field | Value |
| --- | --- |
| Key | `diagnosticMode` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `enabled`

Run the containers with a sleep command instead of the app, so you can exec into them to debug. Probes are disabled while it is on.

| Field | Value |
| --- | --- |
| Key | `diagnosticMode.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

Runs the containers with a sleep command instead of the app, so you can `exec` into them. The probes are disabled meanwhile:

```yaml
diagnosticMode:
  enabled: true
```

To do the same for the chart and all of its dependencies, use `global.diagnosticMode.enabled`.
