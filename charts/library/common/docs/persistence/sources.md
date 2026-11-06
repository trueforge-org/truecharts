---
title: sources
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/sources#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.sources`

---

## `sources`

Sources of a projected volume. Only for `type: projected`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A source of the projected volume. Set one of `serviceAccountToken`, `secret`, `configMap` or `downwardAPI`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].serviceAccountToken`

Project a ServiceAccount token.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].serviceAccountToken.audience`

Intended audience of the token. Defaults to the audience of the API server.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken.audience` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].serviceAccountToken.expirationSeconds`

Requested lifetime of the token in seconds, at least `600`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken.expirationSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 600 to … |

Example

```yaml
persistence:
  example:
    sources:
      - serviceAccountToken:
          expirationSeconds: 3600
```

---

## `[].serviceAccountToken.path`

Path of the token file in the volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].serviceAccountToken.path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret`

Project keys of a Secret.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.objectName`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.objectName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.optional`

Allow the pod to start when the Secret does not exist.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.expandObjectName`

Prefix `objectName` with the release fullname.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.items`

Keys of the Secret to project. Without items, all keys are projected.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.items[]`

A key of the Secret and the file it is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.items[].key`

Key of the Secret.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secret.items[].path`

Relative path of the file the key is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].secret.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap`

Project keys of a ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.objectName`

Name of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.objectName` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.optional`

Allow the pod to start when the ConfigMap does not exist.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.optional` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.expandObjectName`

Prefix `objectName` with the release fullname.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.items`

Keys of the ConfigMap to project. Without items, all keys are projected.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.items[]`

A key of the ConfigMap and the file it is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.items[].key`

Key of the ConfigMap.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMap.items[].path`

Relative path of the file the key is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].configMap.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI`

Project fields of the pod or resources of a container as files.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items`

Fields to project.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[]`

A field of the pod or a container resource, and the file it is projected to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].path`

Relative path of the file in the volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].fieldRef`

A field of the pod to expose.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].fieldRef.apiVersion`

API version of the field path. Defaults to `v1`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].fieldRef.fieldPath`

Path of the pod field to expose, eg `metadata.name`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].fieldRef.fieldPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].resourceFieldRef`

A resource of a container to expose.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].resourceFieldRef.containerName`

Name of the container the resource belongs to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef.containerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].resourceFieldRef.resource`

Resource to expose, eg `limits.cpu` or `requests.memory`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef.resource` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].downwardAPI.items[].resourceFieldRef.divisor`

Unit the resource is exposed in, eg `1Mi`. Defaults to `1`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.sources[].downwardAPI.items[].resourceFieldRef.divisor` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  projected-vol:
    sources:
      - secret:
          objectName: secret-name
          optional: false
          items:
            - key: key1
              path: secret/key1
      - configMap:
          objectName: configmap-name
          expandObjectName: true
          items:
            - key: key2
              path: config/key2
      - serviceAccountToken:
          audience: some-audience
          expirationSeconds: 3600
          path: token
      - downwardAPI:
          items:
            - path: labels
              fieldRef:
                fieldPath: metadata.labels
            - path: cpu-limit
              resourceFieldRef:
                containerName: container-name
                resource: limits.cpu
                divisor: 1m
```
