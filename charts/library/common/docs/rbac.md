---
title: Rbac
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/rbac#full-examples) section for complete examples.

:::

## Appears in

- `.Values.rbac`

---

## `rbac`

Create rbac objects

| Field      | Value  |
| ---------- | ------ |
| Key        | `rbac` |
| Type       | `map`  |
| Required   | ❌     |
| Helm `tpl` | ❌     |
| Default    | unset  |

---

### `rbac.$name.allServiceAccounts`

Whether to assign all service accounts or not to the (Cluster)RoleBinding

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `rbac.$name.allServiceAccounts` |
| Type       | `boolean`                       |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `rbac.$name.annotations`

Additional annotations for rbac

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `rbac.$name.annotations` |
| Type       | `map, string`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
rbac:
  $name:
    annotations:
      {}
```

---

### `rbac.$name.clusterWide`

Sets the rbac as cluster wide (ClusterRole, ClusterRoleBinding)

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `rbac.$name.clusterWide` |
| Type       | `boolean`                |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `false`                  |

Example

```yaml
rbac:
  $name:
    clusterWide: false
```

---

### `rbac.$name.enabled`

Enables or Disables the rbac

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `rbac.$name.enabled` |
| Type       | `boolean, string`    |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
rbac:
  $name:
    enabled: false
```

---

### `rbac.$name.labels`

Additional labels for rbac

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `rbac.$name.labels` |
| Type       | `map, string`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | `{}`                |

Example

```yaml
rbac:
  $name:
    labels:
      {}
```

---

### `rbac.$name.namespace`

Define the namespace for this object (Only when clusterWide is false)

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `rbac.$name.namespace` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `""`                   |

Example

```yaml
rbac:
  $name:
    namespace: ""
```

---

### `rbac.$name.primary`

Sets the rbac as primary

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `rbac.$name.primary` |
| Type       | `boolean`            |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
rbac:
  $name:
    primary: false
```

---

### `rbac.$name.rules`

Define the `rules` for the (Cluster)Role

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `rbac.$name.rules` |
| Type       | `list of map`      |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `[]`               |

Example

```yaml
rbac:
  $name:
    rules:
      []
```

---

### `rbac.$name.serviceAccounts`

Define the service account(s) to assign the (Cluster)RoleBinding

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `rbac.$name.serviceAccounts`           |
| Type       | `list of unknown, list of string, map` |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `[]`                                   |

Example

```yaml
rbac:
  $name:
    serviceAccounts:
      []
```

---

### `rbac.$name.subjects`

Define `subjects` for (Cluster)RoleBinding

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `rbac.$name.subjects` |
| Type       | `list of unknown`     |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `[]`                  |

Example

```yaml
rbac:
  $name:
    subjects:
      []
```

---

## Full Examples

```yaml
rbac:
  rbac-name:
    enabled: true
    primary: true
    clusterWide: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    allServiceAccounts: true
    rules:
      - apiGroups:
          - ""
        resources:
          - "{{ .Values.some.value }}"
        resourceNames:
          - "{{ .Values.some.value }}"
        verbs:
          - get
          - "{{ .Values.some.value }}"
          - watch
    subjects:
      - kind: my-kind
        name: "{{ .Values.some.value }}"
        apiGroup: my-api-group

  other-rbac-name:
    enabled: true
    namespace: some-namespace
    serviceAccounts:
      - service-account-name
    rules:
      - apiGroups:
          - ""
        resources:
          - pods
        verbs:
          - get
          - list
          - watch
    subjects:
      - kind: my-kind
        name: my-name
        apiGroup: my-api-group
```
