---
title: Create Chart Context Configmap
---

:::note

- See the [Full Examples](/truecharts-common/createChartContextConfigmap#full-examples) section for complete examples.

:::

## Appears in

- `.Values.createChartContextConfigmap`

---

## `createChartContextConfigmap`

Only used in CI and unit tests. Renders the generated `chartContext` as a ConfigMap named `chart-context`, so the context can be inspected.

| Field | Value |
| --- | --- |
| Key | `createChartContextConfigmap` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
createChartContextConfigmap: false
```
