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

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          envFrom:
            - configMapRef:
                name: shipper-config
            - prefix: VALKEY_
              secretRef:
                name: app-valkey-credentials
                optional: true
```
