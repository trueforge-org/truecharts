---
title: exporter
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/exporter#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.exporter`

---

## `exporter`

Metrics exporter sidecar of every pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
enabled: true
imageSelector: valkeyExporterImage
args: []
resources: {}
securityContext: {}
```

---

## `enabled`

Whether the exporter sidecar runs.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `imageSelector`

Image of the exporter, the name of an image on the root of the values.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"valkeyExporterImage"` |

---

## `args`

Command-line arguments of the exporter.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.args` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `resources`

Resources of the exporter container.

See [resources](/truecharts-common/dependencies/valkey/operator/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `securityContext`

Security context of the exporter container.

See [securityContext](/truecharts-common/dependencies/valkey/operator/containers/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        enabled: true
```
