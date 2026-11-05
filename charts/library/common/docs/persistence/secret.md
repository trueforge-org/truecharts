---
title: Secret
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/secret#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: secret`.

:::

## Appears in

- `.Values.persistence.$name`

---

## `objectName`

Name of the Secret or ConfigMap to mount. Only for `type: secret` and `type: configmap`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.objectName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `configmap`, `secret` |

---

## `expandObjectName`

Prefix `objectName` with the release fullname. Set to `false` for an object that is not created by this chart. Only for `type: secret` and `type: configmap`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `configmap`, `secret` |

---

## `optional`

Allow the pod to start when the Secret or ConfigMap does not exist. Only for `type: secret` and `type: configmap`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `configmap`, `secret` |

---

## `defaultMode`

Permission mode of the files in the volume, as a quoted octal string. Only for `type: secret` and `type: configmap`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.defaultMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `configmap`, `secret` |

Example

```yaml
persistence:
  example:
    defaultMode: '0644'
```

---

## `items`

Keys of the Secret or ConfigMap to project, each to its own file. Without items, all keys are mounted.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.items` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `configmap`, `secret` |

---

## `items[]`

A key of the Secret or ConfigMap and the file it is mounted as.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `items[].path`

Relative path of the file the key is mounted as.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `configmap`, `secret` |

---

## `items[].key`

Key of the Secret or ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.items[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `configmap`, `secret` |

---

## Full Examples

### Whole secret

```yaml
persistence:
  secret-vol:
    enabled: true
    type: secret
    objectName: secret-name
    mountPath: /secrets
    targetSelectAll: true
```

### Selected items

```yaml
persistence:
  secret-vol:
    enabled: true
    type: secret
    # This will be expanded to 'fullname-secret-name' unless expandObjectName is false
    objectName: secret-name
    expandObjectName: false
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
    targetSelector:
      workload-name:
        container-name:
          mountPath: /secrets
          readOnly: true
```
