---
title: Configmap
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/configmap#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.configmap`

---

## `persistence.configmap`

Create Configmap objects

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `persistence.configmap` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `persistence.configmap.$name.annotations`

Additional annotations for configmap

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `persistence.configmap.$name.annotations` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `persistence.configmap.$name.data`

Create Configmap objects

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `persistence.configmap.$name.data` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `persistence.configmap.$name.enabled`

Enables or Disables the Configmap

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `persistence.configmap.$name.enabled` |
| Type       | `boolean, string`                     |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `persistence.configmap.$name.labels`

Additional labels for configmap

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `persistence.configmap.$name.labels` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `persistence.configmap.$name.namespace`

Define the namespace for this object

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `persistence.configmap.$name.namespace` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

## Full Examples

```yaml
persistence:
  configmap-vol:
    enabled: true
    type: configmap
    objectName: configmap-name
    expandObjectName: false
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
```
