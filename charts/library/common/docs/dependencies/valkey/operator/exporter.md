---
title: Exporter
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/exporter#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.exporter`

---

## `dependencies.valkey.operator.exporter`

No description provided.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.valkey.operator.exporter` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `dependencies.valkey.operator.exporter.args`

Command-line arguments of the exporter.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.operator.exporter.args` |
| Type       | `list of string`                             |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | `[]`                                         |

Example

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        args:
          []
```

---

### `dependencies.valkey.operator.exporter.enabled`

Whether the exporter sidecar runs.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `dependencies.valkey.operator.exporter.enabled` |
| Type       | `boolean`                                       |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | `true`                                          |

Example

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        enabled: true
```

---

### `dependencies.valkey.operator.exporter.imageSelector`

Image of the exporter, the name of an image on the root of the values.

| Field      | Value                                                 |
| ---------- | ----------------------------------------------------- |
| Key        | `dependencies.valkey.operator.exporter.imageSelector` |
| Type       | `string`                                              |
| Required   | ❌                                                    |
| Helm `tpl` | ❌                                                    |
| Default    | `"valkeyExporterImage"`                               |

Example

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        imageSelector: valkeyExporterImage
```

---

### `dependencies.valkey.operator.exporter.resources`

Resources of the exporter container.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.valkey.operator.exporter.resources` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `{}`                                              |

Example

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        resources:
          {}
```

---

### `dependencies.valkey.operator.exporter.securityContext`

Security context of the exporter container.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.exporter.securityContext` |
| Type       | `map`                                                   |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | `{}`                                                    |

Example

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        securityContext:
          {}
```

---
