---
title: target
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.externalSecret.$name.target`

---

## `target`

The Kubernetes Secret created by the External Secrets Operator.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `name`

Name of the Secret the External Secrets Operator creates. Supports Helm `tpl`. Defaults to the name of the ExternalSecret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `creationPolicy`

How the External Secrets Operator creates and owns the Secret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.creationPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Owner"` |
| Allowed values | `"Owner"`, `"Orphan"`, `"Merge"`, `"None"` |

---

## `deletionPolicy`

What happens to the Secret when the data is removed from the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.deletionPolicy` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `null`, `""`, `"Delete"`, `"Merge"`, `"Retain"` |

---

## `immutable`

Create the Secret as immutable.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.immutable` |
| Type | `null or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template`

Template for the created Secret, passed as is. External Secrets Operator evaluates its own Go templates in here.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.type`

Type of the created Secret, eg `Opaque`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.engineVersion`

Version of the template engine of the External Secrets Operator, eg `v2`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.engineVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
externalSecret:
  example:
    target:
      template:
        engineVersion: v2
```

---

## `template.mergePolicy`

How the template is merged with the fetched data, eg `Replace` or `Merge`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.mergePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
externalSecret:
  example:
    target:
      template:
        mergePolicy: Replace
```

---

## `template.data`

Keys of the created Secret, keyed by name. Values are Go templates evaluated by the External Secrets Operator.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.data` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.data.$name`

Template of the key.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.data.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.templateFrom`

Templates loaded from ConfigMaps or Secrets, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.templateFrom` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.metadata`

Metadata of the created Secret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.metadata` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.metadata.annotations`

Annotations of the created Secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.metadata.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `template.metadata.labels`

Labels of the created Secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.metadata.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
