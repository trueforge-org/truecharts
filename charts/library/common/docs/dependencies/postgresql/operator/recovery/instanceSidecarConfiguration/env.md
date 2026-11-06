---
title: env
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/recovery/instanceSidecarConfiguration/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env`

---

## `env`

Environment variables passed to the sidecar container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].value`

Value of the environment variable. Cannot be used together with `valueFrom`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom`

Source for the environment variable's value. Cannot be used if `value` is set.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef`

Selects a key of a ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef.key`

The key to select from the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef.optional`

Whether the ConfigMap or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.configMapKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fieldRef`

Selects a field of the Pod.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fieldRef.apiVersion`

Version of the schema the field path is written in, defaults to `v1`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fieldRef.fieldPath`

Path of the Pod field to select.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fileKeyRef`

Selects a key of an env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fileKeyRef.key`

The key within the env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fileKeyRef.optional`

Whether the file or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fileKeyRef.path`

Path within the volume to select the file from. Must be relative.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fileKeyRef.volumeName`

Name of the volume mount containing the env file.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.fileKeyRef.volumeName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef`

Selects a resource of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef.containerName`

Container name, optional for env vars.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef.divisor`

Output format of the exposed resource, defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.divisor` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef.resource`

Resource to select, such as `limits.cpu` or `requests.memory`.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.resourceFieldRef.resource` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef`

Selects a key of a Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef.key`

The key of the Secret to select from.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef.optional`

Whether the Secret or its key must exist.

| Field | Value |
| --- | --- |
| Key | `dependencies.postgresql.operator.recovery.instanceSidecarConfiguration.env[].valueFrom.secretKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Plain value

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      mode: recovery
      recovery:
        method: object_store
        credentials: my-s3
        serverName: previous-cluster
        instanceSidecarConfiguration:
          env:
            - name: AWS_REQUEST_CHECKSUM_CALCULATION
              value: when_required
```

### Value from a Secret and from the pod

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      mode: recovery
      recovery:
        method: object_store
        credentials: my-s3
        serverName: previous-cluster
        instanceSidecarConfiguration:
          env:
            - name: AWS_CA_BUNDLE_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: my-ca-secret
                  key: password
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
```
