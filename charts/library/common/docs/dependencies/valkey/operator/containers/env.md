---
title: env
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].env`

---

## `env`

Environment variables of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].value`

Value of the environment variable. Not used with `valueFrom`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom`

Source of the value of the environment variable.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fieldRef`

Field of the pod to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fieldRef.apiVersion`

Version of the schema the field path is written in.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.fieldRef.fieldPath`

Path of the field of the pod to read, for example `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef`

Resource of the container to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef.containerName`

Name of the container the resource belongs to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef.resource`

Name of the resource to read, for example `limits.cpu`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef.resource` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.resourceFieldRef.divisor`

Unit of the value the resource is divided by.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.resourceFieldRef.divisor` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef`

Key of a ConfigMap to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef.key`

Key of the ConfigMap to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.configMapKeyRef.optional`

Whether the ConfigMap or the key may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.configMapKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef`

Key of a Secret to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef.key`

Key of the Secret to read.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].valueFrom.secretKeyRef.optional`

Whether the Secret or the key may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].env[].valueFrom.secretKeyRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Values and references

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          env:
            - name: LOG_LEVEL
              value: info
            - name: VALKEY_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: app-valkey-password
                  key: password
            - name: SHIPPER_ENDPOINT
              valueFrom:
                configMapKeyRef:
                  name: shipper-config
                  key: endpoint
                  optional: true
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  apiVersion: v1
                  fieldPath: metadata.name
```

### Resource field reference

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          resources:
            limits:
              memory: 128Mi
          env:
            - name: MEMORY_LIMIT
              valueFrom:
                resourceFieldRef:
                  containerName: log-shipper
                  resource: limits.memory
                  divisor: 1Mi
```
