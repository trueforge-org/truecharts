---
title: envFrom
---

:::note

- See the [Full Examples](/truecharts-common/cnpg/cluster/envFrom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.cluster.envFrom`

---

## `envFrom`

ConfigMaps and Secrets whose keys become environment variables of the PostgreSQL instances. See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom).

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom` |
| Type | `list of map or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `[]`

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef`

A ConfigMap whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the configmap name

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[].configMapRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[].configMapRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef`

A Secret whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[].secretRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the secret name

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.cluster.envFrom[].secretRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### ConfigMap and Secret

Adds the keys of a ConfigMap and a Secret as environment variables of the PostgreSQL instances. The Secret name is not expanded with the fullname:

```yaml
cnpg:
  main:
    enabled: true
    cluster:
      envFrom:
        - configMapRef:
            name: postgres-settings
        - secretRef:
            name: postgres-extra
            expandObjectName: false
```
