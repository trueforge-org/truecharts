---
title: Emptydir
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/emptyDir#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.emptyDir`

---

## `persistence.emptyDir`

Configuration for `persistence` entries with `type: emptyDir`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `persistence.emptyDir` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

## Full Examples

```yaml
persistence:
  emptyDir-vol:
    enabled: true
    type: emptyDir
    medium: Memory
    size: 2Gi
```
