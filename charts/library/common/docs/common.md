---
title: Common
---

:::note

- See the [Full Examples](/truecharts-common/common#full-examples) section for complete examples.

:::

:::warning

These keys are only for the internal use of common. Do not use them in charts that are based on common: they can change or be removed at any time, without a breaking change.

:::

## Appears in

- `.Values.common`

---

## `common`

Values merged into the common defaults before the values of the chart. Takes the same values as the chart itself.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `common` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

`common` is merged into the defaults of the library before the values of the chart. In a chart that depends on `common`, Helm puts the values for the library under this key, and it takes the same values as the chart itself:

```yaml
common:
  TZ: Europe/Amsterdam
  podOptions:
    enableServiceLinks: false
  securityContext:
    pod:
      fsGroup: 1000
```
