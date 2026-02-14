---
title: Env
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/initContainers/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.initContainers.env`

---

## `workload.podSpec.initContainers.env`

Shared schema for environment variable maps used across common templates.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `workload.podSpec.initContainers.env` |
| Type       | `map, null`                           |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `workload.podSpec.initContainers.env.$name.configMapKeyRef`

Reference an entry from a ConfigMap.

| Field      | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.env.$name.configMapKeyRef` |
| Type       | `map`                                                       |
| Required   | ❌                                                          |
| Helm `tpl` | ❌                                                          |
| Default    | unset                                                       |

---

### `workload.podSpec.initContainers.env.$name.fieldRef`

Reference a field from the Pod metadata/spec.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.env.$name.fieldRef` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `workload.podSpec.initContainers.env.$name.secretKeyRef`

Reference an entry from a Secret.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.env.$name.secretKeyRef` |
| Type       | `map`                                                    |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `workload.podSpec.initContainers.env.$name.value`

Direct value for the environment variable.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `workload.podSpec.initContainers.env.$name.value` |
| Type       | `string`                                          |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          env:
            ENV_NAME1: ENV_VALUE
            ENV_NAME2: "{{ .Values.some.path }}"
            ENV_NAME3:
              configMapKeyRef:
                # This will be expanded to 'fullname-configmap-name'
                name: configmap-name
                key: configmap-key
            ENV_NAME4:
              secretKeyRef:
                name: secret-name
                key: secret-key
                expandObjectName: false
            ENV_NAME5:
              fieldRef:
                fieldPath: metadata.name
                apiVersion: v1
```
