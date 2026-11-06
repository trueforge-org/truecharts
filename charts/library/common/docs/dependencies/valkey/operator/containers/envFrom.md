---
title: envFrom
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/envFrom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].envFrom`

---

## `envFrom`

Sources of environment variables of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

Source of environment variables of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].prefix`

Prefix added to the names of the variables.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].prefix` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef`

ConfigMap to take the variables from.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef.name`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].configMapRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef.optional`

Whether the ConfigMap may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].configMapRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef`

Secret to take the variables from.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef.name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].secretRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef.optional`

Whether the Secret may be missing.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].envFrom[].secretRef.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
dependencies:
  valkey:
    operator:
      containers:
        - envFrom:
            - prefix: example
              configMapRef:
                name: example
                optional: true
```
