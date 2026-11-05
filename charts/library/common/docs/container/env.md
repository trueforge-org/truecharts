---
title: Env
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/container/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.env`
- `.Values.workload.$name.podSpec.containers.$name.env`
- `.Values.workload.$name.podSpec.initContainers.$name.env`

---

## `env`

Environment variables, keyed by name. See [env](/truecharts-common/container/env).

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

Environment variable entry by key. A scalar or null is the value, a map holds exactly one of `configMapKeyRef`, `secretKeyRef` or `fieldRef`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name` |
| Type | `number or int or bool or map or null` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.configMapKeyRef`

Use a key of a ConfigMap as value.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.configMapKeyRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.configMapKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.configMapKeyRef.key`

Key in the ConfigMap whose value is used.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.configMapKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.configMapKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretKeyRef`

Use a key of a Secret as value.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretKeyRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.secretKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretKeyRef.key`

Key in the Secret whose value is used.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.secretKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.fieldRef`

Use a field of the pod as value, eg its name or IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.fieldRef.fieldPath`

Path of the field, eg `metadata.name` or `status.podIP`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        env:
          example:
            fieldRef:
              fieldPath: metadata.name
```

---

## `$name.fieldRef.apiVersion`

API version of the field path. Kubernetes uses `v1` when empty.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.cluster.env.$name.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Values

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
            ENV_NAME3: 8080
            ENV_NAME4: true
```

### References

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
            ENV_NAME1:
              configMapKeyRef:
                # This will be expanded to 'fullname-configmap-name'
                name: configmap-name
                key: configmap-key
            ENV_NAME2:
              secretKeyRef:
                name: secret-name
                key: secret-key
                expandObjectName: false
            ENV_NAME3:
              fieldRef:
                fieldPath: metadata.name
                apiVersion: v1
```
