---
title: Image
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/image#full-examples) section for complete examples.

:::

## Appears in

- `.Values.image`

---

## `image`

Defines the image details

| Field      | Value   |
| ---------- | ------- |
| Key        | `image` |
| Type       | `map`   |
| Required   | ❌      |
| Helm `tpl` | ❌      |
| Default    | unset   |

---

### `image.pullPolicy`

Defines the image pull policy

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `image.pullPolicy` |
| Type       | `string`           |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `"IfNotPresent"`   |

Example

```yaml
image:
  pullPolicy: IfNotPresent
```

---

### `image.repository`

Defines the image repository

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `image.repository` |
| Type       | `string`           |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `""`               |

Example

```yaml
image:
  repository: ""
```

---

### `image.tag`

Defines the image tag

| Field      | Value       |
| ---------- | ----------- |
| Key        | `image.tag` |
| Type       | `string`    |
| Required   | ❌          |
| Helm `tpl` | ❌          |
| Default    | `""`        |

Example

```yaml
image:
  tag: ""
```

---
