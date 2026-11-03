---
title: Poddisruptionbudget
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/podDisruptionBudget#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podDisruptionBudget`

---

## `podDisruptionBudget`

Create Pod Disruption Budget objects

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `podDisruptionBudget` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `podDisruptionBudget.$name.annotations`

Additional annotations for Pod Disruption Budget

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `podDisruptionBudget.$name.annotations` |
| Type       | `map, string`                           |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `{}`                                    |

Example

```yaml
podDisruptionBudget:
  $name:
    annotations:
      {}
```

---

### `podDisruptionBudget.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `podDisruptionBudget.$name.annotationsList` |
| Type       | `list of map`                               |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `podDisruptionBudget.$name.customLabels`

Custom labels used to select the pods covered by this Pod Disruption Budget, replacing the automatically selected pod labels

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `podDisruptionBudget.$name.customLabels` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `podDisruptionBudget.$name.enabled`

Create Pod Disruption Budget objects

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `podDisruptionBudget.$name.enabled` |
| Type       | `boolean, string`                   |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `false`                             |

Example

```yaml
podDisruptionBudget:
  $name:
    enabled: false
```

---

### `podDisruptionBudget.$name.labels`

Additional labels for Pod Disruption Budget

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `podDisruptionBudget.$name.labels` |
| Type       | `map, string`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `{}`                               |

Example

```yaml
podDisruptionBudget:
  $name:
    labels:
      {}
```

---

### `podDisruptionBudget.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `podDisruptionBudget.$name.labelsList` |
| Type       | `list of map`                          |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `podDisruptionBudget.$name.maxUnavailable`

Define the maxUnavailable.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `podDisruptionBudget.$name.maxUnavailable` |
| Type       | `integer, string`                          |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `""`                                       |

Example

```yaml
podDisruptionBudget:
  $name:
    maxUnavailable: ""
```

---

### `podDisruptionBudget.$name.minAvailable`

Define the minAvailable.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `podDisruptionBudget.$name.minAvailable` |
| Type       | `integer, string`                        |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `""`                                     |

Example

```yaml
podDisruptionBudget:
  $name:
    minAvailable: ""
```

---

### `podDisruptionBudget.$name.namespace`

Define the namespace for this object

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `podDisruptionBudget.$name.namespace` |
| Type       | `string`                              |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `""`                                  |

Example

```yaml
podDisruptionBudget:
  $name:
    namespace: ""
```

---

### `podDisruptionBudget.$name.targetSelector`

Configuration for `podDisruptionBudget.main.targetSelector`.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `podDisruptionBudget.$name.targetSelector` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `podDisruptionBudget.$name.unhealthyPodEvictionPolicy`

Create Pod Disruption Budget objects

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `podDisruptionBudget.$name.unhealthyPodEvictionPolicy` |
| Type       | `string`                                               |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | `""`                                                   |
| Enum       | `IfHealthyBudget`, `AlwaysAllow`                       |

Example

```yaml
podDisruptionBudget:
  $name:
    unhealthyPodEvictionPolicy: ""
```

---

## Full Examples

```yaml
podDisruptionBudget:
  pdb-name:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    minAvailable: 1
    unhealthyPodEvictionPolicy: IfHealthyBudget

  other-pdb-name:
    enabled: true
    namespace: some-namespace
    minAvailable: 1
```
