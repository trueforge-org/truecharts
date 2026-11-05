---
title: env
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.addons.codeserver.container.env`

---

## `env`

Environment variables of the code-server container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `PORT`

Code-server port.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.PORT` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `DEFAULT_WORKSPACE`

Default workspace path.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.DEFAULT_WORKSPACE` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

Environment variable entry by key. A scalar or null is the value, a map holds exactly one of `configMapKeyRef`, `secretKeyRef` or `fieldRef`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name` |
| Type | `number or int or bool or map or null` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.configMapKeyRef`

Use a key of a ConfigMap as value.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.configMapKeyRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.configMapKeyRef.key`

Key in the ConfigMap whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.configMapKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.configMapKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretKeyRef`

Use a key of a Secret as value.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretKeyRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretKeyRef.key`

Key in the Secret whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.secretKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.fieldRef`

Use a field of the pod as value, eg its name or IP.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.fieldRef.fieldPath`

Path of the field, eg `metadata.name` or `status.podIP`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.$name.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
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
| Key | `addons.codeserver.container.env.$name.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
