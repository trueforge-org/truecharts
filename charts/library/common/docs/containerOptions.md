---
title: Containeroptions
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/containerOptions#full-examples) section for complete examples.

:::

## Appears in

- `.Values.containerOptions`

---

## `containerOptions`

Options that apply to all containers, unless overridden at the container level See more info about containerOptions [documentation](/truecharts-common/containeroptions)

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `containerOptions` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `containerOptions.NVIDIA_CAPS`

Defines the NVIDIA_CAPS to be passed as an environment variable to the container.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `containerOptions.NVIDIA_CAPS` |
| Type       | `list of string`               |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `"[\"all\"]"`                  |

Example

```yaml
containerOptions:
  NVIDIA_CAPS: ["all"]
```

---

## Full Examples

```yaml
containerOptions:
  NVIDIA_CAPS:
    - compute
    - utility
```
