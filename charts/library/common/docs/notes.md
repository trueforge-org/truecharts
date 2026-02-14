---
title: Notes
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/notes#full-examples) section for complete examples.

:::

## Appears in

- `.Values.notes`

---

## `notes`

Define values for `NOTES.txt`

| Field      | Value   |
| ---------- | ------- |
| Key        | `notes` |
| Type       | `map`   |
| Required   | ❌      |
| Helm `tpl` | ❌      |
| Default    | `{}`    |

Example

```yaml
notes:
  {}
```

---

### `notes.custom`

Define values for `NOTES.txt`

| Field      | Value          |
| ---------- | -------------- |
| Key        | `notes.custom` |
| Type       | `string`       |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | `""`           |

Example

```yaml
notes:
  custom: ""
```

---

### `notes.footer`

Define values for `NOTES.txt`

| Field      | Value          |
| ---------- | -------------- |
| Key        | `notes.footer` |
| Type       | `string`       |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | See schema     |

Example

```yaml
notes:
  footer: "# Documentation\nDocumentation for this chart can be found at ...\n# Bug reports\nIf you find a bug in this chart, please file an issue at ...\n"
```

---

### `notes.header`

Define values for `NOTES.txt`

| Field      | Value                                                                         |
| ---------- | ----------------------------------------------------------------------------- |
| Key        | `notes.header`                                                                |
| Type       | `string`                                                                      |
| Required   | ❌                                                                            |
| Helm `tpl` | ❌                                                                            |
| Default    | `"# Welcome to TrueCharts!\nThank you for installing <{{ .Chart.Name }}>.\n"` |

Example

```yaml
notes:
  header: "# Welcome to TrueCharts!\nThank you for installing <{{ .Chart.Name }}>.\n"
```

---

### `notes.warnings`

Configuration for `notes.warnings`.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `notes.warnings`  |
| Type       | `list of unknown` |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

## Full Examples

```yaml
notes:
  custom: |
    This is a custom message
```
